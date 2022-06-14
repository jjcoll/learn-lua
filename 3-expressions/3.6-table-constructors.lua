-- Constructors are expressions that create and initialize tables. They are a distinctive feature of Lua and one of its
-- most useful and versatile mechanisms

--[[
The simplest constructor is the empty constructor, {}, which creates an empty table.
Constructors also initialize arrays (called also sequences or lists)
]]

days = {
  "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"
}

-- will initialize day[1] with the string "Sunday", (the first element has always index 1, not 0)
print(days[4]) --> Wednesday

-- Constructors do not need to use only constant expressions. We can use any kind of expression for the value of each
-- element. For instance, we can build a short sine table as
-- tab = {sin(1), sin(2), sin(3), sin(4)}

-- To initialize a table to be used as a record, Lua offers the following syntax:
a = {x=0, y=0}
-- equivalent to:
a = {}; a.x=0; a.y=0

w = {x}

-- Every time Lua evaluates a constructor, it creates and initializes a new table. Consequently, we can use tables
-- to implement linked lists:
list = nil
for line in io.lines() do
  list = {next=list, value=line}
end

