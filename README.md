## Cognitive Science Project Template

This is a structured template for organizing and managing cognitive science projects. It includes a clear directory structure, environment setup scripts, and guidelines for reproducibility.

## Project configuration & environment

**R**: The environment is an R 4.4.1 environment that makes use of [Tidyverse packages](https://www.tidyverse.org/packages/), [{renv}](https://rstudio.github.io/renv/), and [{here}](https://here.r-lib.org), and all dependencies are listed in the `renv.lock` file.

**Python**: Python environment management is handled via conda. The environment uses Python 3.11, and all dependencies are listed in the `env/env_cogsci_template.yml file`. 

To ensure reproducibility, the `setup-dev.sh` and `update-dev.sh` scripts are provided to help recreate exact environments. Alternatively, manually and update R or Python environments via shell commands. To get started using this repository, follow these steps:

1.  Clone the repository:

``` bash
git clone https://github.com/aaronwriight/cogsci_project
cd cogsci_project
```

To recreate the exact environment used in the project, run:

2.  Run the setup script:

``` bash
chmod +x env/setup-dev.sh
env/setup-dev.sh [R | Python]
```

These scripts will install/ dependencies based on the `renv.lock` or `env_cogsci_template_.yml` file and configure your environment accordingly. Alternatively, install the environments manually:
- For R: Open R and run `renv::restore()`
- For Python: Run `conda env create -f env/env_cogsci_template.yml` and activate with `conda activate cogsci_template`

3.  Update dependencies using:

``` bash
chmod +x env/update-dev.sh
env/update-dev.sh [R | Python] [refresh--true|refresh--false]
```

4.  Open the project file in your IDE (e.g., RStudio | VS Code | Positron) and begin exploring or running the code.

## Repository structure & pipeline

The repository is structured to facilitate organization and reproducibility. The following is a suggested directory structure.

**NB**: Consider purposefully excluding select files from the external repository for such reasons as file size issues, anonymity concerns, or otherwise. (**NOTE**: bold/italicie scripts, or other files, manually-selected to appear on associated public-access epositories)

```         
cogsci_project/
├── cogsci_project.Rproj              # R project file
├── data                              # raw data input to scripts
├── env                               # environment configuration scripts
│   ├── env_cogsci_template.yml       # conda environment file
│   ├── _quarto.yml                   # Quarto configuration file
│   ├── setup-dev.sh                  # development setup script
│   └── update-dev.sh                 # dependency update script    
├── .gitignore
├── misc                              # miscellaneous resources
├── README.md
├── renv/                             # R environment directory
├── renv.lock                         # R package lockfile
├── requirements.txt                  # Python dependencies
├── results
│   ├── osf                           # hand-picked files for OSF repository
│   ├── stats                         # statistical outputs
│   └── tables                        # descriptive outputs
├── scripts                           # .qmd, .R, and other scripts used in pipeline
├── viz
│   ├── figures                       # publication-ready, composite figures manually produced for visualization
│   ├── illustrator                   # adobe illustrator files used in curating visualizations
│   ├── images                        # plots and images produced by scripts
│   └── presentation                  # associated conference posters
...
```

**Key directories:**

[data](./data): Contains raw data files that are used for inferential and descriptive statistical analyses.

[env](./env): Contains environment configuration files and scripts for setting up and updating the development environment. Key files include `env_cogsci_template.yml` (conda environment file), `setup-dev.sh` (development setup script), and `update-dev.sh` (dependency update script).

[misc](./misc): Contains miscellaneous files and resources consulted throughout the project.

[results](./results): Contains stats and tables produced during analyses. Recommended subfolders include `osf` (hand-picked files for OSF repository), `stats` (statistical outputs), and `tables` (descriptive outputs).

[scripts](./scripts): Contains scripts (mostly .qmd files) that perform specific analyses or modular steps within the project pipeline.

[viz](./viz): Contains automatically and manually produced visualizations (images/plots, figures). Recommended subfolders include `figures` (publication-ready figures), `illustrator` (Adobe Illustrator files), and `images` (plots/images produced by scripts).

## Project notebook

A comprehensive supplemental notebook including useful, high-level and technical information related to project conception, data collection, writing, variables of interest, and other collaborative measures is available here: [`insert link here`].

## OSF

A public-access mirror of this repository containing a subset of files necessary for reproduction is available at: [`insert link here`].

Tags: `cognitive science`, `neuroscience`

## Citation

If you use this repository or data, please cite:

```         
@article{AuthorLastNameYear,
  bibtex_show = {true},
  title = {project title here},
  author = {author name(s) here},
  abstract = {abstract here},
  journal = {journal or repository here},
  year = {2024},
  date = {date here},
  volume = {volume here},
  issue = {issue number here},
  pages = {page numbers here},
  doi = {DOI here},
  url = {URL here},
  recommended_circuit = {citation here}
}
```

## License

This project is open source and available under the [MIT License](LICENSE).

README.md templated from [Greta Tuckute](https://github.com/gretatuckute/drive_suppress_brains/blob/main/README.md) and [Guillaume Noblet](https://github.com/gnoblet/TidyTuesday/blob/main/README.md)