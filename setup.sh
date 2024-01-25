#!/bin/bash

#export VIRTUALIZE_NODE_VERSION=16.13.2
#export VIRTUALIZE_PYTHON_VERSION=3

# install git submodules
git submodule init
git submodule update
virtualize/setup.sh

### as you add virtualize modules (node, python, etc...) you will
### probably want to edit the following sections and enable them

source ./activate

### node
if [[ -f package.json && -d virtualize-node ]]; then
    yarn install
fi   

### python
if [[ -f requirements.txt && -d virtualize-python ]]; then
    pip install -f requirments.txt
fi

### miniconda
if [[ -f environment.yml && -d virtualize-miniconda ]]; then
    conda env create --file "/Users/jon/x/git-lfs-bootstrap"/environment.yml
fi

### homebrew
if [[ -f Brewfile && -d virtualize-homebrew ]]; then
    brew bundle --file Brewfile
fi

### macports
# unknown
