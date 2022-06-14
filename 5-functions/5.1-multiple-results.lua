--[[
Functions may return multiple results
Example:
string.find -- locates a pttern in a string
1. index of character where the pttern math starts
2. index where it ends

A multiple assignment allows the program to get both results
]]

s, e = string.find("hello Lua users", "Lua")
print(s, e) --> 7, 9

-- Functions written in Lua also can return multiple results, by listing them all after the return keyword. 
-- For instance, a function to find the maximum element in an array can return both the maximum value and its location

function maximum (a)
  local mi = 1    -- maximum index
  local m = a[mi] --maximum value
  for i,val in ipairs(a) do
    if val > m then
      mi = i
      m = val
    end
  end
  return m, mi
end

array = {3, 4 ,1, 3, 10, 4}
print(maximum(array)) --> 10 5

--[[
Lua always adjusts the number of results from a function to the circumstances of the call. When we call a function
as a statement, Lua discards all of its results. When we use a call as an expression, Lua keeps only the first result.
We get all results only when teh call is the last expresison in a list of expressions. These lists appear in four 
constructions in Lua: multiple assignment, arguments to function calls, table constructors, and return statements. 
]]

-- Illustrate all these uses
function foo0() end -- returns no results
function foo1 () return 'a' end -- returns 1 result
function foo2() return  'a', 'b' end -- returns 2 results

-- In a multiple assignment, a funciton call as the last (or only) expressions produces as many results as needed to 
-- match the variables
x,y = foo2() -- x = 'a' y='b'
x = foo2() -- x='a', 'b' is discarded
x,y,z = 10,foo2() -- x=10, y='a', z='b'

-- If a function has no results, or not as many results as we need, Lua produces a nils:
x,y = foo0() -- x=nil, y=nil
x,y = foo1() -- x='a', y=nil
x,y,z = foo2() -- x='a', y='b', z=nil

-- A function call that is not the last element in the list always produces one result:
x,y = foo2(), 20 -- x='a', y=20
x,y = foo0(), 20, 30 -- x='nil', y=20, 30 discarded

-- When a function call is the last (or the only) argument to another call, all results from the first call go as 
-- arguments. We have seen examples of this construction alreasy, with print:
print(foo0()) --> 
print(foo1()) --> a
print(foo2()) --> a b
print(foo2(), 1) --> a 1  (function call that is not the last element in the list always produces one result)
print(1, foo2()) --> 1 a b (because it is the last element in the list it will produce +1 result)
print(foo2() .. "x") --> ax

-- When the call to foo2 appears inside an expression, Lua adjusts the number of results to one; so, in the last line
-- only the "a" is used in the concatenation.

-- The print function may recieve a variable number of arguments. (In the next section we will see how to write function
-- with variable number of arguments.)
-- If we write f(g()) and f has a fixed number or arguments, Lua adjusts the number of results of g to go with the number
-- of parameters of f, as we saw previously. 

-- A constructor also collects all results from a call, without any adjustments:
a = {foo0()} -- a = {} (an empty table)
a = {foo1()} -- a = {"a"}
a = {foo2()} -- a = {'a', 'b'}

-- This behaviour only happens when the call is the last in the list; otherwise, any call produces exactly one result:
a = {foo2(), 4} -- a = {'a', 4}

-- A statement like return f() returns all values returne by f:
function foo (i)
  if i == 0 then return foo0()
  elseif i == 1 then return foo1()
  elseif i == 2 then return foo2()
  end
end

print(foo(1)) --> a 
print(foo(2)) --> a b
print(foo(3)) --> no results (blank)

-- return statements do not need parentheses around the returned value


-- Special function with multiple returns in unpack
-- Recieves an array and returns as results all elements from the array, starting from index 1:
print(unpack{10,20,30}) --> 10 20 30
a,b = unpack{10,20,30} -- a=10, b=20, 30 is discarded (looks like spread operator in JS)

--[[
Import use for unpack is in a generic call mechanism. A generic call mechanism allows you to call any function, 
with any arguments, dynamically. In ANSI C, for instance, there is no way to do that. You can declare a function
that recieves a variable number of arguments: Each call you write in C has a fixed number of arguments and each argument
has a fixed type. In Lua, if you want to call a variable function f with variable arguments in an arrya a, you simply wirte
]]
f(unpack(a))

-- The call to unpack returns all values in a, which become the arguments to f. For instance, if we execute
f = string.find
a = {"hello", "ll"}
f(unpack(a)) --> 3 4 (exactly the same as the static call string.find("hello", "ll"))

-- Although the predefined unpack is written in C we could also write it in Lua using recursion:
function unpack (t, i)
  i = i or 1
  if t[i] ~= nil then
    return t[i], unpack(t, i + 1)
  end
end

-- The first time we call it, with a single argument, i gets 1. Then the function returns t[1] followed by all results
-- from unpack(t, 2), which in turn returns t[2], followd by results from unpack(t, 3) and so on, until the last 
-- non-nil element.
