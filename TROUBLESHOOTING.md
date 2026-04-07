# Troubleshooting

## vrecord

### [macOS] ffmpegdecklink & ffmpeg-ma error : atomic

Some macOS users have been unable to compile vrecord's FFmpeg dependencies with the error:

```
fatal error: 'atomic' file not found
```

A resolution was reported [here](https://github.com/amiaopensource/vrecord/issues/852#issuecomment-2701891440) of fully reinstalling Command Line Tools with the commands:

```
sudo rm -rfv /Library/Developer/CommandLineTools
xcode-select --install
```

### [Ubuntu] ffmpegdecklink error : libiec61883

Sometimes Ubuntu users experience the error:

```
ERROR: libiec61883 not found
```

A resolution for this was reported in [this issue](https://github.com/amiaopensource/homebrew-amiaos/issues/335) of running:

```
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv) \
  && ln -sf /usr/include/libiec61883 "$(brew --prefix)/include/" \
  && ln -sf /usr/include/libraw1394  "$(brew --prefix)/include/" \
  && ln -sf /usr/include/libavc1394  "$(brew --prefix)/include/" \
  && ln -sf /usr/lib/x86_64-linux-gnu/libiec61883* "$(brew --prefix)/lib/" \
  && ln -sf /usr/lib/x86_64-linux-gnu/libraw1394*  "$(brew --prefix)/lib/" \
  && ln -sf /usr/lib/x86_64-linux-gnu/libavc1394*  "$(brew --prefix)/lib/" \ 
  && ln -sf /usr/lib/x86_64-linux-gnu/librom1394*  "$(brew --prefix)/lib/"
  
  brew install ffmpegdecklink --with-iec61883
```

### [Ubuntu] ffmpegdecklink error : fontconfig

Some Ubuntu users have reported an issue with being unable to install ffmpegdecklink with the following error:

```
ERROR: fontconfig not found using pkg-config
```

This was found to be resolved by running `brew reinstall bzip2 && brew reinstall fontconfig` and then again installing ffmpegdecklink.

### [macOS] gtkdialog error

Some users of macOS post version 13 have had issues installing gtkdialog with an error similar to:

```
/bin/sh: makeinfo: command not found
make[2]: *** [gtkdialog.info] Error 127
make[1]: *** [all-recursive] Error 1
make: *** [all] Error 2
```

where the gtkdialog build script is unable to find the makeinfo dependency.

A successful work around has been found to be installing gtkdialog by running:

```
ln -sf "$(which makeinfo)" "$(brew --prefix)/Homebrew/Library/Homebrew/shims/mac/super"
brew install gtkdialog
```

### [Ubuntu] gtkdialog error

Sometimes Ubuntu users experience the error:

```
Makefile:338: recipe for target 'gtkdialog.info' failed
make[2]: *** [gtkdialog.info] Error 127
make[2]: Leaving directory '/tmp/gtkdialog-20220607-22530-9bc217/gtkdialog-0.8.4d/doc'
Makefile:424: recipe for target 'all-recursive' failed
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory '/tmp/gtkdialog-20220607-22530-9bc217/gtkdialog-0.8.4d'
Makefile:363: recipe for target 'all' failed
make: *** [all] Error 2
```

which can be resolved by reinstalling texinfo:

```
sudo apt-get install --reinstall texinfo
brew install gtkdialog
```

before running:

```
brew install vrecord
```
