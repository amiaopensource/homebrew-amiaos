# Contributing Guidelines

## Cross-Platform Software

We encourage the writing of portable code. Often only little additional work is needed to allow the installation using Homebrew not only on _macOS_ but also on a variety of _Linux_ distributions. This has a wonderful side effect: people using the _Windows_ Subsystem for Linux or Terminal can easily install, use and update our software as well.

## Versioning

We encourage the use of either:

- date-based versioning i.e. the `YYYY-MM-DD` format (e.g. `v2017-02-18` or `2020-04-05`)
- [semantic versioning](http://semver.org/) i.e. the `major.minor.patch` format (e.g. `v1.17.2` or `2.0.7`)

for the releases.

## Hints

- If you choose date-based versioning, then you may add a line such as `version "2017-07-22"`. Note that this is not needed for semantic versioning.
- If you do not need to compile the code, then you may add the line `bottle :unneeded`.
