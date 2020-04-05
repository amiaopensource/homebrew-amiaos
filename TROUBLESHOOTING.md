# Troubleshooting

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
