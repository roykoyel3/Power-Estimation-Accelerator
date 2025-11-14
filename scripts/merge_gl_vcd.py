import os
import pandas as pd

BASE = os.path.dirname(os.path.abspath(__file__))
GL_DIR = os.path.join(BASE, "..", "data", "gl_vcd_features")

files = [f for f in os.listdir(GL_DIR) if f.endswith(".csv")]

dfs = []
for f in files:
    path = os.path.join(GL_DIR, f)
    df = pd.read_csv(path)
    df["design"] = f.replace("_features.csv", "").replace(".csv", "")
    dfs.append(df)

final = pd.concat(dfs, ignore_index=True)

output = os.path.join(GL_DIR, "gl_vcd_operator_features.csv")
final.to_csv(output, index=False)

print("✅ Merged GL VCD CSVs →", output)
