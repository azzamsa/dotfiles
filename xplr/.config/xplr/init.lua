-- Example: https://github.com/sayanarijit/xplr/blob/main/src/init.lua

-- @diagnostic disable
local xplr = xplr -- The globally exposed configuration to be overridden.
-- @diagnostic enable

version = "0.21.1"

-- # Configuration ------------------------------------------------------------
-- ## Config ------------------------------------------------------------------
-- ### General Configuration --------------------------------------------------
xplr.config.general.enable_mouse = true

-- Plugins
-- https://github.com/dtomvan/xpm.xplr
local home = os.getenv("HOME")
local xpm_path = home .. "/.local/share/xplr/dtomvan/xpm.xplr"
local xpm_url = "https://github.com/dtomvan/xpm.xplr"

package.path = package.path .. ";" .. xpm_path .. "/?.lua;" .. xpm_path .. "/?/init.lua"

os.execute(string.format("[ -e '%s' ] || git clone '%s' '%s'", xpm_path, xpm_url, xpm_path))

require("xpm").setup({
  plugins = {
    -- Let xpm manage itself
    "dtomvan/xpm.xplr",
    { name = "sayanarijit/fzf.xplr" },
    {
      "dtomvan/extra-icons.xplr",
      after = function()
        xplr.config.general.table.row.cols[2] = { format = "custom.icons_dtomvan_col_1" }
      end,
    },
  },
  auto_install = true,
  auto_cleanup = true,
})

-- ### Modes ------------------------------------------------------------------
--
-- The builtin default mode.
-- Defaults: https://github.com/sayanarijit/xplr/blob/main/src/init.lua#L1045
-- Visit the [Default Key Bindings](https://xplr.dev/en/default-key-bindings)

xplr.config.modes.builtin.default = {
  name = "default",
  key_bindings = {
    on_key = {
      ["m"] = {
        help = "back",
        messages = {
          "Back",
        },
      },
      ["h"] = {
        help = "back",
        messages = {
          "Back",
        },
      },
      ["i"] = {
        help = "enter",
        messages = {
          "Enter",
        },
      },
      ["enter"] = {
        help = "enter",
        messages = {
          "Enter",
        },
      },
      ["e"] = {
        help = "up",
        messages = {
          "FocusPrevious",
        },
      },
      ["up"] = {
        help = "up",
        messages = {
          "FocusPrevious",
        },
      },
      ["n"] = {
        help = "down",
        messages = {
          "FocusNext",
        },
      },
      ["#"] = {
        messages = {
          "PrintAppStateAndQuit",
        },
      },
      ["."] = {
        help = "show hidden",
        messages = {
          {
            ToggleNodeFilter = { filter = "RelativePathDoesNotStartWith", input = "." },
          },
          "ExplorePwdAsync",
        },
      },
      [":"] = {
        help = "action",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "action" },
        },
      },
      ["?"] = {
        help = "global help menu",
        messages = {
          {
            BashExec = [===[
                  [ -z "$PAGER" ] && PAGER="less -+F"
                  cat -- "${XPLR_PIPE_GLOBAL_HELP_MENU_OUT}" | ${PAGER:?}
                  ]===],
          },
        },
      },
      ["G"] = {
        help = "go to bottom",
        messages = {
          "PopMode",
          "FocusLast",
        },
      },
      ["ctrl-a"] = {
        help = "select/unselect all",
        messages = {
          "ToggleSelectAll",
        },
      },
      ["/"] = {
        help = "search",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "search" },
          { SetInputBuffer = "" },
        },
      },
      ["ctrl-f"] = {
        help = "search",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "search" },
          { SetInputBuffer = "" },
        },
      },
      ["ctrl-i"] = {
        help = "next visited path",
        messages = {
          "NextVisitedPath",
        },
      },
      ["ctrl-o"] = {
        help = "last visited path",
        messages = {
          "LastVisitedPath",
        },
      },
      ["ctrl-r"] = {
        help = "refresh screen",
        messages = {
          "ClearScreen",
        },
      },
      ["ctrl-u"] = {
        help = "clear selection",
        messages = {
          "ClearSelection",
        },
      },
      ["ctrl-w"] = {
        help = "switch layout",
        messages = {
          { SwitchModeBuiltin = "switch_layout" },
        },
      },
      ["d"] = {
        help = "delete",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "delete" },
        },
      },
      ["down"] = {
        help = "down",
        messages = {
          "FocusNext",
        },
      },
      ["f"] = {
        help = "filter",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "filter" },
        },
      },
      ["g"] = {
        help = "go to",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "go_to" },
        },
      },
      ["left"] = {
        help = "back",
        messages = {
          "Back",
        },
      },
      ["q"] = {
        help = "quit with result",
        messages = {
          "PrintResultAndQuit",
        },
      },
      -- ["q"] = {
      -- 	help = "quit",
      -- 	messages = {
      -- 		"Quit",
      -- 	},
      -- },
      ["r"] = {
        help = "rename",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "rename" },
          {
            BashExecSilently0 = [===[
                  NAME=$(basename "${XPLR_FOCUS_PATH:?}")
                  "$XPLR" -m 'SetInputBuffer: %q' "${NAME:?}"
                  ]===],
          },
        },
      },
      ["ctrl-d"] = {
        help = "duplicate as",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "duplicate_as" },
          {
            BashExecSilently0 = [===[
                  NAME=$(basename "${XPLR_FOCUS_PATH:?}")
                  "$XPLR" -m 'SetInputBuffer: %q' "${NAME:?}"
                  ]===],
          },
        },
      },
      ["right"] = {
        help = "enter",
        messages = {
          "Enter",
        },
      },
      ["s"] = {
        help = "sort",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "sort" },
        },
      },
      ["space"] = {
        help = "toggle selection",
        messages = {
          "ToggleSelection",
          "FocusNext",
        },
      },
      ["~"] = {
        help = "go home",
        messages = {
          {
            BashExecSilently0 = [===[
                  "$XPLR" -m 'ChangeDirectory: %q' "${HOME:?}"
                  ]===],
          },
        },
      },
      ["page-up"] = {
        help = "scroll up",
        messages = {
          "ScrollUp",
        },
      },
      ["page-down"] = {
        help = "scroll down",
        messages = {
          "ScrollDown",
        },
      },
      ["{"] = {
        help = "scroll up half",
        messages = {
          "ScrollUpHalf",
        },
      },
      ["}"] = {
        help = "scroll down half",
      },
    },
  },
}
xplr.config.modes.builtin.default.key_bindings.on_key["v"] =
  xplr.config.modes.builtin.default.key_bindings.on_key["space"]
xplr.config.modes.builtin.default.key_bindings.on_key["V"] =
  xplr.config.modes.builtin.default.key_bindings.on_key["ctrl-a"]
xplr.config.modes.builtin.default.key_bindings.on_key["/"] =
  xplr.config.modes.builtin.default.key_bindings.on_key["ctrl-f"]
xplr.config.modes.builtin.default.key_bindings.on_key["h"] =
  xplr.config.modes.builtin.default.key_bindings.on_key["left"]
xplr.config.modes.builtin.default.key_bindings.on_key["j"] =
  xplr.config.modes.builtin.default.key_bindings.on_key["down"]
xplr.config.modes.builtin.default.key_bindings.on_key["k"] = xplr.config.modes.builtin.default.key_bindings.on_key["up"]
xplr.config.modes.builtin.default.key_bindings.on_key["l"] =
  xplr.config.modes.builtin.default.key_bindings.on_key["right"]
xplr.config.modes.builtin.default.key_bindings.on_key["tab"] =
  xplr.config.modes.builtin.default.key_bindings.on_key["ctrl-i"] -- compatibility workaround

-- The builtin quit mode.
xplr.config.modes.builtin.quit = {
  name = "quit",
  layout = "HelpMenu",
  key_bindings = {
    on_key = {
      ["enter"] = {
        help = "just quit",
        messages = {
          "Quit",
        },
      },
      ["p"] = {
        help = "quit printing pwd",
        messages = {
          "PrintPwdAndQuit",
        },
      },
      ["f"] = {
        help = "quit printing focus",
        messages = {
          "PrintFocusPathAndQuit",
        },
      },
      ["s"] = {
        help = "quit printing selection",
        messages = {
          "PrintSelectionAndQuit",
        },
      },
      ["r"] = {
        help = "quit printing result",
        messages = {
          "PrintResultAndQuit",
        },
      },
    },
  },
}

-- The builtin search mode.
xplr.config.modes.builtin.search = {
  name = "search",
  prompt = "/",
  key_bindings = {
    on_key = {
      ["up"] = {
        help = "up",
        messages = {
          "FocusPrevious",
        },
      },
      ["down"] = {
        help = "down",
        messages = {
          "FocusNext",
        },
      },
      ["ctrl-z"] = {
        help = "toggle ordering",
        messages = {
          "ToggleSearchOrder",
          "ExplorePwdAsync",
        },
      },
      ["ctrl-a"] = {
        help = "toggle search algorithm",
        messages = {
          "ToggleSearchAlgorithm",
          "ExplorePwdAsync",
        },
      },
      ["ctrl-r"] = {
        help = "regex search",
        messages = {
          "SearchRegexFromInput",
          "ExplorePwdAsync",
        },
      },
      ["ctrl-f"] = {
        help = "fuzzy search",
        messages = {
          "SearchFuzzyFromInput",
          "ExplorePwdAsync",
        },
      },
      ["ctrl-s"] = {
        help = "sort (no search order)",
        messages = {
          "DisableSearchOrder",
          "ExplorePwdAsync",
          { SwitchModeBuiltinKeepingInputBuffer = "sort" },
        },
      },
      ["right"] = {
        help = "enter",
        messages = {
          "Enter",
          { SetInputBuffer = "" },
        },
      },
      ["left"] = {
        help = "back",
        messages = {
          "Back",
          { SetInputBuffer = "" },
        },
      },
      ["tab"] = {
        help = "toggle selection",
        messages = {
          "ToggleSelection",
          "FocusNext",
        },
      },
      ["enter"] = {
        help = "submit",
        messages = {
          "AcceptSearch",
          "PopMode",
        },
      },
      ["esc"] = {
        help = "cancel",
        messages = {
          "CancelSearch",
          "PopMode",
        },
      },
    },
    default = {
      messages = {
        "UpdateInputBufferFromKey",
        "SearchFromInput",
        "ExplorePwdAsync",
      },
    },
  },
}

xplr.config.modes.builtin.search.key_bindings.on_key["ctrl-n"] =
  xplr.config.modes.builtin.search.key_bindings.on_key["down"]
xplr.config.modes.builtin.search.key_bindings.on_key["ctrl-p"] =
  xplr.config.modes.builtin.search.key_bindings.on_key["up"]

-- ### Node Types -------------------------------------------------------------

-- The style for the directory nodes
-- Type: [Style](https://xplr.dev/en/style)
xplr.config.node_types.directory.style = {
  fg = "Blue",
}

-- Metadata for the directory nodes.
xplr.config.node_types.directory.meta.icon = "📁"

-- ### Hacks -------------------------------------------------------------

-- With `export XPLR_BOOKMARK_FILE="$HOME/bookmarks"`
-- Bookmark: mode binding
xplr.config.modes.builtin.default.key_bindings.on_key["b"] = {
  help = "bookmark mode",
  messages = {
    { SwitchModeCustom = "bookmark" },
  },
}
xplr.config.modes.custom.bookmark = {
  name = "bookmark",
  key_bindings = {
    on_key = {
      m = {
        help = "bookmark dir",
        messages = {
          {
            BashExecSilently0 = [[
                  PTH="${XPLR_FOCUS_PATH:?}"
                  if [ -d "${PTH}" ]; then
                     PTH="${PTH}"
                     elif [ -f "${PTH}" ]; then
                        PTH=$(dirname "${PTH}")
                        fi
                        PTH_ESC=$(printf %q "$PTH")
                        if echo "${PTH:?}" >> "${XPLR_BOOKMARK_FILE:?}"; then
                           "$XPLR" -m 'LogSuccess: %q' "$PTH_ESC added to bookmarks"
                        else
                           "$XPLR" -m 'LogError: %q' "Failed to bookmark $PTH_ESC"
                           fi
                           ]],
          },
          "PopMode",
        },
      },
      g = {
        help = "go to bookmark",
        messages = {
          {
            BashExec0 = [===[
                           PTH=$(cat "${XPLR_BOOKMARK_FILE:?}" | fzf --no-sort)
                           if [ "$PTH" ]; then
                              "$XPLR" -m 'FocusPath: %q' "$PTH"
                              fi
                              ]===],
          },
          "PopMode",
        },
      },
      d = {
        help = "delete bookmark",
        messages = {
          {
            BashExec0 = [[
                              PTH=$(cat "${XPLR_BOOKMARK_FILE:?}" | fzf --no-sort)
                              sd "$PTH\n" "" "${XPLR_BOOKMARK_FILE:?}"
                              ]],
          },
          "PopMode",
        },
      },
      esc = {
        help = "cancel",
        messages = {
          "PopMode",
        },
      },
    },
  },
}
