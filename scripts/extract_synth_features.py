import os
import re
import csv
import pandas as pd

LOG_DIR = os.path.join(os.path.dirname(__file__), "..", "synth")
LOG_DIR = os.path.abspath(LOG_DIR)

OUTPUT_DIR = os.path.join(os.path.dirname(__file__), "..", "data", "synthesis_features")
os.makedirs(OUTPUT_DIR, exist_ok=True)
OUTPUT_CSV = os.path.join(OUTPUT_DIR, "synthesis_operator_features.csv")

rows = []

for file_name in os.listdir(LOG_DIR):
    if not file_name.endswith(".log"):
        continue

    file_path = os.path.join(LOG_DIR, file_name)
    with open(file_path, "r") as f:
        data = f.read()

    # ---- Logic gate counts ----
    num_AND  = len(re.findall(r"\bAND\b", data))
    num_OR   = len(re.findall(r"\bOR\b", data))
    num_XOR  = len(re.findall(r"\bXOR\b", data))
    num_NAND = len(re.findall(r"\bNAND\b", data))
    num_NOR  = len(re.findall(r"\bNOR\b", data))
    num_DFF  = len(re.findall(r"\$_DFF", data))  # catch all DFF variants

    # ---- Totals ----
    total_cells = len(re.findall(r"Number of cells:", data))
    total_wires = len(re.findall(r"Number of wires:", data))

    # ---- Area / Timing ----
    area_match = re.search(r"Total area:\s*([\d\.eE\+\-]+)", data)
    delay_match = re.search(r"Critical path:\s*([\d\.eE\+\-]+)", data)
    slack_match = re.search(r"Slack:\s*([\d\.eE\+\-]+)", data)
    power_match = re.search(r"Total power:\s*([\d\.eE\+\-]+)", data)
    cap_match   = re.search(r"Capacitance:\s*([\d\.eE\+\-]+)", data)

    total_area = float(area_match.group(1)) if area_match else None
    critical_path_delay = float(delay_match.group(1)) if delay_match else None
    slack = float(slack_match.group(1)) if slack_match else None
    power = float(power_match.group(1)) if power_match else None
    capacitance = float(cap_match.group(1)) if cap_match else None

    # ---- Additional features from ABC section ----
    logic_levels_match = re.search(r"ABC:.*?levels\s*=\s*(\d+)", data)
    internal_signals_match = re.search(r"ABC:.*?internal\s*=\s*(\d+)", data)

    logic_levels = int(logic_levels_match.group(1)) if logic_levels_match else 0
    internal_signals = int(internal_signals_match.group(1)) if internal_signals_match else 0

    structural_complexity = (num_AND + num_OR + num_XOR + num_NAND +
                             num_NOR + num_DFF + logic_levels + internal_signals)

    rows.append([
        file_name, num_AND, num_OR, num_XOR, num_NAND, num_NOR,
        num_DFF, total_cells, total_wires, total_area,
        critical_path_delay, slack, power, capacitance,
        logic_levels, internal_signals, structural_complexity
    ])

# ---- Save final ML-ready CSV ----
columns = [
    "file_name", "num_AND", "num_OR", "num_XOR", "num_NAND", "num_NOR",
    "num_DFF", "total_cells", "total_wires", "total_area",
    "critical_path_delay", "slack", "power", "capacitance",
    "logic_levels", "internal_signals", "structural_complexity"
]

df = pd.DataFrame(rows, columns=columns)
df.to_csv(OUTPUT_CSV, index=False)

print(f"✅ Extracted synthesis features → {OUTPUT_CSV}")

