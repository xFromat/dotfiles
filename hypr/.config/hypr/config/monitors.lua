-- Monitor wiki https://wiki.hypr.land/Configuring/Basics/Monitors/
-- Example: output can be found with hyprctl monitors. Edit variables.lua for the monitor outputs instead of here directly
-- hl.monitor({
--     output    = MONITOR1,
--     mode      = "1920x1080@60",
--     position  = "0x0",
--     scale     = "1",
-- })

-- Laptop screen
hl.monitor({
    output    = MONITOR1,
    mode      = "1920x1080@120",
    position  = "0x0",-- about half a screen of main monitor
    scale     = "1.25",
})

-- Main monitor on the desk
hl.monitor({
    output    = MONITOR2,
    mode      = "3440x1440@144",
    position  = "-1920x-5040",
    scale     = "1",
})
-- TV at home
hl.monitor({
    output    = MONITOR3,
    mode      = "1920x1080@120",
    position  = "auto-left",
    scale     = "1.5",
})
-- Randomly plugged-in shit
hl.monitor({
    output    = MONITOR4,
    mode      = "preferred",
    position  = "auto-left",
    scale     = "1",
})
