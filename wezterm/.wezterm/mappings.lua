local wezterm = require 'wezterm'
local act = wezterm.action
local utils = require 'dotlocal.utilua'
local module = {}

function module.apply_to_config(config)
    config.mouse_bindings = {
    -- Scrolling up while holding CTRL increases the font size
    {
        event = { Down = { streak = 1, button = { WheelUp = 1 } } },
        mods = 'CTRL',
        action = act.IncreaseFontSize,
    },

    -- Scrolling down while holding CTRL decreases the font size
    {
        event = { Down = { streak = 1, button = { WheelDown = 1 } } },
        mods = 'CTRL',
        action = act.DecreaseFontSize,
    },
    -- Disables copy-on-selection
    {
        event = { Up = { streak = 1, button = 'Left' } },
        mods = 'NONE',
        action = act.Nop,
    },
    {
        event = { Up = { streak = 1, button = 'Left' } },
        mods = 'CTRL',
        action = act.OpenLinkAtMouseCursor,
    },
    }

    config.leader = {
    key = 'F13',
    timeout_milliseconds = 2000,
    }

    config.keys = {
    { key = '\\', mods = 'ALT', action = act.ShowLauncher },
    { key = '/', mods = 'ALT', action = act.Search("CurrentSelectionOrEmptyString") },
    { key = 'c', mods = 'LEADER', action = wezterm.action.ActivateCopyMode },
    { key = 'c', mods = 'ALT', action = wezterm.action.ActivateCopyMode },

    { key = 'C', mods = 'CTRL|SHIFT', action = act({ CopyTo = "Clipboard" }), },
    {
        key = 'c',
        mods = 'CTRL',
        action = wezterm.action_callback(function(window, pane)
            if pane:is_alt_screen_active() then
                window:perform_action(wezterm.action.SendKey{ key='c', mods='CTRL' }, pane)
            else
                selection_text = window:get_selection_text_for_pane(pane)
                is_selection_active = string.len(selection_text) ~= 0
                if is_selection_active then
                    window:perform_action(wezterm.action.CopyTo('ClipboardAndPrimarySelection'), pane)
                    window:perform_action(act.ClearSelection, pane)
                else
                    window:perform_action(wezterm.action.SendKey{ key='c', mods='CTRL' }, pane)
                end
            end
        end),
    },
    { key = 'V', mods = 'CTRL|SHIFT', action = act({ PasteFrom = "Clipboard" }), },
    { key = 'v', mods = 'CTRL', action = act({ PasteFrom = "Clipboard" }), },
    { key = '+', mods = 'CTRL', action = act.IncreaseFontSize },
    { key = '-', mods = 'CTRL', action = act.DecreaseFontSize },
    -- tabs navigation
    { key = 'Home', mods = 'ALT', action = act.ActivateTabRelative(-1) },
    { key = 'End', mods = 'ALT', action = act.ActivateTabRelative(1) },

    { key = 't', mods = 'CTRL|SHIFT', action = act.SpawnTab 'CurrentPaneDomain' },
    { key = 'PageDown', mods = 'ALT', action = act.ShowTabNavigator },
    { key = 'f', mods = 'CTRL|SHIFT', action = act.ShowTabNavigator },

    -- panes navigation
    { key = 'u', mods = 'ALT', action = act.SplitPane { direction = 'Left' } },
    { key = 'i', mods = 'ALT', action = act.SplitPane { direction = 'Down' } },
    { key = 'o', mods = 'ALT', action = act.SplitPane { direction = 'Up' } },
    { key = 'p', mods = 'ALT', action = act.SplitPane { direction = 'Right' } },

    { key = 'q', mods = 'LEADER', action = act.CloseCurrentPane { confirm = true } },
    { key = 'q', mods = 'ALT', action = act.CloseCurrentPane { confirm = true } },
    { key = 'Q', mods = 'CTRL|SHIFT', action = act.CloseCurrentTab { confirm = true } },

    -- managed by smart-splits plug-in
    -- { key = 'LeftArrow', mods = 'ALT', action = act.ActivatePaneDirection 'Left' },
    -- { key = 'UpArrow', mods = 'ALT', action = act.ActivatePaneDirection 'Up' },
    -- { key = 'DownArrow', mods = 'ALT', action = act.ActivatePaneDirection 'Down' },
    -- { key = 'RightArrow', mods = 'ALT', action = act.ActivatePaneDirection 'Right' },

    -- { key = 'LeftArrow', mods = 'SHIFT|ALT', action = act.AdjustPaneSize { 'Left', 2 } },
    -- { key = 'UpArrow', mods = 'SHIFT|ALT', action = act.AdjustPaneSize { 'Up', 1 } },
    -- { key = 'DownArrow', mods = 'SHIFT|ALT', action = act.AdjustPaneSize { 'Down', 1 } },
    -- { key = 'RightArrow', mods = 'SHIFT|ALT', action = act.AdjustPaneSize { 'Right', 2 } },

    { key = 'r', mods = 'LEADER', action = act.ReloadConfiguration },
    { -- rename tab
        key = 'R', mods = 'CTRL|SHIFT', action = act.PromptInputLine {
        description = 'Enter new name for tab',
        action = wezterm.action_callback(
            function(window, pane, line)
            if line then
                window:active_tab():set_title(line)
            end
            end
        ),
        },
    },
    { -- rename workspace
        key = 'r', mods = 'ALT', action = act.PromptInputLine {
            description = 'Enter new name for workspace',
            action = wezterm.action_callback(
                function(window, pane, line)
                    if line then
                        mux.rename_workspace(window:mux_window():get_workspace(), line)
                    end
                end
            ),
    }},
    {
        key = 'w', mods = 'ALT', action = act.ShowLauncherArgs { flags = 'WORKSPACES' },
  } ,
    { key = 'n', mods = 'SHIFT|CTRL', action = wezterm.action.ToggleFullScreen },
    { key = 'd', mods = 'ALT', action = wezterm.action.ShowDebugOverlay },

    }

    common_copy_search = {
        { key="Escape", mods="NONE", action = wezterm.action_callback(function(window, pane)
            selection_text = window:get_selection_text_for_pane(pane)
            is_selection_active = string.len(selection_text) ~= 0
            if is_selection_active then
                window:perform_action(act.CopyMode 'ClearSelectionMode', pane)
                window:perform_action(act.CopyMode 'ClearPattern', pane) -- for search mode
                window:perform_action(act.ClearSelection, pane)
            else
                window:perform_action(act.CopyMode 'Close', pane)
            end
        end),
        },
        { key="c", mods="CTRL", action = act.Multiple {
            { CopyTo = 'ClipboardAndPrimarySelection' },
            { CopyMode = 'ClearPattern' }, -- for search mode
            { CopyMode = 'Close' },
        }},

        { key="LeftArrow", mods="CTRL", action = act.CopyMode 'MoveBackwardWord' },
        { key="j", mods="CTRL", action = act.CopyMode 'MoveBackwardWord' },
        { key="b", mods="NONE", action = act.CopyMode 'MoveBackwardWord' },

        { key="RightArrow", mods="CTRL", action = act.CopyMode 'MoveForwardWord' },
        { key=";", mods="CTRL", action = act.CopyMode 'MoveForwardWord' },
        { key="e", mods="NONE", action = act.CopyMode 'MoveForwardWord' },

        { key="LeftArrow", mods="SHIFT", action = wezterm.action_callback(function(window, pane)
            selection_text = window:get_selection_text_for_pane(pane)
            if isempty(selection_text) then
                window:perform_action(act.CopyMode { SetSelectionMode = 'Cell' }, pane)
            end
            window:perform_action(act.CopyMode 'MoveLeft', pane)
        end)},

        { key="RightArrow", mods="SHIFT", action = wezterm.action_callback(function(window, pane)
            selection_text = window:get_selection_text_for_pane(pane)
            if isempty(selection_text) then
                window:perform_action(act.CopyMode { SetSelectionMode = 'Cell' }, pane)
            end
            window:perform_action(act.CopyMode 'MoveRight', pane)
        end)},

        { key="UpArrow", mods="SHIFT", action = wezterm.action_callback(function(window, pane)
            selection_text = window:get_selection_text_for_pane(pane)
            if isempty(selection_text) then
                window:perform_action(act.CopyMode { SetSelectionMode = 'Cell' }, pane)
            end
            window:perform_action(act.CopyMode 'MoveUp', pane)
        end)},

        { key="DownArrow", mods="SHIFT", action = wezterm.action_callback(function(window, pane)
            selection_text = window:get_selection_text_for_pane(pane)
            if isempty(selection_text) then
                window:perform_action(act.CopyMode { SetSelectionMode = 'Cell' }, pane)
            end
            window:perform_action(act.CopyMode 'MoveDown', pane)
        end)},

        { key="LeftArrow", mods="CTRL|SHIFT", action = wezterm.action_callback(function(window, pane)
            selection_text = window:get_selection_text_for_pane(pane)
            if isempty(selection_text) then
                window:perform_action(act.CopyMode { SetSelectionMode = 'Word' }, pane)
            end
            window:perform_action(act.CopyMode 'MoveBackwardWord', pane)
        end)},

        { key="RightArrow", mods="CTRL|SHIFT", action = wezterm.action_callback(function(window, pane)
            selection_text = window:get_selection_text_for_pane(pane)
            if isempty(selection_text) then
                window:perform_action(act.CopyMode { SetSelectionMode = 'Word' }, pane)
            end
            window:perform_action(act.CopyMode 'MoveForwardWord', pane)
        end)},

        { key="UpArrow", mods="CTRL|SHIFT", action = wezterm.action_callback(function(window, pane)
            selection_text = window:get_selection_text_for_pane(pane)
            if isempty(selection_text) then
                window:perform_action(act.CopyMode { SetSelectionMode = 'Line' }, pane)
            end
            window:perform_action(act.CopyMode 'MoveUp', pane)
        end)},

        { key="DownArrow", mods="CTRL|SHIFT", action = wezterm.action_callback(function(window, pane)
            selection_text = window:get_selection_text_for_pane(pane)
            if isempty(selection_text) then
                window:perform_action(act.CopyMode { SetSelectionMode = 'Line' }, pane)
            end
            window:perform_action(act.CopyMode 'MoveDown', pane)
        end)},
    }

    config.key_tables = {
    copy_mode = {
        { key = "/", mods = "NONE", action = wezterm.action { Search = { CaseSensitiveString = "" } } },

        { key = 'j', mods = 'NONE', action = act.CopyMode 'MoveLeft' },
        { key = 'LeftArrow', mods = 'NONE', action = act.CopyMode 'MoveLeft' },
        { key = 'k', mods = 'NONE', action = act.CopyMode 'MoveDown' },
        { key = 'DownArrow', mods = 'NONE', action = act.CopyMode 'MoveDown' },
        { key = 'l', mods = 'NONE', action = act.CopyMode 'MoveUp' },
        { key = 'UpArrow', mods = 'NONE', action = act.CopyMode 'MoveUp' },
        { key = ';', mods = 'NONE', action = act.CopyMode 'MoveRight' },
        { key = 'RightArrow', mods = 'NONE', action = act.CopyMode 'MoveRight' },

        { key="PageUp", mods="NONE", action = act.CopyMode 'PageUp' },
        { key="PageDown", mods="NONE", action = act.CopyMode 'PageDown' },

        { key="^", mods="SHIFT", action = act.CopyMode 'MoveToStartOfLineContent' },
        { key="$", mods="SHIFT", action = act.CopyMode 'MoveToEndOfLineContent' },

        { key=" ", mods="NONE", action = act.CopyMode { SetSelectionMode = 'Cell' } },
        { key=" ", mods="CTRL", action = act.CopyMode { SetSelectionMode = 'Word' } },
        { key=" ", mods="CTRL|SHIFT", action = act.CopyMode { SetSelectionMode = 'Line' } },

        { key="y", mods="NONE", action = act.Multiple {
            { CopyTo = 'ClipboardAndPrimarySelection' },
            { CopyMode = 'ClearPattern' }, -- for search mode
            { CopyMode = 'Close' },
        }},
        { key="c", mods="NONE", action = act.Multiple {
            { CopyTo = 'ClipboardAndPrimarySelection' },
            { CopyMode = 'ClearPattern' }, -- for search mode
            { CopyMode = 'Close' },
        }},
    },
    search_mode = {
        { key = 'Enter', mods = 'NONE', action = act.CopyMode 'PriorMatch' },
        { key = 'n', mods = 'CTRL', action = act.CopyMode 'NextMatch' },
        { key = 'N', mods = 'SHIFT', action = act.CopyMode 'PriorMatch' },
        { key = 'p', mods = 'CTRL', action = act.CopyMode 'PriorMatch' },
        { key = 'UpArrow', mods = 'NONE', action = act.CopyMode 'PriorMatch' },
        { key = 'LeftArrow', mods = 'NONE', action = act.CopyMode 'PriorMatch' },
        { key = 'DownArrow', mods = 'NONE', action = act.CopyMode 'NextMatch' },
        { key = 'RightArrow', mods = 'NONE', action = act.CopyMode 'NextMatch' },

        { key = 'PageUp', mods = 'NONE', action = act.CopyMode 'PriorMatchPage' },
        { key = 'PageDown', mods = 'NONE', action = act.CopyMode 'NextMatchPage' },
    },
    }

    merge(config.key_tables.copy_mode, common_copy_search)
    merge(config.key_tables.search_mode, common_copy_search)
end

return module
