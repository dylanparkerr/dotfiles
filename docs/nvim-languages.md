treesitter parser:language server

lua:lua-language-server
python:pyright
go:gopls
java:jdtls(requires java17 as runtime)
javascript:typescript-language-server
terraform:terraformls
bash:(tbd)
sql:(tbd)

- command
    - :TSInstall lua python go java javascript bash sql dockerfile json markdown terraform yaml
    - :MasonInstall lua-language-server pyright gopls typescript-language-server jdtls terraform-ls

- things to remeber
    - when running :TSUpdate or TSInstall, use x64 Native Tools Command terminal on Windows so that treesitter has access to a C compiler
    - Mason may need npm to install things
