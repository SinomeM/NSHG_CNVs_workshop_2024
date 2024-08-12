# README

In this repository you'll find the code we'll be using during the CNV Machine
Learning workshop.

The lesson will be in R, the code is provided as an RMarkdown file. Here you'll
find both the RMd and the compiled HTML file, as well as the simulated CNVs
file on which we'll be basing our analysis.

If you use conda or miniconda, you can create an environment with all necessary
packages from the provided YAML file. Otherwise the requirements are as follows:

- R vesrion 4.0 or above
- data.table
- biomaRt
- ggplot2
- CNValidatron (https://github.com/SinomeM/CNValidatron_fl)
- [...]

Other software, useful but not required for the analysis:

- IGV (https://igv.org/)

If you plan on running the code yourself before or after the workshop, please
note that these instructions requires a Linux system, or some small modification to paths etc.

**NB**: This lesson assumes basic knowledge of the Linux command line, GNU coreutils, conda, and R.

# How to run

Clone the required repositories:

```
# update the path to an actual folder
cd /some/dir/of/your/choice/
# clone this repo
git clone https://github.com/SinomeM/NSHG_CNVs_workshop_2024.git
# clone CNValidatron repo
git clone https://github.com/SinomeM/CNValidatron_fl.git

# move into the lesson repo
cd NSHG_CNVs_workshop_2024
```

Optional, install the required software using conda and activate the new environment:

```
# create new env based on the provided YAML
conda env create -f conda_env_R4.yml
# activate environment
conda activate R4
```

Now you can run R. If you want to use Rstudio, you will need to install the conda package,
or manage your software separately.

```
# open the RMD in a window and run the R console
gedit analysis.Rmd &
R

# install rstudio
conda install rstudio
rstudio
```
