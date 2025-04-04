-- return {
-- 	"folke/todo-comments.nvim",
-- 	event = { "BufReadPre", "BufNewFile" },
-- 	dependencies = { "nvim-lua/plenary.nvim" },
-- 	config = function()
-- 		local todo_comments = require("todo-comments")
--
-- 		local keymap = vim.keymap -- for conciseness
--
-- 		-- FIX: mappings conflict with unimpaired tag mappings
-- 		-- keymap.set("n", "]t", function()
-- 		-- 	todo_comments.jump_next()
-- 		-- end, { desc = "Next todo comment" })
-- 		--
-- 		-- keymap.set("n", "[t", function()
-- 		-- 	todo_comments.jump_prev()
-- 		-- end, { desc = "Previous todo comment" })
--
-- 		todo_comments.setup()
-- 	end,
-- }
return {
  "folke/todo-comments.nvim",
  optional = true,
  keys = {
    { "<leader>st", function() Snacks.picker.todo_comments() end, desc = "Todo" },
    { "<leader>sT", function () Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } }) end, desc = "Todo/Fix/Fixme" },
  },
}
