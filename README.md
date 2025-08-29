## The extended language network: Language selective brain areas whose contributions to language remain to be discovered

This repository contains code and data accompanying:

Wolna, A., Wright, A., Casto, C., Lipkin, B., & Fedorenko, E. (2025). The extended language network: Language selective brain areas whose contributions to language remain to be discovered. bioRxiv, 2025-04. https://www.biorxiv.org/content/10.1101/2025.04.02.646835v2

<!-- ![](viz/figures/) INCLUDE MAIN FIGURE -->

## Project configuration & environment

The environment is a R 4.4.1 environment that makes heavy use of [Tidyverse packages](https://www.tidyverse.org/packages/), [{ggseg}](https://github.com/ggseg/ggseg), [{emmeans}](https://cran.r-project.org/web/packages/emmeans/index.html), [{lmerTest}](https://cran.r-project.org/web/packages/lmerTest/index.html), and [{patchwork}](https://patchwork.data-imaginist.com). Packages managed by [{renv}](https://rstudio.github.io/renv/); organization managed by [{here}](https://here.r-lib.org)

To get started:

1.  Clone the repository:

    ``` bash
    git clone https://github.com/aaronwriight/extended_language_network.git
    cd extended_language_network
    ```

To recreate the exact R environment used in the paper, run:

2.  Run the setup script:

    ``` bash
    chmod +x setup-dev.sh
    ./setup-dev.sh
    ```

This script will install R dependencies based on the `renv.lock` file and configure your environment.

3.  Open the `extended_language_network.Rproj` file in RStudio and begin exploring or running the code.

## Repository structure & pipeline

***NB***: some files necessary for processing/analysis have been purposefully excluded from the external repository for such reasons as file size issues, anonymity concerns, or otherwise. (**NOTE**: ***bolded/italicized*** scripts have been manually-selected to appear on the associated OSF repository)

```         
extended_language_network/
├── data                              # raw data input to script
│   └── Alice | MDloc | LanglocSN     
│       ├── *_subjects.csv            # subject lists for functional data
│       └── Funcloc                   # functional data
├── extented_language_network.Rproj   # R project file
├── .gitignore
├── misc                              # miscellaneous resources
├── README.md
├── renv/                             # R environment directory
├── renv.lock                         # R package lockfile
├── results
│   ├── osf                           # hand-picked files to push to osf mirror repo
│   ├── stats                         # statistical outputs
│   └── tables                        # descriptive outputs
├── setup-dev.sh                      # Development setup script
├── scripts                           # .qmd, .R, and other scripts used in pipeline
├── viz
│   ├── presentation                  # associated conference posters
│   ├── figures                       # publication-ready, composite figures manually produced for visualization
│   ├── illustrator                   # adobe illustrator files used in curating visualizations
│   └── images                        # plots and images produced by scripts
```

[data](./data): Contains raw data files that are used for inferential and descriptive statistical analyses

* `Alice` | `MDloc` | `langlocSN`: functional language data

[misc](./misc): Contains miscellanous files and resources consulted throughout the project

[results](./results): Contains stats and tables produced during analyses. (**NOTE**: the `OSF` subdirectory is not populated directly by scripts in this repository, rather it includes manually selected outputs summarizing key findings that appear on the associated OSF repository)

-   ***`OSF`***: hand-picked results (stats and tables) for OSF repository, reflected in [`extended_language_network-osf`](https://github.com/aaronwriight/extended_language_network-osf) mirror repo on GitHub
-   `stats`: statistical outputs from the analyses, organized by atlas type (e.g., DKT, Glasser, etc.). Each subdirectory contains model summaries and test results specific to that atlas
-   `tables`: tables generated from the analyses, organized by atlas type (e.g., DKT, Glasser, etc.). Each subdirectory contains results specific to that atlas.

[scripts](./scripts): Contains scripts (mostly .qmd files) that perform specific analyses or modular steps within the project pipeline.

-   `00_demographics`: computes demographic values used in the paper
-   `01_get_data`: takes in functional data and outputs `detail_all.txt`, the main data table for subsequent analyses
-   ***`02_stats`***: produces the gss (n=772 and n=86) and atlas parcel models/statistics
-   ***`03_plots`***: produces a variety of labeled brain plots and the shell of the main cortical and subcortical figures
-   `04_summary_tables`: produces a comprehensive list of the distribution of atlas parcels
-   `05_supplementals`: supplemental analyses
-   `06_sanity_checks`: a scratch notebook for miscellanous verifications

[viz](./viz): Contains automatically and manually produced visualizations (images/plots, figures)

-   `presentation`: conference and symposium posters
-   ***`figures`***: publication-ready, composite figures
-   `illustrator`: adobe illustrator files
-   `images`: plots generated from the scripts (e.g., `03_plots`), organized by type

## Repository relations & key items

**GitHub-internal**: internal, private workspace

* Alice, MDloc, Langloc data
* scripts/
* results/
* viz/

**OSF** / **GitHub-osf**: public-access, mirror repo containing publication-ready items

* Alice, MDloc, Langloc data
* scripts

**Dropbox**: large file storage, supplemental data
* detail_all.txt
* first_level_contrast_maps
* functional_language_parcels/
* langloc_unsmoothed_stastical_maps_n86

## Project notebook

A comprehensive supplemental notebook including useful, high-level and technical information related to project conception, data collection, writing, variables of interest, and other collaborative measures is available here: [`LINK`]()

## OSF

A public-access mirror of this repository containing a subset of files necessary for reproduction are available at [`extended_language_network-osf`](https://github.com/aaronwriight/extended_language_network-osf).

Data and scripts necessary to reproduce analyses and plots reported in the paper are also available on [`OSF`](https://osf.io/7594t/).

Tags: `functional localizers`, `language network`, `neuroscience of language`, `precision fMRI`

## Citation

If you use this repository or data, please cite:

```         
@article{Wolna2025,
  bibtex_show = {true},
  title = {The extended language network: Language selective brain areas whose contributions to language remain to be discovered},
  author = {Wolna, Agata and **Wright, Aaron** and Casto, Colton and Lipkin, Benjamin and Fedorenko, Evelina},
  abstract = {Although language neuroscience has largely focused on ‘core’ left frontal and temporal brain areas and their right-hemisphere homotopes, numerous other areas—cortical, subcortical, and cerebellar—have been implicated in linguistic processing. However, these areas’ contributions to language remain unclear given that the evidence for their recruitment comes from diverse paradigms, many of which conflate language processing with perceptual, motor, or task-related cognitive processes. Using fMRI data from 772 participants performing an extensively-validated language ‘localizer’ paradigm that isolates language processing from other processes, we a) delineate a comprehensive set of areas that respond reliably to language across written and auditory modalities, and b) evaluate these areas’ selectivity for language relative to a demanding non-linguistic task. In line with prior claims, many areas outside the core fronto-temporal network respond during language processing, and most of them show selectivity for language relative to general task demands. These language-selective areas of the extended language network include areas around the temporal poles, in the medial frontal cortex, in the hippocampus, and in the cerebellum, among others. Although distributed across many parts of the brain, the extended language-selective network still only comprises ∼1.2% of the brain’s volume and is about the size of a strawberry, challenging the view that language processing is broadly distributed across the cortical surface. These newly identified language-selective areas can now be systematically characterized to decipher their contributions to language processing, including testing whether these contributions differ from those of the core language areas.},
  journal = {bioRxiv},
  year = {2025},
  date = {2024/01/03},
  volume = {},
  issue = {},
  pages = {},
  doi = {10.1101/2025.04.02.646835},
  url = {https://doi.org/10.1101/2025.04.02.646835},
  pdf = {https://www.biorxiv.org/content/10.1101/2025.04.02.646835v2.full.pdf},
  selected = {true},
  recommended_citation = {Wolna, A., Wright, A., Casto, C., Lipkin, B., & Fedorenko, E. (2025). The extended language network: Language selective brain areas whose contributions to language remain to be discovered. *bioRxiv*, 2025-04. https://doi.org/10.1101/2025.04.02.646835.}
}
```

## License

This project is open source and available under the [MIT License](LICENSE).

README.md templated from [Greta Tuckute](https://github.com/gretatuckute/drive_suppress_brains/blob/main/README.md) and [Guillaume Noblet](https://github.com/gnoblet/TidyTuesday/blob/main/README.md)
