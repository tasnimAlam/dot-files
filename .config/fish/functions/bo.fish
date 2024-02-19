function bo
    chromium (buku -p -f 40 | fzf | cut -f1) $argv
end

# Description
functions -c bo 'Open bookmarks with Chromium'
