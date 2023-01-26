# Troubleshooting

## vrecord

#### ffmpegdecklink error
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

#### Gtkdialog error
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
which can be resolved by reinstalling `texinfo`:
```
sudo apt-get install --reinstall texinfo
brew install gtkdialog
```
before running:
```
brew install vrecord
```

## mpv

Sometimes users experience the error:
```
dyld: Library not loaded: @rpath/libswiftAppKit.dylib  
  Referenced from: /usr/local/bin/mpv  
  Reason: image not found  
Abort trap: 6
```
which can be resolved by reinstalling `mpv` from source.

### When Xcode 10.1 or newer is installed

Run the command:
```
brew reinstall --build-from-source mpv
```

### When Xcode 10.1 or newer is not installed

There is still a local AMIA open source tap of `mpv` that should work if you don’t want to install Xcode.

Uninstall or unlink the current mpv build and then run:
```
brew install amiaopensource/amiaos/mpv
```
