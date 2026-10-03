-- Workspace rules wiki https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- Add your workspace rules here. Increment the workspace number as you go. Do not have duplicate workspaces.
hl.workspace_rule({ workspace = "name:gaming", monitor = PRIMARY_MONITOR, default = true })
hl.workspace_rule({ workspace = "1", monitor = PRIMARY_MONITOR, default = true, persistent = true })
hl.workspace_rule({ workspace = "2", monitor = PRIMARY_MONITOR, default = true, persistent = true })
hl.workspace_rule({ workspace = "3", monitor = PRIMARY_MONITOR, default = true, persistent = true })
hl.workspace_rule({ workspace = "4", monitor = PRIMARY_MONITOR, default = true, persistent = true })
hl.workspace_rule({ workspace = "5", monitor = PRIMARY_MONITOR, default = true, persistent = true })
hl.workspace_rule({ workspace = "6", monitor = PRIMARY_MONITOR, default = true, persistent = true })
hl.workspace_rule({ workspace = "7", monitor = PRIMARY_MONITOR, default = true, persistent = true })
hl.workspace_rule({ workspace = "8", monitor = MONITOR2, default = false, persistent = false })

-- For other layouts such as scrolling, see example below
-- hl.workspace_rule({ workspace = "1", monitor = MONITOR1, default = true, persistent = true, layout = "scrolling" })
