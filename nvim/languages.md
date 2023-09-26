treesitter parser:language server

lua:lua-language-server
python:pyright
go:gopls
java:(tbd)
javascript:typescript-language-server
bash:(tbd)
sql:(tbd)

- command
    - :TSInstall lua python go java javascript bash sql
    - :MasonInstall lua-language-server pyright gopls typescript-language-server

- things to remeber
    - when running :TSUpdate or TSInstall, use x64 Native Tools Command terminal on Windows so that treesitter has access to a C compiler
    - Mason may need npm to install things
