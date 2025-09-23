local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()

vim.keymap.set("n", "<leader>hh", function() harpoon:list():append() end, { desc = "Harpoon add" })
vim.keymap.set("n", "<leader>H", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon menu" })
vim.keymap.set("n", "<leader>hm", "<Cmd> Telescope harpoon marks<CR>", { desc = "Harpoon marks" })

vim.keymap.set("n", "<a-1>", function() harpoon:list():select(1) end, { desc = "Harpoon select 1" })
vim.keymap.set("n", "<a-2>", function() harpoon:list():select(2) end, { desc = "Harpoon select 2" })
vim.keymap.set("n", "<a-3>", function() harpoon:list():select(3) end, { desc = "Harpoon select 3" })
vim.keymap.set("n", "<a-4>", function() harpoon:list():select(4) end, { desc = "Harpoon select 4" })

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end, { desc = "Harpoon prev" })
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end, { desc = "Harpoon next" })

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon window" })
