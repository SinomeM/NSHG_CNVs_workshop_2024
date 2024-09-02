# README

In this repository you'll find the code we'll be using during the CNV Machine
Learning workshop.

The lesson will be in R, the code is provided as an RMarkdown file. Here you'll
find both the Rmd and the compiled HTML file, as well as the simulated CNVs
file on which we'll be basing our analysis.

If you use conda or miniconda, you can create an environment with all necessary
packages from the provided YAML file. Otherwise the requirements are as follows:

- R vesrion 4.0 or above
- IGV (https://igv.org/)

The folowwing R pakages:

- data.table
- ggplot2
- rmarkdown

We will skip the longer and most computation intensive step or run only on a subset.

To run the full analysis you will also need these additional packages and software:

- CNValidatron (https://github.com/SinomeM/CNValidatron_fl) and it's dependencies
- QCtreeCNV (https://github.com/SinomeM/QCtreeCNV) and it's dependencies
- biomaRt (https://bioconductor.org/packages/release/bioc/html/biomaRt.html)
- tabix


If you plan on running the code yourself before or after the workshop, please
note that these instructions assume you are working on a Linux system, Mac **should**
also work.

**NB**: This lesson assumes basic knowledge of the Linux command line, GNU coreutils, conda, and R.

# How to run

Clone the required repositories:

```
# update the path to an actual folder
cd /some/dir/of/your/choice/
# clone this repo
git clone https://github.com/SinomeM/NSHG_CNVs_workshop_2024.git

# move into the lesson repo
cd NSHG_CNVs_workshop_2024
```

Optional, install the required software using conda and activate the new environment:

```
# create new env based on the provided YAML
conda env create -f conda_env_rstudio.yml
# activate environment
conda activate rstudio
```

You can compile the whole script with rstudio or
`rmarkdown::render("01_exploratory_analysis.Rmd")` and then check out the resulting
HTML.
Alternatively, you can manually execute the R code chunks one after the other.

**NB** : Some chunck are marked as "# NOT RUN", these are **not** meant to be manually
executed. Some are rmardown settings, other are oprional steps.

# Homework

In this repo there are two main folders `01_homework` and `02_live_session`.
The idea is for you to try running the code in the homework folder and
try to think how you would solve the assignment. Then, in the live session
we will quickly go through the introduction together and move to how we would
solve the issue. There we have a discussion about which analysis method is best depending
on the goal etc.
