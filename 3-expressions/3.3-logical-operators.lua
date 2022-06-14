--[[
The logical operators are and, or, and not. All logical operators consider false and nil as false, and anything else
as true. The operator and returns its first argument if it is false; otherwise, it returns its second argument.
The operator or returns its first argument if it is not false; otherwise, it returns its second argument. 
]]

print(4 and 5) --> 5
print(nil and 13) --> nil
print(false and 13) --> false
print(4 or 5) --> 4
print(false or 5) --> 5

-- Both and 'and' or use short-cut evaluation, which means that they evaluate thier second operand only when necessary.

-- Useful Lua idiom:
x = x or v -- equivalent to: if not x then x = v end
-- This sets x to a default value v when x is not set (proveded that x is not set to false)

--Another useful idiom is (a and b) or c(or simply a and b or c) because and has higher precedence than or.
-- Equivalent to C expression: a ? b : c (Ternary operator)
-- (RETURN TRUE IF NAME IS EQUAL TO TOM or NAME IS NOT TOM)
a = "TOMY"
print(a and a == "TOM" or "NAME IS NOT TOME") -- would be equal to:  a ? a == "TOM" : "Name is not tom"

-- We can select the maximum of two numbers x and y with this statement
max = (x > y) and x or y
-- when x > y, the expression of the and is true, so the and results in its second expression (x), (which also is 
-- true, because x is a number) and then the or expression results in the value of its first expression, x. 
-- When x > y, is false, the and expression if false and so the or results in its second expression, y.

-- The not operator always returns true or false
print(not nil) --> true
print(not false) --> true
print(not 0) --> false
print(not not nil) --> false

