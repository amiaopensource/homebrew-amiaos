# homebrew-amiaos
Homebrew tap for AMIA Open Source formulae:

- **audiorecorder** — Tool for calibration and recording of analog audio sources.
- **bmdtools** — Basic capture and play programs for Blackmagic Design Decklink (forked from https://github.com/lu-zero/bmdtools).
- **Cable Bible** — A comprehensive guide to cables and connectors used in audiovisual archiving.
- **deckcontrol** — Control an attached videodeck via Blackmagic Design Decklink SDK.
- **decklinksdk** — An unofficial repository for openly-licensed SDK files from Blackmagic’s Desktop Video software development kit. Note that decklinksdk is used by vrecord.
- **ffmpegdecklink** — A static build of FFmpeg with Decklink. Note that ffmpegdecklink is used by vrecord.
- **ffmprovisr** — Repository of useful FFmpeg command lines for archivists.
- **lenticular** - Digital restoration of lenticular colours from greyscale digitisations. This is a work in progress: an alpha is available for testing purpose.
- **LTOpers** — Scripts for doing stuff with LTFS.
- **mkvparse** — A simple Matroska (MKV) parser.
- **pbprotracktor** — Make postgres calls to public broadcasting scheduling databases to produce a PBCore XML output.
- **QCTools** — Quality Control Tools for video preservation.
- **qwt-qt5** — Qt Widgets for Technical Applications (for Qt5). Note that qwt-qt5 is used by QCTools.
- **vrecord** — Open-source software for capturing a video signal and turning it into a digital file.

All the formulae work fine on Homebrew and some of them also on Linuxbrew (including the Windows Subsystem for Linux).

## A note regarding qwt-qt5

If, when installing, you got the error message:
```
Project ERROR: Could not resolve SDK Path for 'macosx'
```
then you might download `XCode`, start it and then do:
```
Preferences -> Locations -> Command Line Tools -> select SDK
```

## Contributing

Contributions are very welcome! Please consider the [Contributing Guidelines](CONTRIBUTING.md).

## Abandoned project

This project is no longer developed nor maintaied. Yet please feel free to reactivate it, if you are interested in!

- **digibase** — Uses MySQL to create a database which tracks tapes through a digitization workflow, designed to work with vrecord and [mediamicroservices](https://github.com/mediamicroservices).
