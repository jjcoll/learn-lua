-- Some functions in Lua recieve a bariable number of arguments. For instance, we have already called print with 
-- one two and more args

-- Lets redefine print, that instead of printing the arguments, they are stored in a global variable for later use

printResult = ""

function print(...)
  for i,v in ipairs(arg) do
    printResult = printResult .. tostring(v) .. "\t"
  end
  printResult = printResult .."\n"
end

--[[
The three dots (...) in the parameter list indicate that the function has a variable number of arguments. When this 
function is called, all its arguments are collected in a single table, which the function accesses as a hidden paramter
named arg. Besides those arguments, the arg table has an extra field, n, with the actual number of arguments
collecte. 

Sometimes, a function has some fixed parameters plus a variable number of parameters. Let us see an example. 
When we write a function that retuns multiple values into an expression, only its first result is used. However, 
sometimes we want another result. A typical solution is to use dummy variables; for instance, if we want the second 
result from string.find, we may write the following code:
]]

local _, x = string.find(s, p)
-- now use 'x'

-- Alternative solution is to define a select function, which selects a specific return from a function:
print(string.find("hello hello", " hell")) --> 6 9
print(select(1, string.find("hello hello", " hel"))) --> 6
print(select(2, string.find("hello hello", " hell"))) --> 9

-- select has always one fixed argument, the selector, plus a variable number of extra arguments (the returns of a function). To 
-- accomodate this fixed argument, a funciton may have regular parameters before the dots. Then, Lua assigns the first 
-- arguments to those parameteres and only the extra argumetns (if any) go to arg. To better illustrate this point, assume a 
-- definition like
function g (a, b, ...) end
--[[
Then, we have the following mapping from arguments to parameters:
CALL            PARAMETERS
       
    g(3)             a=3, b=nil, arg={n=0}
    g(3, 4)          a=3, b=4, arg={n=0}
    g(3, 4, 5, 8)    a=3, b=4, arg={5, 8; n=2}
]]

-- Using those regular parameters, the definition of select is straight forward:
function select (n, ...)
  return arg[n]
end

--[[
Sometimes, a function with a variable number of arguments needs to pass them all to another function. All it has
to do is to call the other function using unpack(arg) as argument: unpack will return all values in arg, which will be
passed to the other function. 

Example:
]]
function fwrite(frm, ...)
  return io.write(string.format(fmt, unpack(arg)))
end
