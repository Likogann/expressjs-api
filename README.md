# onion-vanity
Automatically install mkp224o as a systemd service.
You can control mkp224o using `systemctl <command> mkp224o`

### Intended Use
This is intended for installation on dedicated servers. Instead of doing this process many times over, fork this repo, modify the filters.list, and you're good to go.

### Keys
All generated keys are found in `keys/` directory.
I would highly recommend making this directory a shared NFS server between all of your servers.
I personally have `keys/` pointed to an NFS server on my raspberry pi. Then my servers, or other devices running mkp224o will all spit their keys to the same NFS server.

# Installation
Installation is very easy, with just one script.
This project has been tested on the following operating systems: Ubuntu 20.04, Linux Mint 20.04

## Cloning the repo
Clone and cd into the github repo
It's **vital** you do not move the onion-vanity folder otherwise the service won't work. I recommend installing onion-vanity in your home directory `~/onion-vanity`.
```bash
cd ~
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

## Starting Installer
The installer is just a bash script.
```bash
bash install.sh
```

# Managing mkp224o
This project turns mkp224o into a service. You can manage it using `systemctl`

### Start mkp224o
```bash
systemctl start mkp224o
```

### Stop mkp224o
```bash
systemctl stop mkp224o
```

### Status mkp224o
```bash
systemctl status mkp224o
```

# Updating Filters / Optmisations & Moving onion-vanity location
Whenever updating/modifying fitlers or optimisations, you must run the install script again.
You will have to run install.sh when movning the location of onion-vanity on your disk
```bash
bash install.sh
```
The install script knows if it's already been run once. It will take much shorter to insall mkp224o.

# Uninstalling / Cleaning / Reseting mkp224o project
If for, whatever reason, you have to purge your system of mkp224o, you should first run `clean.sh`
```bash
clean.sh
```
After running this script, it will return onion-vanity to factory settings.
**This script will not delete found keys, or filters.list**