# creates a youtube video with a still image
if [ -z "$1" ] && [ -z "$2" ] && [ -z "$3" ] && [ -z "$4" ]; then
    echo Syntax:
    echo "AudioToVideo.sh /path/to/image.jpg /path/to/audio.mp3 \"artist name\" \"Track Title\""
else
    # generate text image for video
    convert -gravity southeast -splice 40x40  -gravity northwest -splice 40x40 -font Helvetica -gravity Center -weight 700 -pointsize 100 pango:"<b>$3</b>\n$4" image-text.png
    # convert image to full hd for video
    convert -gravity Center -resize 1920x1080^ -extent 1920x1080 "$1" "$3"-"$4"-1920x1080.png
    # merge transparent images for video
    composite -dissolve 50 -gravity Center image-text.png "$3"-"$4"-1920x1080.png -alpha Set "$3"-"$4"-cover-1920x1080.png
    #convert image to square for SoundCloud and Insta
    convert -gravity Center -resize 1080x1080^ -extent 1080x1080 "$3"-"$4"-cover-1920x1080.png "$3"-"$4"-cover-1080x1080.png
    # genreate eq video
    /Applications/ffmpeg -i "$2" -loop 1 -i "$3"-"$4"-cover-1920x1080.png -filter_complex "[0:a]showwaves=s=1920x200:mode=cline:colors=0xFFFFFF|0xD3D3D3:scale=sqrt:draw=full[fg];[1:v]scale=1920:-1[bg];[bg][fg]overlay=shortest=1:850:format=auto,format=yuv420p[out]" -map "[out]" -map 0:a -pix_fmt yuv420p -c:v libx264 -preset medium -crf 18 -c:a copy -shortest "$3"-"$4"-video.mkv

echo "$3"-"$4"-1920x1080.png genrated
echo "$3"-"$4"-cover-1920x1080.png generated
echo "$3"-"$4"-cover-1080x1080.png generated
echo "$3"-"$4"-video.mkv generated
fi
