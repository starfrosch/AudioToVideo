# AudioToVideo
Create a video for YouTube from and audio file, image and text input with an equalizer animation.

# Install

Download ffmpeg https://www.ffmpeg.org and install in applications on macOS

Install brew https://brew.sh

brew install gs for fonts support

brew install imagemagick

Fight imagemagick to support pango https://stackoverflow.com/questions/25838714/error-when-trying-to-use-pango-with-imagemagick-on-osx

# Run
AudioToVideo.sh /path/to/image.jpg /path/to/audio.mp3 "artist name" "track name"


# Example

Input Audio: https://archive.org/download/starfrosch-mostwanted/Starfrosch-Chillax.wav

Input Image: https://unsplash.com/photos/XOQJa4OC8P0

Input Artist Name: starfrosch

Input Track Title: Chillax

AudioToVideo.sh paul-bulai-448776-unsplash.jpg Starfrosch.Chillax.wav starfrosch Chillax

Watch the result https://www.youtube.com/watch?v=jdUZetNgwl8
