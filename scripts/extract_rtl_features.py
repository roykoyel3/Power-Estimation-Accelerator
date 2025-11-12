"""
extract_rtl_features.py
---------------------------------
Extracts toggle-based activity features from RTL VCD files.
"""

import os
from vcdvcd import VCDVCD
import pandas as pd
import numpy as np


def extract_rtl_features(vcd_path, clock_freq=None):

    if not os.path.exists(vcd_path):
        raise FileNotFoundError(f"File not found: {vcd_path}")

    vcd = VCDVCD(vcd_path, store_tvs=True)
    features = []

    signals = vcd.signals

    # ---------------------------------------------------------
    # Build a SAFE iterator for ANY VCD format
    # ---------------------------------------------------------
    if isinstance(signals, dict):
        # Format: { "top.sig": sig_obj }
        iterator = signals.items()

    elif isinstance(signals, list):

        if len(signals) == 0:
            raise ValueError("Empty VCD: no signals found.")

        if hasattr(signals[0], "reference"):
            # List of signal objects
            iterator = [(s.reference, s) for s in signals]

        else:
            # ----------------------------------------
            # List of strings → need to map manually
            # ----------------------------------------
            iterator = []
            for name in signals:
                try:
                    sig_obj = vcd[name]
                    iterator.append((name, sig_obj))
                except:
                    continue

    else:
        raise TypeError("Unknown VCD signals structure received.")

    # ---------------------------------------------------------
    # Extract features
    # ---------------------------------------------------------
    for sig_name, sig_data in iterator:

        tv = sig_data.tv
        if len(tv) < 2:
            continue

        total_time = tv[-1][0] - tv[0][0]
        if total_time <= 0:
            continue

        total_toggles = 0
        time_high = 0

        prev_time, prev_val = tv[0]

        for t, val in tv[1:]:

            if prev_val == '1':
                time_high += t - prev_time

            if val != prev_val:
                total_toggles += 1

            prev_time, prev_val = t, val

        duty_cycle = time_high / total_time
        toggle_density = total_toggles / total_time

        if clock_freq:
            activity_factor = total_toggles / (clock_freq * total_time)
        else:
            activity_factor = toggle_density

        avg_toggle_rate = toggle_density

        times = np.array([t for t, _ in tv])
        diffs = np.diff(times)

        if len(diffs) > 0:
            window = max(1, int(0.01 * len(diffs)))
            peak_toggle_rate = max(
                np.convolve(np.ones(window), np.ones_like(diffs), "valid")
            ) / total_time
        else:
            peak_toggle_rate = 0

        features.append({
            "signal": sig_name,
            "total_toggles": total_toggles,
            "avg_toggle_rate": avg_toggle_rate,
            "peak_toggle_rate": peak_toggle_rate,
            "activity_factor": activity_factor,
            "toggle_density": toggle_density,
            "duty_cycle": duty_cycle
        })

    df = pd.DataFrame(features)

    # ---------------------------------------------------------
    # Save CSV
    # ---------------------------------------------------------
    output_dir = os.path.join(os.path.dirname(__file__), "..", "data", "rtl_vcd_features")
    output_dir = os.path.abspath(output_dir)
    os.makedirs(output_dir, exist_ok=True)

    base = os.path.basename(vcd_path)
    name = os.path.splitext(base)[0]
    csv_path = os.path.join(output_dir, f"{name}_features.csv")

    df.to_csv(csv_path, index=False)
    print(f"[OK] RTL VCD features saved → {csv_path}")

    return df


if __name__ == "__main__":
    extract_rtl_features(
        "/home/koyel/VLSI_projects/power_es

