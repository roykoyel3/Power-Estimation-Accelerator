# Power-Estimation-Accelerator
A lightweight and modular framework for extracting switching activity features from RTL and Gate-Level (GL) VCD files, enabling early-stage power estimation for digital circuits.

---

## 🚀 Project Overview  
This project automates the extraction of dynamic power-related features from synthesized RTL and gate-level designs.  
It processes VCD files generated after simulation and produces numerical feature sets that can be used for:

- Machine Learning–based power prediction  
- Gate-level vs RTL power comparison  
- Activity factor analysis  
- Design exploration and optimization

---

## 📁 Repository Structure  

Power-Estimation-Accelerator/
│
├── data/
│ ├── rtl_vcd_features/ # RTL switching activity features
│ ├── gl_vcd_features/ # GL switching + glitch features
│
├── rtl/ # RTL Verilog modules
├── gl_netlist/ # Synthesized gate-level designs
├── tb/ # Testbenches for simulation
├── vcd/ # Generated RTL + GL VCD files
├── synth/ # Synthesis logs and scripts
│
├── scripts/
│ ├── extract_rtl_features.py # RTL VCD feature extractor
│ ├── extract_gl_features.py # GL VCD feature extractor
│
└── README.md

---

## 🔍 Current Features  
✅ Automatic parsing of RTL and GL VCD files  
✅ Extraction of switching counts for each signal  
✅ Aggregation of toggles into CSV feature datasets  
✅ Support for multiple logic blocks (adder, mux, decoder, FFs, etc.)  
✅ Clean folder hierarchy for ML pipelines

---

## 🛠️ Technology Stack  
- **Python 3**  
- **VCDVCD / custom parsers**  
- **Verilog (RTL & Gate-Level)**  
- **Synthesis tools (Yosys)**  
- **VCD simulation tools (Icarus Verilog)**

---

## 📌 Future Work  
- ML model for power prediction  
- Training pipeline for regression models  
- Power vs area vs delay multi-objective estimation  
- SHAP explainability for feature attribution  
- Web dashboard or Jupyter-based visualization

---


## 👩‍💻 Collaborators  
**Koyel Roy** — Electronics and Communication Engineering  
**Ishita Gupta** — Electronics and Communication Engineering  

Both contributors collaborated in RTL design, gate-level synthesis, VCD generation, and feature extraction automation.
---

## ⭐ Contributions  
Feel free to fork, submit pull requests, or open issues.

---

