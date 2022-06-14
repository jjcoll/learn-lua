function norm (x, y)
  local n2 = x^2 + y^2
  return math.sqrt(n2)
end

function twice (x)
  return 2 * x
end


-- This file can be run in interactive mode like this:
--[[
  dofile("lib1.lua")
  n = nrom(3.4, 1.0)
  print(twice(n))
--]]
