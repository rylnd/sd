# sd [![Build Status](https://travis-ci.org/rylnd/sd.png)](https://travis-ci.org/rylnd/sd)
sd (shift directory) allows you to quickly change directories.
It's [wd](https://github.com/mfaerevaag/wd) for bash.

#### Setup (Recommended)
First, pull down the repo:
```bash
git clone git@github.com:rylnd/sd
```

Then, to install (or to get the latest version):
```bash
cd sd
setup/sd upgrade
```

#### Setup (Automatic)
For a one-off install, simply paste the following into your command line:
```bash
curl -s https://raw.github.com/rylnd/sd/master/setup/sd | bash -s install
```

#### Setup (Manual)
Define the sd script in your shell by adding the following to a shell startup file (`~/.bash_profile`, `~/.bashrc`, etc.):
```bash
# define the sd function
source "<PATH_TO_SD_SCRIPT>"
```

# Contributing
Pull requests are always welcome.
