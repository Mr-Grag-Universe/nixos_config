{ lib, config, ... }:
{
	config = {
		globals.mapleader = " ";
		keymaps = [
{
	mode = "n";
        key = "<leader>w";
        action = "<cmd>w<cr><esc>";
        options = {
        	silent = true;
        	desc = "Save file";
        };
}
		];
	};
}
