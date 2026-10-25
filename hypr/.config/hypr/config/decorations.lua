-- Look and feel configuration

hl.config({
    general = {
        gaps_in = 1,
        gaps_out = 4,
        border_size = 4, 
        extend_border_grab_area = 10,
        resize_on_border = true,
        col = {
            active_border = {
                colors = { CACHYLBLUE, CACHYDGREEN },
                angle = 45,
            },
            inactive_border = CACHYGRAY,
        },
    },
    group = {
        col = {
            border_active = CACHYLBLUE,
            border_inactive = CACHYGRAY,
            border_locked_active = CACHYDBLUE,
            border_locked_inactive = CACHYGRAY,
        },
        groupbar = {
            col = {
                active = CACHYLGREEN,
                inactive = CACHYGRAY,
                locked_active = CACHYDBLUE,
                locked_inactive = CACHYGRAY,
            },
        },
    },
    decoration = {
        dim_special = 0.3,
        rounding = 5,
        active_opacity = 0.95,
        inactive_opacity = 0.6,
        fullscreen_opacity = 1,
        blur = {
			enabled = true,
			size = 6,
			passes = 4,
			special = true,
			ignore_opacity = true,
        },
    },
})
