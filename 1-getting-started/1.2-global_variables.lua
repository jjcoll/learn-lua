print(b)  --> nil
b = 10
print(b)  --> 10

-- If variable is going to have a short life, you should use a local variable
-- If you need to delete a global variable, just assign nil to it

b = nil
print(b) --> nil
