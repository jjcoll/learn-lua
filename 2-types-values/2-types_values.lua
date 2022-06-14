-- Lua is a dynamically typed language. There are no type definitions in the language; each value carries its own type 

--There are eight types in Lua: nil, boolean, string, userdate, function, thread, and tables. type functions gives name of given value

print(type("Hello World"))  --> string
print(type("10.4*3"))       --> number // no float or int
print(type(print))          --> function
print(type(type))           --> function
print(type(true))           --> boolean
print(type(nil))            --> nil
print(type(type(x)))        --> string

-- Last example with return string, because return type of type is always a strign
-- Even though type(x) would be nil (given that x is not defined)

print(type(a))  --> nil (a is not initialized)
a = 10
print(type(a))  --> number
a = "a string"  
print(type(a))  --> string
a = print       -- yes, this is value!
a(type(a))      --> function

-- Last two lines, Functions are first-class values in Lua; so, we can manipulate them like any other value
-- Using a single variable for different types is messy and not recommended
