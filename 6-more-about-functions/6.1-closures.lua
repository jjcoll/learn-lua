--[[
When a functino is written enclosed in another function, it has full access to local variables from the enclosing
function; this feature is called lexical scoping. Lexical scoping, plus first-class functions, is a powerful
concept in a programming language, but few languages support that concept.

Simple example:
List of student names and a table that associates names to grades; you want to sort the list of names,
according to their grades (higher grades first). You can do this as follows:
]]

local names = {"Peter", "Paul", "Mary"}
local grades = {Mary = 10, Paul = 7, Peter = 8}
table.sort(names, function(n1, n2)
  return grades[n1] > grades[n2] -- compare grades
end)

-- Now, supose you want to create a function to do this task
function sortbygrade (names, grades)
  table.sort(names, function (n1, n2)
    return grades[n1] > grades[n2] --compare grades
  end)
end

--[[
The interesting point in the example is that the anonymous funciton is given to sort accesses the parameter grades, 
which is local to the enclosing function sortbygrade. Inside this anonymous function, grades in neither local nor global.
We call it an external local variable, or an upvalue. (term 'upvalue' is a little misleading, because grades is a 
variable not a value) However, this term has historical roots in Lua and it is shorter than the term 'external local variable')
]]


function newCounter () 
  local i = 0
  return function() -- anonymous function
    i = i + 1
    return i
  end
end

c1 = newCounter()
print(c1())
print(c2())
