function rrun
    # slice '.rs' to allow tab completion. I am tired of typing
    rustc $argv[1] --out-dir ./target &&  ./target/${1:0:-3}
end
