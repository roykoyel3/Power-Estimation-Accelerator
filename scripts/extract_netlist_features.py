import os
import pandas as pd

# ----------------------------------------------------------
# 1. Define input and output paths
# ----------------------------------------------------------
NETLIST_DIR = os.path.join(os.path.dirname(__file__), "..", "gl_netlist")
OUTPUT_DIR = os.path.join(os.path.dirname(__file__), "..", "data", "gl_netlist_features")
OUTPUT_DIR = os.path.abspath(OUTPUT_DIR)
os.makedirs(OUTPUT_DIR, exist_ok=True)

# ----------------------------------------------------------
# 2. Initialize feature storage
# ----------------------------------------------------------
features = []

# ----------------------------------------------------------
# 3. Iterate through all .v files in gl_netlist/
# ----------------------------------------------------------
for file_name in os.listdir(NETLIST_DIR):
    if file_name.endswith(".v"):
        file_path = os.path.join(NETLIST_DIR, file_name)

        with open(file_path, "r") as f:
            content = f.read()

        # -----------------------
        # Operator-level features
        # -----------------------
        xor_count = content.count('^')
        and_count = content.count('&')
        or_count = content.count('|')
        assign_count = content.count('assign')

        # -----------------------
        # Gate-level cell features
        # -----------------------
        gate_types = ['and', 'or', 'xor', 'nand', 'nor', 'xnor', 'buf', 'not']
        gate_counts = {g: content.count(f"{g} ") for g in gate_types}

        # -----------------------
        # Combine features
        # -----------------------
        feat = {
            "file": file_name,
            "xor_operator": xor_count,
            "and_operator": and_count,
            "or_operator": or_count,
            "assign_operator": assign_count,
        }
        feat.update(gate_counts)

        features.append(feat)

# ----------------------------------------------------------
# 4. Save features to CSV
# ----------------------------------------------------------
df = pd.DataFrame(features)
csv_path = os.path.join(OUTPUT_DIR, "netlist_operator_features.csv")
df.to_csv(csv_path, index=False)

print(f"✅ Extracted operator-based and gate-level GL netlist features → {csv_path}")
