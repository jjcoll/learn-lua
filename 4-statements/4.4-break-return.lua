-- Break and return statements allow us to jump out from an inner block

-- Use break statement to finish a loop. 

-- return returns occasional return from a function or simply finishes a function. There is implicit return at the end
-- of any funciton, so you do not need to use one if your function ends naturally

-- For syntactic reasons, a break or return can only appear as the last statement of a block, or just before an
-- end else or until.

local i = 1
v = 10
while a[i] do
  if a[i] == v then break end
  i = i + 1
end

-- GOOD FOR DEBUGGING
function foo()
  do return end
  -- code
  -- more 
  -- and 
  -- more 
end
