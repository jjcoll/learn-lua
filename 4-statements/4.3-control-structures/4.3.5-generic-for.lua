-- Generic for loop allows you to traverse all values returned by an iterator function

-- print all values of array 'a'
a = {
  "Monday",
  "Tuesday",
  "Wednesday",
  "X",
}
for i,v in ipairs(a) do print(v, i) end
-- for each step in this code, i gets an index while v gets the value associated with such index

-- print all keys of table 't'
t = {}
t["M"] = "day 1"
t["T"] = "day 2"
t["W"] = "day 3"
for k in pairs(t) do print(k) end

-- Generic loop shares two things with numeric loop:
-- 1. Loop variables are local
-- 2. never assign new value to loop variable

-- More concrete example of the use of a generic for, supose we have a table with the days of the week
    days = {"Sunday", "Monday", "Tuesday", "Wednesday",
            "Thursday", "Friday", "Saturday"}
-- Reverse table, has names as indices and the numbers as values
 revDays = {["Sunday"] = 1, ["Monday"] = 2,
  ["Tuesday"] = 3, ["Wednesday"] = 4,
  ["Thursday"] = 5, ["Friday"] = 6,
  ["Saturday"] = 7}

-- to find the order of a name is to index this reverse table
x = "Tuesday"
print(revDays[x])

-- Build automatic reverse table
revDays = {}
for i,v in ipairs(days) do
  revDays[v] = i
end


