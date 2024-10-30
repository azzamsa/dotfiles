# Retrieve the theme settings
export def main [] {
    return {
        separator: "#c8d3f5"
        leading_trailing_space_bg: { attr: "n" }
        header: { fg: "#c3e88d" attr: "b" }
        empty: "#82aaff"
        bool: {|| if $in { "#86e1fc" } else { "light_gray" } }
        int: "#c8d3f5"
        filesize: {|e|
            if $e == 0b {
                "#c8d3f5"
            } else if $e < 1mb {
                "#86e1fc"
            } else {{ fg: "#82aaff" }}
        }
        duration: "#c8d3f5"
        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: "#ff757f" attr: "b" }
            } else if $in < 6hr {
                "#ff757f"
            } else if $in < 1day {
                "#ff966c"
            } else if $in < 3day {
                "#c3e88d"
            } else if $in < 1wk {
                { fg: "#c3e88d" attr: "b" }
            } else if $in < 6wk {
                "#86e1fc"
            } else if $in < 52wk {
                "#82aaff"
            } else { "dark_gray" }
        }
        range: "#c8d3f5"
        float: "#c8d3f5"
        string: "#c8d3f5"
        nothing: "#c8d3f5"
        binary: "#c8d3f5"
        cell-path: "#c8d3f5"
        row_index: { fg: "#c3e88d" attr: "b" }
        record: "#c8d3f5"
        list: "#c8d3f5"
        block: "#c8d3f5"
        hints: "dark_gray"
        search_result: { fg: "#ff757f" bg: "#c8d3f5" }

        shape_and: { fg: "#c099ff" attr: "b" }
        shape_binary: { fg: "#c099ff" attr: "b" }
        shape_block: { fg: "#82aaff" attr: "b" }
        shape_bool: "#86e1fc"
        shape_custom: "#c3e88d"
        shape_datetime: { fg: "#86e1fc" attr: "b" }
        shape_directory: "#86e1fc"
        shape_external: "#86e1fc"
        shape_externalarg: { fg: "#c3e88d" attr: "b" }
        shape_filepath: "#86e1fc"
        shape_flag: { fg: "#82aaff" attr: "b" }
        shape_float: { fg: "#c099ff" attr: "b" }
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
        shape_globpattern: { fg: "#86e1fc" attr: "b" }
        shape_int: { fg: "#c099ff" attr: "b" }
        shape_internalcall: { fg: "#86e1fc" attr: "b" }
        shape_list: { fg: "#86e1fc" attr: "b" }
        shape_literal: "#82aaff"
        shape_match_pattern: "#c3e88d"
        shape_matching_brackets: { attr: "u" }
        shape_nothing: "#86e1fc"
        shape_operator: "#ff966c"
        shape_or: { fg: "#c099ff" attr: "b" }
        shape_pipe: { fg: "#c099ff" attr: "b" }
        shape_range: { fg: "#ff966c" attr: "b" }
        shape_record: { fg: "#86e1fc" attr: "b" }
        shape_redirection: { fg: "#c099ff" attr: "b" }
        shape_signature: { fg: "#c3e88d" attr: "b" }
        shape_string: "#c3e88d"
        shape_string_interpolation: { fg: "#86e1fc" attr: "b" }
        shape_table: { fg: "#82aaff" attr: "b" }
        shape_variable: "#c099ff"

        background: "#222436"
        foreground: "#c8d3f5"
        cursor: "#c8d3f5"
    }
}

# Update the Nushell configuration
export def --env "set color_config" [] {
    $env.config.color_config = (main)
}

# Update terminal colors
export def "update terminal" [] {
    let theme = (main)

    # Set terminal colors
    let osc_screen_foreground_color = '10;'
    let osc_screen_background_color = '11;'
    let osc_cursor_color = '12;'

    $"
    (ansi -o $osc_screen_foreground_color)($theme.foreground)(char bel)
    (ansi -o $osc_screen_background_color)($theme.background)(char bel)
    (ansi -o $osc_cursor_color)($theme.cursor)(char bel)
    "
    # Line breaks above are just for source readability
    # but create extra whitespace when activating. Collapse
    # to one line and print with no-newline
    | str replace --all "\n" ''
    | print -n $"($in)\r"
}

export module activate {
    export-env {
        set color_config
        update terminal
    }
}

# Activate the theme when sourced
use activate
