--[[
all these operations always result in true or false:
< > <= >= == ~=(negation equality)

If values have different types lua considers them different Values. Otherwise, Lua compares them according to their
values. Nil is equal only to itself.
]]

-- Lua compares tables, userdata, and functions by reference, two such values are considered equal only if they are
-- the vary same object. 
a = {} ; a.x = 1 ; a.y = 0
b = {} ; b.x = 1 ; b.y = 0
c = a
print(a == c) --> true
print(a == b) --> false

--[[
We can apply the order operators only to two numbers or to two strings. Lua compares numbers in the usual way,
strings are compared in alphabetical order, which follows the locale set for Lua. 

The later in the alphabet the greater a letter is
]]

print("azz" < "bc")

"2" < "15" --> false alphabetical order
-- 2 < "15" --> ERROR
