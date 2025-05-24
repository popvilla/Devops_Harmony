
# Quantum Harmony Setup Script
# Run this in RStudio once the project is opened

# ---- R Packages ----
install.packages(c("readxl", "dplyr", "ggplot2"))

# ---- Python Packages via reticulate ----
if (!requireNamespace("reticulate", quietly = TRUE)) {
  install.packages("reticulate")
}
reticulate::py_install(c("pandas", "matplotlib", "seaborn"))

# ---- Quarto CLI (if not installed) ----
if (!quarto::quarto_path()) {
  install.packages("quarto")
}
