-- Stand-Alone Interpreter
--[[
lua.c (source file) or lua its executable
It allows direct use of lua

When Interpreter loads a file and it starts with # it gets ignored
This allows the use of Lua as script interpreter in Unix systems

#!/usr/local/bin/lua
or
#/usr/bin/env lua


usage of lua
lua [options] [script [args]]   --[[

-e option enters code directly into the command line
lua -e "print(math.sin(12))"

lua -i -l a.lua -e "x = 10"
load file a.lua execute the assignment x = 10, and prompt for interaction

when global variable _PROMT is defined, lua uses its value as the prompt when interacting
you can change the prompt with a call like this 
prompt> lua -i -e "_PROMTPT=' lua> '"

Lua looks for an environment variable called LUA_INIT. if it exists and its content is @filename, then lua
loads the given file. If LUA_INIT is defined but does not start with '@', then lua assumes that it contains Lua 
code and runs it. This variable gives you great powser when configuring the stand-alone interpreter, 
because you have the fuill power of Lua in the configuration. YOu can pre-load packages, change the prompt and the 
path, define your own functions, rename of delete functions, and so on.


In a call like lua script a b c 
lua creates the table arg with all the command-line arguments, before the script. script name index 0,
first argument (a in example) index 1, and so on.
Options will go to negative indices, as they appear before the script


]]
