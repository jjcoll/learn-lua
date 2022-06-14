--[[
Functions are first-class values in Lua. That means that functions can be stored in variables, passed as arguments
to other functions, and returned as results. Such facilities give great flexibility to the language: A program
may redefine a function to add new functionality, or simply erease a function to create a secure environment,
when running a piece of untrusted code (such as code recieved through a network). Moreover, Lua offers good support
for functional programming, including nested functions with proper lexical scoping; just wait. Finally, first-class
functions play a key role in Lua's object-oriented facilities, as we will see later on. 

Lua can call functions written in Lua and functions written in C. All the standard library in Lua is written in C.
It comprises functions for string manipulation, table manipulation, I/O, access to basic operating system facilities,
mathematical functions, and debugging. Application programs may define other functions in C.
]]
