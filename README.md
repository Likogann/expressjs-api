# onion-vanity
Onion vanity link generator using mkp224o - Automates the process even more for completely automatic deployment to servers

### Intended Use
This is intended for installation on dedicated servers. Instead of doing this process many times over, fork this repo, modify the filters.list, and you're good to go.

# Installing
How to use this project.
This has only been tested on Ubuntu 20.04

## Cloning the repo
Clone and cd into the github repo
```bash
git clone https://github.com/Likogann/onion-vanity onion-vanity
cd onion-vanity
```

## Creating the filters.list file
Edit a file called `filters.list` and add your space seperated filters. Numbers are not supported in onion links
Example: `likogan likodev likogandev`
```bash
nano filters.list
```

## Creating optimisations.list file
See [OPTIMISATIONS.TXT](https://github.com/cathugger/mkp224o/blob/master/OPTIMISATION.txt) and find what works best for you.

Put all of the optimisations you want into a file called `optimisations.list`
Each item should start with a `--` and be space seperated.
Example: `--enable-donna --enable-intfilter`

## Starting installer
You should run this everytime you clone to a new machine, and everytime you modify optimisations.list
```bash
bash install.sh
```
From here, the installer will automatically run `start.sh`

# Starting The Application
To start the application after installing, run the following:
```bash
bash start.sh
```

# Factory Reset
You can reset everything by running `clean.sh`
This script will remove the mkp224o from the directory, and trick the installer into thinking this is a fresh install.
Generated keys in `keys/` and `filters.list` will not be modified by this script.