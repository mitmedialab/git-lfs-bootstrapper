# git-lfs-bootstrapper

How do I install a git repo that requires git-lfs, but the git repo
itself has a "virtualized" version of git-lfs that saves me from having
to install git-lfs globally, without first installing git-lfs globally?

Many of our (PRG's) repos use "virtualize" tools to keep all tools needed
for that repo local to the repo itself. It saves a ton of headaches
regarding knowing which tools you need to install, and more
importantly, prevents tool conflicts from happening.

See https://github.com/mitmedialab/virtualize. And here is an example
repo that uses virtualize (though it's using old versions and is not a
very good example, but it is public, for some reason):
https://github.com/mitmedialab/jibo-station-wifi-service

There is one tool however that is problimatic to virtualize:
`git-lfs`. To clone a repo that has `git-lfs` files in it, you need to
have `git-lfs` installed *before* you clone the repo.

This repo helps bootstrap that process.

## To use

clone this repo somewhere, and set it up:
```
git clone https://github.com/mitmedialab/git-lfs-bootstrapper
cd git-lfs-bootstrapper
./setup.sh
```

This should install a virtualized copy of Homebrew that exists only
inside this repo. Then it should use Homebrew to install `git-lfs`.

Next activate your shell so that `git-lfs` is in your path.
```
source ./activate
```

Now your prompt should have a line that indicates that the virtualized
tools have been activated for this shell.

Now go clone the repo that depends on `git-lfs` and it should come
down fine. After you `./setup.sh` _that_ repo then you can depened on
the `git-lfs` in the virtualized-homebrew there. You can exit this
shell and do `source ./activate` in the new repo` and continue living
the good-life.
