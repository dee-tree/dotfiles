local wezterm = require 'wezterm'
local act = wezterm.action
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
    }

    config.leader = {
    key = 'F13',
    timeout_milliseconds = 2000,
    }

    config.keys = {
    { key = '\\', mods = 'ALT', action = wezterm.action.ShowLauncher },

    { key = 'C', mods = 'CTRL|SHIFT', action = act({ CopyTo = "Clipboard" }), },
    {
        key = 'c',
        mods = 'CTRL',
        action = wezterm.action_callback(function(window, pane)
            selection_text = window:get_selection_text_for_pane(pane)
            is_selection_active = string.len(selection_text) ~= 0
            if is_selection_active then
                window:perform_action(wezterm.action.CopyTo('ClipboardAndPrimarySelection'), pane)
                window:perform_action(act.ClearSelection, pane)
            else
                window:perform_action(wezterm.action.SendKey{ key='c', mods='CTRL' }, pane)
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
    {
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
    {
        key = 'n',
        mods = 'SHIFT|CTRL',
        action = wezterm.action.ToggleFullScreen,
    },

    -- copy mode --
    { key = 'c', mods = 'LEADER', action = wezterm.action.ActivateCopyMode },

    }

    config.key_tables = {
    copy_mode = {
        { key="Escape", mods="NONE", action = act.CopyMode 'Close' },
        { key="c", mods="CTRL", action = act.CopyMode 'Close' },
        { key = 'j', mods = 'NONE', action = act.CopyMode 'MoveLeft' },
        { key = 'LeftArrow', mods = 'NONE', action = act.CopyMode 'MoveLeft' },
        { key = 'k', mods = 'NONE', action = act.CopyMode 'MoveDown' },
        { key = 'DownArrow', mods = 'NONE', action = act.CopyMode 'MoveDown' },
        { key = 'l', mods = 'NONE', action = act.CopyMode 'MoveUp' },
        { key = 'UpArrow', mods = 'NONE', action = act.CopyMode 'MoveUp' },
        { key = ';', mods = 'NONE', action = act.CopyMode 'MoveRight' },
        { key = 'RightArrow', mods = 'NONE', action = act.CopyMode 'MoveRight' },

        { key="LeftArrow", mods="CTRL", action = act.CopyMode 'MoveBackwardWord' },
        { key="j", mods="CTRL", action = act.CopyMode 'MoveBackwardWord' },
        { key="b", mods="NONE", action = act.CopyMode 'MoveBackwardWord' },

        { key="RightArrow", mods="CTRL", action = act.CopyMode 'MoveForwardWord' },
        { key=";", mods="CTRL", action = act.CopyMode 'MoveForwardWord' },
        { key="e", mods="NONE", action = act.CopyMode 'MoveForwardWord' },

        { key="PageUp", mods="NONE", action = act.CopyMode 'PageUp' },
        { key="PageDown", mods="NONE", action = act.CopyMode 'PageDown' },

        { key="^", mods="SHIFT", action = act.CopyMode 'MoveToStartOfLineContent' },
        { key="$", mods="SHIFT", action = act.CopyMode 'MoveToEndOfLineContent' },

        { key=" ", mods="NONE", action = act.CopyMode { SetSelectionMode = 'Cell' } },
        { key=" ", mods="CTRL", action = act.CopyMode { SetSelectionMode = 'Word' } },
        { key=" ", mods="CTRL|SHIFT", action = act.CopyMode { SetSelectionMode = 'Line' } },

        { key="y", mods="NONE", action = act.Multiple {
        { CopyTo = 'ClipboardAndPrimarySelection' },
        { CopyMode = 'MoveToScrollbackBottom' },
        { CopyMode = 'Close' },
        } },
        { key="c", mods="NONE", action = act.Multiple {
        { CopyTo = 'ClipboardAndPrimarySelection' },
        { CopyMode = 'MoveToScrollbackBottom' },
        { CopyMode = 'Close' },
        } },
        { key="C", mods="CTRL|SHIFT", action = act.Multiple {
        { CopyTo = 'ClipboardAndPrimarySelection' },
        { CopyMode = 'MoveToScrollbackBottom' },
        { CopyMode = 'Close' },
        } },
    }
    }
end

return module
