#!/usr/bin/env bash

# update-dev.sh — update R or Python development environment files

set -e

if [ $# -eq 0 ]; then
  echo "usage: $0 [R|python] [refresh--true|refresh--false]"
  exit 1
fi

mode=$1
refresh=${2:-refresh--false}

if [ "$mode" = "R" ]; then
  echo "setting up R environment snapshot..."

  Rscript -e "renv::snapshot(prompt = FALSE)"

  if [ "$refresh" = "refresh--true" ]; then
    Rscript -e "quit(save='no')"
  fi

  echo "R environment snapshot complete."

elif [ "$mode" = "Python" ]; then
  echo "setting up Python conda environment..."

  if ! command -v conda &> /dev/null; then
    echo "conda could not be found. Please install conda first."
    exit 1
  fi

  source "$(conda info --base)/etc/profile.d/conda.sh"

  if conda env list | grep -q "^cogsci-env\s"; then
    echo "Updating existing conda environment 'cogsci-env'..."
  else
    echo "Creating new conda environment 'cogsci-env'..."
  fi

  conda env create -f env/env_cogsci_template.yml -n cogsci-env || conda env update -f env/env_cogsci_template.yml -n cogsci-env
  conda activate cogsci-env

  echo "Exporting environment to env/env_cogsci_template.yml..."
  conda env export --from-history > env/env_cogsci_template.yml

else
  echo "usage: $0 [R | Python] [refresh--true | refresh--false]"
  exit 1
fi