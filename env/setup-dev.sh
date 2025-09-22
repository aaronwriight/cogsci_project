#!/usr/bin/env bash

# setup-dev.sh — reproducible R or Python environment setup

set -e

if [ $# -eq 0 ]; then
  echo "usage: $0 [R|python]"
  exit 1
fi

mode=$1

if [ "$mode" = "R" ]; then
  echo "setting up R environment using renv..."
  
  # check that R is installed
  if ! command -v R &> /dev/null; then
    echo "error: R is not installed or not in PATH. please install R before proceeding."
    exit 1
  fi
  
  # check that renv.lock exists
  if [ ! -f "renv.lock" ]; then
    echo "warning: no renv.lock file found in the current directory."
    echo "skipping renv::restore()."
    exit 0
  fi

  # install renv if not already installed
  Rscript --no-save --no-restore -e "if (!requireNamespace('renv', quietly = TRUE)) install.packages('renv', repos='https://cloud.r-project.org')"

  # restore renv environment
  Rscript --no-save --no-restore -e "renv::restore(prompt = FALSE)"

  echo "R environment setup complete."

elif [ "$mode" = "Python" ]; then
  echo "setting up Python environment..."

  # check if conda is installed
  if command -v conda &> /dev/null; then
    source "$(conda info --base)/etc/profile.d/conda.sh"
    echo "using conda to install dependencies..."
    conda env create -f env/env_cogsci_template.yml -n cogsci-env || conda env update -f env/env_cogsci_template.yml -n cogsci-env
    conda activate cogsci-env
  else
    echo "error: conda not found. please install conda before proceeding."
    exit 1
  fi

  echo "Python environment setup complete."

else
  echo "usage: $0 [R | Python]"
  exit 1
fi