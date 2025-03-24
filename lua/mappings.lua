require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")


-- Custom

map("n", "<leader>pv", "<cmd> NvimTreeToggle <cr>", { desc = "Toggle NvimTree"})



local harpoon = require("harpoon")

-- -- REQUIRED
-- harpoon:setup()
-- REQUIRED

map("n", "<leader>a", function() harpoon:list():add() end)
map("n", "<leader>b", function() harpoon:list():remove() end)
map("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

-- map("n", "<C-h>", function() harpoon:list():select(1) end)
-- map("n", "<C-t>", function() harpoon:list():select(2) end)
-- map("n", "<C-n>", function() harpoon:list():select(3) end)
-- map("n", "<C-s>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
map("n", "<C-[>", function() harpoon:list():prev() end)
map("n", "<C-]>", function() harpoon:list():next() end)

map("n", "<C-s>", function() harpoon:list():delete(1) end)




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

map("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon window" })
