# name taken from emacs `auto-fill`

# split line longer than 80 char
function fill
    for file in *.md
        set header (head -n 12 $file)
        # fmt can't write to the current file
        tail --lines=+11 $file | fmt -w 80 > "$file".tmp
        mv "$file".tmp $file

        # append the header on the top
        echo $header | cat - $file  > "$file".tmp
        mv "$file".tmp $file  # formatting lost

        # sed -i '1i($header)' $file
        # echo -e "$header\n(cat $file)" > $file
     end
end
