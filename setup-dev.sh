#!/usr/bin/env bash

# setup-dev.sh — reproducible R environment setup using renv

set -e

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

# install renv if not already installed (non-interactive, specify CRAN mirror)
Rscript --no-save --no-restore -e "if (!requireNamespace('renv', quietly = TRUE)) install.packages('renv', repos='https://cloud.r-project.org')"

# restore renv environment (non-interactive)
Rscript --no-save --no-restore -e "renv::restore(prompt = FALSE)"

# print versions for debugging
Rscript --no-save --no-restore -e "cat('R version:', getRversion(), '\n'); if (requireNamespace('renv', quietly = TRUE)) cat('renv version:', as.character(utils::packageVersion('renv')), '\n')"

echo "environment setup complete."