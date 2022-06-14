-- Besides global variables, lua supports local variables
j = 10  -- global variable
local i = 1 -- local variable

-- Unlike global variables, local variables have their scope limited to the block where they are declared. A block is 
-- the body of a control structure, the body of a function, or a chunk (the file or string with the code where the variable)
-- is declared
x = 10
local i = 1 -- local to the chunk

while i<=x do 
  local x = i*2 -- local to the while body
  print(x)
  i = i + 1
end

if i > 20 then 
  local x -- local to the "then" body
  x = 20
  print(x + 2)
else
  print(x)
end

a = 30
b = 3
x = "hola"
if a > 20 then
  local x = "adios"
  print(x) --> "adios" (local)
else 
  print(x) --> "hola" (global)
end

-- Good programming style to use local variables when possible. These avoid cluttering the global environment with 
-- unecessary names. Moreover, the access to local variables is faster than to global ones. 

-- Lua handles local variable declarations as statements. As such, you can write local declarations anywhere you can
-- write a statement. The scope begins after the declaration and goes until the end of the block. The declaration
-- may include an initial assignment, which works the same way as a conventional assignment: Extra values are thrown
-- awway; extra variables get nil. As a specific case, if a declaration has no initial assignment, it initilizes all its 
-- variables with nil. 

local a, b = 1, 10
if a<b then
  print(a) --> 1
  local a
  print(a) --> nil
end -- ends the blcok started at 'then'
print(a, b) --> 1 10

-- common idiom in Lua is 
local foo = foo
-- creates local variable, foo, and initilizes it with the value of global variable foo. That idiom is useful when 
-- the chunk needs to preserve the original value of foo even if later some other function changes the value of the global foo;
-- it also speeds up access to foo. 

-- We can delimit a block explicitly, bracketing it with the keywords do-end. These do blocks can be useful when
-- you need finer control over the scope of one or more local variables:
do 
  local a2 = 2*a
  local d = 4
  x1 = (a2 + d)
  x2 = (d - a2)
end -- scope of 'a2' and 'd' ends here





