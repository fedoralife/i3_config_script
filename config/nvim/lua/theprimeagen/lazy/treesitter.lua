return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            -- A list of parser names, or "all"
            ensure_installed = {
                "vimdoc", "javascript", "typescript", "c", "lua", "rust",
                "jsdoc", "bash", "html", "css", "json", "python", "yaml", "scss"
            },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,

            indent = {
                enable = true,  -- Enable Treesitter-based indentation
            },

            highlight = {
                -- Enable Treesitter highlighting
                enable = true,

                -- Set additional languages for Vim's regex highlighting
                additional_vim_regex_highlighting = { "markdown", "html", "css" },  -- Include HTML and CSS for regex highlights
            },

            -- Enable folding based on Treesitter
            fold = {
                enable = true,
            },
        })

        -- Register custom parser for templ language (already in your setup)
        local treesitter_parser_config = require("nvim-treesitter.parsers").get_parser_configs()
        treesitter_parser_config.templ = {
            install_info = {
                url = "https://github.com/vrischmann/tree-sitter-templ.git",
                files = {"src/parser.c", "src/scanner.c"},
                branch = "master",
            },
        }

        vim.treesitter.language.register("templ", "templ")
    end
}

