--[[
Strings are a sequence of characters, you cannot change a character inside a string
You create a new string with the desired modifications
]]

a = "one string"
b = string.gsub(a, "one", "another")  -- change string parts
print(a)
print(b)

-- Lua handles long strings efficiently

--[[
Escape sequences:
    \a	bell
    \b	back space
    \f	form feed
    \n	newline
    \r	carriage return
    \t	horizontal tab
    \v	vertical tab
    \\	backslash
    \"	double quote
    \'	single quote
    \[	left square bracket
    \]	right square bracket
]]

-- Writting strings that contian program pieces
page = [[
    <HTML>
    <HEAD>
    <TITLE>An HTML Page</TITLE>
    </HEAD>
    <BODY>
     <A HREF="http://www.lua.org">Lua</A>
    </BODY>
    </HTML>
    ]]

print(page)

-- Conversion between numbers and strings at runtime
print("10" + 1)   --> 11
print("10 + 1")   --> 10 + 1
print("-5.3e-10"*"2")     --> -1.06e-09
-- print("hello" + "1") --> ERROR (cannot convert "hello")

-- When lua finds number when it expects a string this happens:
print(10 .. 20) --> 1020

-- (The .. is the concatenation operator in Lua, must use a space if not it thinks it is a decimal point)

-- Despite automatic conversion string and nums are different
print(10 == "10") --> false
-- convert string to number, use tonumber return nil if string does not denote a number
i = ("abc")
n = tonumber(i) -- try to convert it to a number
if n == nil then
--  error(i .. " is not a valid number")
  print(i .. " is not a valid number")
else
  print(i * 2)
end

-- Convert a number to string, you can call the function tostring or concatenate the number with the empty string:
print(tostring(10) == "10") --> true
print(10 .. "" == "10")  --> true


