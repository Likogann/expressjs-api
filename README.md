# onion-vanity
Onion vanity link generator using mkp224o - Automates the process even more for completely automatic deployment to servers

### Intended Use
This is intended for installation on dedicated servers. Instead of doing this process many times over, fork this repo, upload your own filters.list, and you're good to go.

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