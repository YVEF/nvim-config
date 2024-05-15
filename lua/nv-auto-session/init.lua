require("auto-session").setup{
    auto_restore_enabled = false,
    auto_save_enabled = false,
    auto_session_supress_dirs = { "~/", "~/Downloads", "~/Documents" },
    -- auto_session_root_dir = "~/.cache/nvim/session/"
}
