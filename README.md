# Common Environment 
Configuration and tooling for the CLI environment that I expect to be common on
all my workstations is managed as a git repository.

## Getting set up
Making this repository somewhat unusual is the intention for it to act as the 
home folder and its use of git submodules.

The following steps are an example of how to install it.

```bash
cd ~/
git clone https://github.com/jtheriault/dotfiles.git
mv dotfiles/.git ./
git checkout .
git submodule init
git submodule update
mkdir -p .vim/autoload
source .bashrc
```

## Configuration

### Bash

This installs an extensible .bashrc system which loads spreads configuration 
across separate files in the ~/.bashrc.d/ directory.

### NVM

This installs and loads nvm into each running shell to provide whatever node
version is correct for my work.

### Vim

A significant aspect of this repo is establishing my preferred VIM environment.

In addition to setting core configuration values for key mappings, the status 
line and actual text editing behavior, this installs a number of helpful
plugins.

* BufOnly
* CtrlP
* JSDoc
* NERDTree
* NERDTree git plugin
* Pathogen
* Syntasic

#### Syntastic

In order for this syntax checker to work, it depends on external tools for each
language to be available in the $PATH. This will install those already configured
in .vimrc:

```bash
npm i -g dockerfile_lint eslint js-yaml stylelint
```
### GNU Screen

GNU screen is also a notable tool in my workflow. My default configuration is
included here and references to it in scripts may arise.
