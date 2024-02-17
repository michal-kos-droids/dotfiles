-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General keymaps -------------------

keymap.set("v", "<leader>p", '"_dP', { desc = "Paste without yanking" }) -- paste without yanking

keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" }) -- move line down
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" }) -- move line up

keymap.set("n", "J", "mzJ`z", { desc = "Join lines" }) -- join lines

keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" }) -- scroll down
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up" }) -- scroll up
keymap.set("n", "n", "nzz", { desc = "Jump to next match" }) -- jump to next match
keymap.set("n", "N", "Nzz", { desc = "Jump to previous match" }) -- jump to previous match

keymap.set("n", "<leader>y", '"+y', { desc = "Copy to clipboard" }) -- copy to clipboard
keymap.set("v", "<leader>y", '"+y', { desc = "Copy to clipboard" }) -- copy to clipboard
keymap.set("n", "<leader>Y", 'gg"+yG', { desc = "Copy all to clipboard" }) -- copy all to clipboard

keymap.set("n", "<leader>S", ":%s/\\<<C-r><C-w>\\>/", { desc = "Search and replace" }) -- search and replace

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x')
-- Jumplist 
-- keymap.set("n", "<C-m>", "<C-i>")

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })                   -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })                 -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })                    -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })               -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })                     -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })              -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })                     --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })                 --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { desc = "Navigate left" })               -- navigate left
keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { desc = "Navigate down" })               -- navigate down
keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { desc = "Navigate up" })                   -- navigate up
keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { desc = "Navigate right" })             -- navigate right

-- xcodebuild
keymap.set("n", "<leader>X", "<cmd>XcodebuildPicker<cr>", { desc = "Show Xcodebuild Actions" })
keymap.set("n", "<leader>xf", "<cmd>XcodebuildProjectManager<cr>", { desc = "Show Project Manager Actions" })
keymap.set("n", "<leader>xb", "<cmd>XcodebuildBuild<cr>", { desc = "Build Project" })
keymap.set("n", "<leader>xB", "<cmd>XcodebuildBuildForTesting<cr>", { desc = "Build For Testing" })
keymap.set("n", "<leader>xR", "<cmd>XcodebuildCleanBuild<cr>", { desc = "Clean Build Project" })
keymap.set("n", "<leader>xr", "<cmd>XcodebuildBuildRun<cr>", { desc = "Build & Run Project" })
keymap.set("n", "<leader>xt", "<cmd>XcodebuildTest<cr>", { desc = "Run Tests" })
keymap.set("v", "<leader>xt", "<cmd>XcodebuildTestSelected<cr>", { desc = "Run Selected Tests" })
keymap.set("n", "<leader>xT", "<cmd>XcodebuildTestClass<cr>", { desc = "Run This Test Class" })
keymap.set("n", "<leader>xL", "<cmd>XcodebuildToggleLogs<cr>", { desc = "Toggle Xcodebuild Logs" })
keymap.set("n", "<leader>xc", "<cmd>XcodebuildToggleCodeCoverage<cr>", { desc = "Toggle Code Coverage" })
keymap.set("n", "<leader>xC", "<cmd>XcodebuildShowCodeCoverageReport<cr>", { desc = "Show Code Coverage Report" })
keymap.set("n", "<leader>xe", "<cmd>XcodebuildTestExplorerToggle<cr>", { desc = "Toggle Test Explorer" })
keymap.set("n", "<leader>xs", "<cmd>XcodebuildFailingSnapshots<cr>", { desc = "Show Failing Snapshots" })
keymap.set("n", "<leader>xd", "<cmd>XcodebuildSelectDevice<cr>", { desc = "Select Device" })
keymap.set("n", "<leader>xp", "<cmd>XcodebuildSelectTestPlan<cr>", { desc = "Select Test Plan" })
keymap.set("n", "<leader>xQ", "<cmd>Telescope quickfix<cr>", { desc = "Show QuickFix List" })

-- keymap.set(
--   "n",
--   "<leader>xg",
--   "<cmd>!pushd /Users/michalkos/Workspace/mobilecccios/ && regenerate.sh; popd<cr>",
--   { desc = "Run tuist" }
-- )

keymap.set("n", "[i", "<cmd>silent cn<cr>zz", { desc = "Jump to next issue" })
keymap.set("n", "]i", "<cmd>silent cp<cr>zz", { desc = "Jump to previous issue" })


-- DAPUI
keymap.set('n', '<Leader>dq', function() require('dapui').toggle() end)

-- Oil
keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

-- LazyGit
keymap.set("n", "<C-g>", "<CMD>LazyGit<CR>", { desc = "Git" })

-- Fugitive
keymap.set("n", "<leader>gb", "<CMD>Git blame<CR>", { desc = "Git blame" })
