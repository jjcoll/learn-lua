--[[
  The number type represents real (double-precision floating-point) numbers. Lua has no integer type,
  as it does not need it.
  The fact is that , when you use a double to represent an integer, there is no rounding error at all
  (unless the number is greater than 100,000,000,000,000). Specifically, a Lua number can represent any long
  integer without rounding problems. Moreover, most modern CPUs do floating-point arithmetic as fast as (or even faster than)
  integer arithmetic.

  It is easy to compile Lua so that it uses type for numbers, such as long or single-precision floats. this is particulary
  userul for platforms without hardware suport for floating point. See the distribution for detailed instructions. 

  We can write numeric constatns with an optional decimal part, plus an optional decimal exponent. Examples of valid
  numeric constants are:
  
]]
