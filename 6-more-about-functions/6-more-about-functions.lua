--[[
Functions in Lua are first-call values with proper lexical scoping

What is "first-class value", it means that in Lua, a function is a value with the same rights as conventional values
like numbers and strings. Functions can be stored in variables (both global and local) and in tables, can be passed
as arguments, and can be returned by other functions

What is "lexical scoping", it means that functions can access variables of its enclosing functions. (It also means
that Lua contains the lambda colculus properly.) This allows us to apply in Lua many powerful programming techniques
from the functional-language world. This can make you programs smaller and simpler.

A somewhat difficult notion in Lua is that functions, like all other variables, are anonymous; they do not have names.
When we talk about a function name, say 'print' we are actually talking about a variable that holds that function. 
Liek any other variable holding any other value, we can manipulate such variables in many ways. The following example 
although a little silly, shows the point:
]]

a= {p = print}
a.p("Hello World") --> Hello World
print = math.sin -- 'print' now refers to the sine function
a.p(print(1)) --> 0.8124
sin = a.p -- 'sin' now refers to the print function
sin(10, 20) --> 10, 20

-- Later we will see more more useful applications for this facility

-- If functions are values, are there any expressions that create functions? Yes. In fact, the usual way to write a function in Lua, like
function foo (x) return 2*x end
-- is just an instance of what we call syntactic suger; in other words, it is just a pretty way to write
foo = function (x) return 2*x end

--[[
That is, a funciton definition a statement (an assignment, more specificaly) that assigns the a value of type function
to a variable. We can see the expression function (x) ... end as a function constructor, just as {} is a table constructor
We call the result of such function constructor an anonymous function. 

Example of anonymous functions:
table library provides a function table.sort, which recieives a table and sorts its elements. Such function must
allow unlimited variations in the sort order: ascending, descending, numeric, alphabetical, tables soreted by a key 
and so on. Instead of trying to provide all kinds of options, sort provides a single optional paramter, which is the order 
function: a function that receives two elements and returns whether the first must come before the second in the sort.
For instance, suppose we have a table of records such as
]]
network = {
       {name = "grauna",  IP = "210.26.30.34"},
       {name = "arraial", IP = "210.26.30.23"},
       {name = "lua",     IP = "210.26.23.12"},
       {name = "derain",  IP = "210.26.23.20"},
     }
-- We want to sort the table by the field name, in reverse alphabetical order, we just write:
table.sort(network, function(a,b)
  return (a.name > b.name)
end)

-- Anonymous function is really handy in that statement


--[[
Function that gets another function as a n argument, such as sort, is what we call a higher-order function. 
Higher-order functions are powerful programming mechanism and the use of anonymous functions to create their 
function arguments is a great source of flexibility. But remember that higher-order functions have no special 
rights; they are a simple consequence of the ability of Lua to handle functions as first-class values. 
]]

--Because functions are first-class values in Lua, we can store them not only in global variables, but also in local
-- variables and in table fields. As we will see later, the use of functions in table fields is a key ingredient
-- for some advanced uses of Lua, such as packages and object-oriented programming.

