-- The for statement has two variants: the numeric for and the generic for

-- Numeric for has the following syntax
--[[
  for var=start, end, increment do
  something
end

when increment is not present, it uses 1
]]

for i=10,1,-1 do print(i) end
-- prints 10,9,8

-- For loop has some subtelties:
-- all three expressions are evaluated once, before the loop starts
-- the control variable stays local for the scope of the loop
-- If you want to break a for loop before normal termination use break






