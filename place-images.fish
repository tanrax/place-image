#!/bin/fish

# Variables
set SOURCE_DOWNLOAD_IMAGES "https://source.unsplash.com/random/"
set PATH_TEMP "places-images"
set FILENAME_OUTPUT "pack-place-images.zip"

# Remove old images
rm -rf $PATH_TEMP $FILENAME_OUTPUT

# Make folder
mkdir -p $PATH_TEMP/jpg $PATH_TEMP/webp $PATH_TEMP/avif

# Download random images
for i in (seq 1 10)
    set FILENAME_IMAGE image-random-$i
    curl -L "{$SOURCE_DOWNLOAD_IMAGES}?sig=$i" -o $PATH_TEMP/jpg/$FILENAME_IMAGE.jpg
    # Transform jpg to webp
    cwebp $PATH_TEMP/jpg/$FILENAME_IMAGE.jpg -o $PATH_TEMP/webp/$FILENAME_IMAGE.webp
    # Transform jpg to avif
    avifenc $PATH_TEMP/jpg/$FILENAME_IMAGE.jpg -o $PATH_TEMP/avif/$FILENAME_IMAGE.avif
end

# Download square images 800x800
for j in (seq 1 10)
    set FILENAME_IMAGE image-square-$j
    curl -L "{$SOURCE_DOWNLOAD_IMAGES}800x800/?sig=$j" -o $PATH_TEMP/jpg/$FILENAME_IMAGE.jpg
    # Transform jpg to webp
    cwebp $PATH_TEMP/jpg/$FILENAME_IMAGE.jpg -o $PATH_TEMP/webp/$FILENAME_IMAGE.webp
    # Transform jpg to avif
    avifenc $PATH_TEMP/jpg/$FILENAME_IMAGE.jpg -o $PATH_TEMP/avif/$FILENAME_IMAGE.avif
end

# Download rectangle images 800x400
for k in (seq 1 10)
    set FILENAME_IMAGE image-rect-$k
    curl -L "{$SOURCE_DOWNLOAD_IMAGES}800x400/?sig=$k" -o $PATH_TEMP/jpg/$FILENAME_IMAGE.jpg
    # Transform jpg to webp
    cwebp $PATH_TEMP/jpg/$FILENAME_IMAGE.jpg -o $PATH_TEMP/webp/$FILENAME_IMAGE.webp
    # Transform jpg to avif
    avifenc $PATH_TEMP/jpg/$FILENAME_IMAGE.jpg -o $PATH_TEMP/avif/$FILENAME_IMAGE.avif
end

# Download people images 200x200
for l in (seq 1 10)
    set FILENAME_IMAGE image-people-$l
    curl -L "{$SOURCE_DOWNLOAD_IMAGES}200x200/?people\&sig=$l" -o $PATH_TEMP/jpg/$FILENAME_IMAGE.jpg
    # Transform jpg to webp
    cwebp $PATH_TEMP/jpg/$FILENAME_IMAGE.jpg -o $PATH_TEMP/webp/$FILENAME_IMAGE.webp
    # Transform jpg to avif
    avifenc $PATH_TEMP/jpg/$FILENAME_IMAGE.jpg -o $PATH_TEMP/avif/$FILENAME_IMAGE.avif
end

# Zip images
zip -r $FILENAME_OUTPUT $PATH_TEMP
rm -rf $PATH_TEMP
