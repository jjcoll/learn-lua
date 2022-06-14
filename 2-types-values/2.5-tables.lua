--[[
  Table type is associative array, an array that can be indexed not only with numbers, but also with strings
  or any other value except for nil. Tables have no fixed size, you can add as many elements as you want 
  dynamically. Tables are the main (in fact, the only) data structuring mechanism in Lua, and a powerful one. 

  Tables are used to:
  - represent ordinary arrays
  - symbol tables
  - sets 
  - records 
  - queues
  - other data structures
  Lua also uses tables to represent packages as well. When we write io.read we mean "the read entry from the io package"
  For lua that means "index the table io using the string "read" as the key".

  Tables in Lua are neither values nor variables; they are objects.
  You may think of a table as a dynamically allocated object; your program only manipulates references (or pointers)
  to them. There are no hidden copies or creation of new tables behind the scenes. Moreover, you do not have to declare 
  a table in Lua; in fact, there is no way to declare one. You create tables by means of a constructor expression,
  which in its simplest form is written as {}:  (asdfasdf) 
]]

a = {}  -- create table and store its reference in 'a'
k = "x" 
a[k] = 10 -- new entry, with key = "x" and value = 10
a[20] = "great" -- new entry, with key = 20 and value = "great"
print(a["x"]) --> 10
k = 20
print(a[k])  --> "great"
a["x"] = a["x"] + 1  -- increments entry "x"
print(a["x"]) --> 11

print(type(a))
-- A table is always anonymous. No fixed relationship between a variable that holds a table and the table itself
a = {}
a["x"] = 10
b = a   -- 'b' refers to the same table as 'a'
print(b["x"])  --> 10
b["x"] = 20
print(a["x"])  --> 20
a = nil -- onlly 'b' still references to the table
b = nil -- no references left to the table
-- When a program has no references left to a table, Lua memory management will eventually delete the table and reuse its memory


a = {}  -- empty table
-- create 1000 new entries
for i=1,1000 do a[i] = i * 2 end
print(a[100] .. " 100 index of table")
a["x"] = 10
print(a["x"])
-- Like global variables, table fields evaluate to nil if not initialized, you can also assign nil to a table field
-- to delete it. 

-- To represent records, you use the field name as an index. Lua supports this representation by providing a.name as
-- syntactic sugar for a["name"], we could write the last example in a clearer manner
a.x = 10 -- same as a["x"] = 10
print(a.x) -- same as print(a["x"])
print(a.y) -- same as print(a["y"])


-- Common mistake for beginners is to confuse a.x with a[x]. The first form represents a["x"], that is, a table
-- indexed by the string "x". The second form is a table indexed by the value of the variable x

a = {}
x = "y"
a[x] = 10 --> put 10 in field "y" a["y"] = 10
print(a[x])  --> 10
print(a.x) --> nil 
print(a.y) --> 10


-- To represent a conventional array, you simply use a table with integer keys. There is no way to declare its size;
-- you just initialize the elements you need:
-- read 10 lines storing them in a table
a = {}
for i=1,15 do
  a[i - 1] = i
end
print(a[0])

-- When iterating elements of array, the first non-initialized index will result in nil, you can use this value
-- as a sentinel to represent the end of the array.

-- print the vales of array a
for i,element in ipairs(a) do
  print(i .. "is" .. element)
end

-- ipairs allows you to iterate over the elements of an array, following the convention that the array ends at its first
-- nil element

-- NOTE: Since you can index a table with any value, you can start the indices of an array with any number that pleases you.
-- However, it is customary in Lua to start arrays with one (and not with zero) and the standard libraries stick to this
-- convention
