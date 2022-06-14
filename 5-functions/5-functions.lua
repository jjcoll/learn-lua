--[[
Functions are the main mechanism for abstraction of statements and expressions in Lua. Functions can both carry our
a specific task (what is sometimes called a procedure or subroutine in other launguges) or compute and return values.
In the first case, we use a function call as a statement; in the second case, we use it as an expression: 
]]

print(8*9, 9/8)
a = math.sin(3) + math.cos(10)
print(os.date())

--[[
In both cases, we write a list of arguments enclosed in parentheses. If the function call has no arguments, we must 
write an empty list () to indicate the call. There is a special case to this rule: If the function has one single
argument and this argument is either a literal string or a table constructor, then the parentheses are optional
]]
print "Hello World" 
print("Hello World")
dofile 'a.lua'
dofile('a.lua')
print [[a multi-line 
message]]
print([[a multi-line
message]])
type{}
type({})

-- Lua also offers a special syntax for adding object-oriented calls, the color operator. 
o:foo(x) --> o.foo(o, x)


-- Functions used by Lua program can be defined both in Lua and in C (or any other language used by host application)
-- All library functions are written in C but this has no effect for Lua programmers. When calling a function,
-- there is no difference between functions defined in Lua and functions defined in C.

-- A function definition has conventional syntax
-- add all elements of array 'a'
function add(a)
  local sum = 0
  for i,v in ipairs(a) do
    sum = sum + v
  end
  return sum
end

-- A function definition has a name (add in prev example), a list of parameters, and a body, which is a list of 
-- statements

--[[
Paramenters work exactly as local variables, initialized with the actual arguments given in the function call. You can
call a function with a number of arguments different from its number of parameters. Lua adjusts the number of arguments to the
number of parameters as it does with multiple assignment. Extra arguments are thrown away; extra parameters get nil.

    CALL             PARAMETERS
       
    f(3)             a=3, b=nil
    f(3, 4)          a=3, b=4
    f(3, 4, 5)       a=3, b=4   (5 is discarded)
]]

-- This behaviour can lead to progamming errors, it is also useful, especially for default arguments, consider the following
-- function to increment a global counter

-- You can increment counter by n or if n not specified it will default to 1
function incCount(n) 
  n = n or 1
  count = count + n
end

-- This function has 1 as its default argument; that is, the call incCount(), without arguments, increments count by one.
-- When you call incCount(), Lua first initizlizes n with nil; the or results in its second operand; and as a result Lua
-- assigns a defalut 1 to n


