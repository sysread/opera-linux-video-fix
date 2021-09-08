# MPEG video fix for Opera for Linux

I found this fix in [this
post](https://forums.opera.com/topic/37539/solving-the-problem-of-the-opera-browser-with-video-playback-in-ubuntu-and-similar-distributions-linux-mint-kde-neon/2).
It just installs chromium and symlinks chromium's libffmpeg.so to opera's
install directory.

I used this on Linux Mint, but it probably would work on any Ubuntu, too. I
don't know if Debian's chromium package comes with libffmpeg, though, so Debian
may require some extra finagling.
