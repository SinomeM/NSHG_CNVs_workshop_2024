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

**NB**: This lesson assumes basic knowledge of the Linux command line, GNU coreutils, and R.

# How to run

Clone the required repositories:

```
# update the path to an actual folder
cd /some/dir/of/your/choice/
# clone this repo
git clone https://github.com/SinomeM/NSHG_CNVs_workshop_2024.git
# clone CNValidatron repo
git clone https://github.com/SinomeM/CNValidatron_fl.git
```

Optional, install the required software using conda:

```
conda env create -f 
```
