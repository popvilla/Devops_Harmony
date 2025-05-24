
# Quantum Harmony R Package Setup Script
required_packages <- c("tidyverse", "readxl", "lubridate")

for (pkg in required_packages) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    message(paste("p& Installing", pkg))
    install.packages(pkg, repos = "https://cloud.r-project.org")
  } else {
    message(paste("b", pkg, "already installed"))
  }
}
