return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        -- 设置 nvim-tree 的快捷键绑定
        local map = vim.api.nvim_set_keymap

        -- 例如，将 <Leader>t 设置为打开/关闭 nvim-tree 文件浏览器
        map('n', '<Leader>t', ':NvimTreeToggle<CR>', {noremap = true})

        -- 或者将 F2 键设置为刷新 nvim-tree
        map('n', '<F2>', ':NvimTreeRefresh<CR>', {noremap = true})

        local function my_on_attach(bufnr)
            local api = require "nvim-tree.api"

            local function opts(desc)
                return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end

            -- default mappings
            api.config.mappings.default_on_attach(bufnr)

            -- custom mappings
            vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
            vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
        end

        require("nvim-tree").setup {
            on_attach = my_on_attach,
        }
    end,
}
