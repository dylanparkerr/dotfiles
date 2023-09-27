local wk = require("which-key")

wk.setup({
    -- window = {
    --     border = "single"
    -- },
    plugins = {
        presets = {
            operators = false, -- adds help for operators like d, y, ...
            motions = false, -- adds help for motions
            text_objects = false, -- help for text objects triggered after entering an operator
            windows = false, -- default bindings on <c-w>
            nav = false, -- misc bindings to work with windows
            z = false, -- bindings for folds, spelling and others prefixed with z
            g = false, -- bindings for prefixed with g
        }
    }
})

wk.register({
    ["Y"] = "Yank from cursor to end of line",
    ["<C-/>"] = "Toggle terminal",
    ["<C-_>"] = "which_key_ignore",
    ["<leader>"] = {name = "Leader"},
    ["&"] = "which_key_ignore",
    ["%"] = "which_key_ignore",
    ["<"] = "which_key_ignore",
    [">"] = "which_key_ignore",
    ["!"] = "which_key_ignore",
    ["["] = "which_key_ignore",
    ["]"] = "which_key_ignore",
    ["<M-n>"] = "which_key_ignore",
    ["<M-p>"] = "which_key_ignore",
    ["z"] = "which_key_ignore",
    g = {
        name = "LSP",
        d = "Go to definition",
        r = "Go to references",
        i = "Go to implementation",
        t = "Go to type definition",
        h = "Show hover text",
        n = "Rename token",
        a = "Show code actions",
        f = "Format code",
        ["%"] = "which_key_ignore",
        ["x"] = "which_key_ignore",
        ["~"] = "which_key_ignore",
        ["u"] = "which_key_ignore",
        ["U"] = "which_key_ignore",
    },
    s = {name = "Surrounding..",
        a = "Add X around object",
        d = "Delete X around object",
        h = "Highlight X around object",
        r = "Replace X around object",
        f = "which_key_ignore",
        F = "which_key_ignore",
        n = "which_key_ignore",
    },
},{})

wk.register({
    f = {
        name = "Find",
        f = "Find local file",
        g = "Find git project file",
        c = "Find word in current buffer",
        p = "Find word in current project",
        h = "Find help tags",
        b = "Find file in browser"
    },
    p = {
        name = "Project",
        p = "Switch project"
    },
    s ={
        name = "Split",
        h = "horizontal split",
        v = "vertical split",
        c = "close split",
    },
    d = {
        name = "Diff",
        p = "Preview diff hunk",
        v = "View full diff"
    },
    b = {
        name = "Buffer",
        d = "Delete current buffer"
    },
    c = { name = "Comment",
        c= "Comment line"
    }
}, { prefix = "<leader>" })

