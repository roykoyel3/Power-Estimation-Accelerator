"""
extract_gl_features.py
---------------------------------
Extracts glitch-aware switching features from Gate-Level VCD files.
"""

import os
from vcdvcd import VCDVCD
import pandas as pd
import numpy as np


def extract_gl_features(vcd_path, clock_period_ns=10):

    if not os.path.exists(vcd_path):
        raise FileNotFoundError(f"File not found: {vcd_path}")

    # Load VCD
    vcd = VCDVCD(vcd_path, store_tvs=True)

    signals = vcd.signals
    features = []

    # ---------------------------------------------------------
    # Safe unified iterator (supports dict, list, hybrid)
    # ---------------------------------------------------------
    if isinstance(signals, dict):
        iterator = signals.items()

    elif isinstance(signals, list):
        iterator = []
        for s in signals:
            if hasattr(s, "reference"):
                iterator.append((s.reference, s))
            else:
                try:
                    iterator.append((s, vcd[s]))
                except:
                    continue

    else:
        raise TypeError("Unknown VCD signal structure")

    # ---------------------------------------------------------
    # Extract GL-specific features
    # -------------------------------------------------------------
    glitch_threshold = 0.1 * clock_period_ns  # 10% of clock

    for sig_name, sig_data in iterator:

        tv = sig_data.tv
        if len(tv) < 2:
            continue

        total_toggles = 0
        glitch_toggles = 0
        time_high = 0

        total_time = tv[-1][0] - tv[0][0]
        if total_time <= 0:
            continue

        prev_time, prev_val = tv[0]

        for (t, val), (t_next, val_next) in zip(tv[:-1], tv[1:]):

            # duty cycle
            if val == '1':
                time_high += (t_next - t)

            # Count toggles
            if val_next != val:
                total_toggles += 1

                # -----------------------------------------
                # Detect glitch: short duration pulses
                # -----------------------------------------
                if (t_next - t) < glitch_threshold:
                    glitch_toggles += 1

        # Ratios
        non_glitch_toggles = total_toggles - glitch_toggles
        hazard_ratio = glitch_toggles / total_toggles if total_toggles > 0 else 0

        # Rates normalized by total time
        toggle_density = total_toggles / total_time
        effective_activity = non_glitch_toggles / total_time

        # Power proxy features
        glitch_power_proxy = glitch_toggles
        total_power_proxy = total_toggles

        features.append({
            "signal": sig_name,
            "total_toggles": total_toggles,
            "glitch_toggles": glitch_toggles,
            "hazard_ratio": hazard_ratio,
            "toggle_density": toggle_density,
            "effective_activity": effective_activity,
            "duty_cycle": time_high / total_time,
            "glitch_power_proxy": glitch_power_proxy,
            "total_power_proxy": total_power_proxy
        })

    df = pd.DataFrame(features)

    # ---------------------------------------------------------
    # Save CSV
    # ---------------------------------------------------------
    output_dir = os.path.join(os.path.dirname(__file__), "..", "data", "gl_vcd_features")
    output_dir = os.path.abspath(output_dir)
    os.makedirs(output_dir, exist_ok=True)

    base = os.path.basename(vcd_path)
    name = os.path.splitext(base)[0]
    csv_path = os.path.join(output_dir, f"{name}_features.csv")

    df.to_csv(csv_path, index=False)
    print(f"[OK] GL VCD features saved → {csv_path}")

    return df


if __name__ == "__main__":
    extract_gl_features(
        "/home/ishita10/VLSI_projects/power_estimator/sim_gl/seq_detector_gl.vcd",
        clock_period_ns=10
    )
