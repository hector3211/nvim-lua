local status, rusttools = pcall(require, "rust-tools")
if (not status) then return end

rusttools.setup({
    server = {
        on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rusttools.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", rusttools.code_action_group.code_action_group, { buffer = bufnr })
        end,
    },
    tools = {
        inlay_hints = {
            -- automatically set inlay hints (type hints)
            -- default: true
            auto = true,
        },
    }
})
