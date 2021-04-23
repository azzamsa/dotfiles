function rrun
    # a filename such `foo.rs`
    set filename $argv[1]
    # a executable name such `foo`
    set executable_name (string split "." $filename)[1]

    rustc $filename --out-dir ./target && ./target/$executable_name
end
