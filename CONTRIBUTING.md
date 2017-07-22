# Contributing Guidelines

## Cross-Platform Software

We encourage the writing of portable code. Often only little additional work is needed to allow the installation not only using Homebrew on _macOS_ but also via [Linuxbrew](https://github.com/Linuxbrew) on a variety of _Linux_ distributions. This has a wonderful side effect: people using the _Windows_ Subsystem for Linux (Ubuntu) can easily install, use and update our software as well.

## Versioning

We encourage the use of either:

- date-based versioning i.e. the `YYYY-MM-DD` format (e.g. `v2017-02-18`)
- [semantic versioning](http://semver.org/) i.e. the `major.minor.patch` format (e.g. `v1.17.2`)

for the releases.

## Hints

- If you choose date-based versioning, then you may add a line like: `version "2017-07-22"`
- If you do not need to compile the code, then you may add the line: `bottle :unneeded`
