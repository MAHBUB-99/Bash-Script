#!/bin/bash

# Use first argument as target directory or current directory
target_dir="${1:-.}"

# Create necessary folders
create_folders() {
    mkdir -p "$target_dir"/{Images,Documents,Videos,Musics,Scripts,Others}
}

# Extract file extension and convert to lowercase
get_extension() {
    echo "${1##*.}" | tr 'A-Z' 'a-z'
}

# Organize a single file
organize_file() {
    local file="$1"
    local extension=$(get_extension "$file")

    case "$extension" in
        jpg|jpeg|png|gif|bmp)
            mv "$file" "$target_dir/Images/"
            ;;
        pdf|docx|txt|xlsx)
            mv "$file" "$target_dir/Documents/"
            ;;
        mp4|mkv|avi)
            mv "$file" "$target_dir/Videos/"
            ;;
        mp3|wav)
            mv "$file" "$target_dir/Musics/"
            ;;
        sh|bash|py|js|html|css)
            mv "$file" "$target_dir/Scripts/"
            ;;
        *)
            mv "$file" "$target_dir/Others/"
            ;;
    esac
}

# Main logic
main() {
    create_folders

    for file in "$target_dir"/*; do
        if [[ -f "$file" ]]; then
            organize_file "$file"
        fi
    done

    echo "✅ Files organized successfully in '$target_dir'."
}

main