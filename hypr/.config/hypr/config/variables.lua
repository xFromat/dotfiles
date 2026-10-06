-- Hyprland default apps

TERMINAL     = "ghostty"
FILE_MANAGER = "dolphin"
BROWSER      = "app.zen_browser.zen"
EDITOR       = "zed"
CALCULATOR   = "gnome-calculator"

-- Monitors
MONITOR1 = "eDP-1"
MONITOR2 = "DP-1"
MONITOR3 = "desc: Technical Concepts Ltd Beyond TV 0x00010000"
MONITOR4 = ""

local PRIORITY = { MONITOR3, MONITOR2, MONITOR1, MONITOR4 }
local function pick_primary()
	for _, name in ipairs(PRIORITY) do
		if hl.get_active_monitor(name) ~= nil then
			return name
		end
	end
	return PRIORITY[#PRIORITY - 1 ]
end

local function apply_primary()
	PRIMARY_MONITOR = pick_primary()
end

hl.on("monitor.added", apply_primary)
hl.on("monitor.removed", apply_primary)
apply_primary()

-- Workspaces
NUM_WPM = 7 -- Number of workspaces per monitor (Max 10)
