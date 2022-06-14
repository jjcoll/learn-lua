-- Assignment is the basic means of changing the value of a variable or a table field:
a = "hello" .. "world"

t = {}
t["n"] = 2
t.n = t.n + 1
print(t.n)

-- Lua allows multimple assignment, where a list of values is assigned to a list of variables in one step. Both lists
-- have their elements separated by commas
x = 10
a,  b = 10, 2 * x
-- a gets the value 10, and be gets 2 * x

-- In a multiple assignment, Lua first evaluates all values and only then executes the assignment. Therefore, 
-- we can use a multiple assigment to swap two values, as in:
x = 2
y = 3
x, y = y, x --> sway 'x' for 'y'

-- Lua always adjusts the number of values to the number of variables, extra variables recieve nil as value
-- when list of values is longer, the extra values are silentty discarded
a, b, c = 0, 1
print(a, b, c) --> 0 1 nil
a, b = a+1, b+1, b+2 -- value b+2 ignored
print(a, b) --> 1, 2
a, b, c = 0
print(a, b, c) --> 0 nil nil
-- This last assignment shows a common mistake, To initialize a set of variables, you must provide a value for each one:
a, b, c = 0, 0, 0
print(a, b, c) --> 0 0 0

-- This is usefull when we a function has multiple returns, in such cases, a single expression can supply the values
-- for several variables. 

a, b = f()
-- f() returns two results: a gets the first and b gets the second

