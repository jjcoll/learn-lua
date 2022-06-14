-- As usual Lua, first tests the while condition; if the condition is false, then loop ends; otherwise, Lua 
-- executes the body of the loop and repeats the prcess.

a = {"Monday", "Tuesday", "Friday", "Thursday"}
local i = 1
while a[i] do -- will stop when the first nill value is encountered and evaluates to false 
  print(a[i])
  i = i + 1
end


