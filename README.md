# sd [![Build Status](https://travis-ci.org/rylnd/sd.png)](https://travis-ci.org/rylnd/sd)
sd (shift directory) allows you to quickly change directories.
It's [wd](https://github.com/mfaerevaag/wd) for bash.

### Examples
```bash
# add a shift point
cd /an/obnoxiously/long/path/that/i/often/use
sd add obx

# shift to that point
sd obx

# shift to a subfolder of that point
sd obx/subfolder/of/common/point

# remove a shift point
sd rm obx

# list all shift points and their destinations
sd ls
```

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
curl -sL https://raw.github.com/rylnd/sd/master/setup/sd | bash -s install
```

#### Setup (Manual)
Define the sd script in your shell by adding the following to a shell startup file (`~/.bash_profile`, `~/.bashrc`, etc.):
```bash
# define the sd function
source "<PATH_TO_SD_SCRIPT>"
```

#### Fuzzy finding
If [fzf](https://github.com/junegunn/fzf) is in `$PATH` shifting to a non matching point will bring fzf up with a list of all points, pre filtered with your non matching point. 

After:
```bash
sd add foo
sd add bar
sd add baz

sd ba
```
you will face fzf prompting yout to choose between baz and bar




# Contributing
Pull requests are always welcome.
