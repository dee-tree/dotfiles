return {
    "sphamba/smear-cursor.nvim",
    opts = {
        enabled = true,
        stiffness = 0.55,
        trailing_stiffness = 0.5,
        stiffness_insert_mode = 0.5,
        trailing_stiffness_insert_mode = 0.5,
        damping = 0.65,
        damping_insert_mode = 0.65,
        matrix_pixel_threshold = 0.5,
        distance_stop_animating = 0.5,

        legacy_computing_symbols_support = true,
        cursor_color='#81A1C1',
        -- legacy_computing_symbols_support = true,
        -- transparent_bg_fallback_color = "#303030",
    },
}
