import os
import pandas as pd

# -----------------------------
# Helper: Load all CSVs in a folder
# -----------------------------
def load_folder(folder_path):
    csv_files = [f for f in os.listdir(folder_path) if f.endswith(".csv")]
    if not csv_files:
        raise FileNotFoundError(f"No CSV files found in: {folder_path}")

    dfs = []
    for f in csv_files:
        full_path = os.path.join(folder_path, f)
        df = pd.read_csv(full_path)

        # extract design name from filename (before first "_")
        design = f.split("_")[0]
        df["design"] = design

        dfs.append(df)

    return pd.concat(dfs, ignore_index=True)

# -----------------------------
# Folder locations
# -----------------------------
base = "/home/koyel/VLSI_projects/power_estimator/data"

rtl_path      = os.path.join(base, "rtl_vcd_features")
gl_path       = os.path.join(base, "gl_vcd_features")
netlist_path  = os.path.join(base, "gl_netlist_features")
synth_path    = os.path.join(base, "synthesis_features")

# -----------------------------
# Load all dataframes
# -----------------------------
rtl_df     = load_folder(rtl_path)
gl_df      = load_folder(gl_path)
netlist_df = load_folder(netlist_path)
synth_df   = load_folder(synth_path)

# -----------------------------
# Merge everything using "design"
# -----------------------------
# Step-by-step merge (outer → keep all)
merged = rtl_df.merge(gl_df, on="design", how="outer", suffixes=("_rtl", "_gl"))
merged = merged.merge(netlist_df, on="design", how="outer")
merged = merged.merge(synth_df, on="design", how="outer", suffixes=("", "_synth"))

# -----------------------------
# Save final ML-ready CSV
# -----------------------------
output_path = os.path.join(base, "combined_features.csv")
merged.to_csv(output_path, index=False)

print("🔥 Combined CSV successfully created:")
print(output_path)

