return {
    { 
        "nvim-tree/nvim-tree.lua", 
        config = function()
            local api = require('nvim-tree.api')
            vim.keymap.set('n', '<leader><leader>', api.tree.toggle, { noremap = true, silent = true })
            vim.keymap.set('n', '<leader>h', '<C-w>h', { noremap = true, silent = true })
            vim.keymap.set('n', '<leader>l', '<C-w>l', { noremap = true, silent = true })
            vim.keymap.set('n', '<leader>j', '<C-w>j', { noremap = true, silent = true })
            vim.keymap.set('n', '<leader>k', '<C-w>k', { noremap = true, silent = true })

            local function open_nvim_tree(data)
                local file, count = string.gsub(data.file, "NvimTree_1", "")
                local directory = vim.fn.isdirectory(file) == 1
                
                if directory then
                    api.tree.open()
                else
                    api.tree.toggle({ focus = false })
                end
            end
            vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
        end
    },

    {
        'nvim-telescope/telescope.nvim', 
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim', 'BurntSushi/ripgrep' },
        config = function() 
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
        end
    },

    {
        'romgrk/barbar.nvim',
        dependencies = {
            -- 'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {
            -- lazy.nvim will automatically call setup for you. put your options here
            
            -- Hide tab bar if there is only one buffer
            auto_hide = 0
        },
        version = '^1.0.0', -- optional: only update when a new 1.x version is released
    },
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      },
      keys = {
        {
          "<leader>?",
          function()
            require("which-key").show({ global = false })
          end,
          desc = "Buffer Local Keymaps (which-key)",
        },
      },
    }
}
