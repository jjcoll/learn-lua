-- if statement tests condition and executes its then-part or else-part accordingly (else-part optional)

if a<0 then a = 0 end

if a<b then return a else return b end

if line > MAXLINES then
  showpage()
  line=0
end

-- When you write nested ifs, you can use elseif, similar to else followed by if, but avoids using multiple ends

if day == "M" then
  print("Work")
elseif day == "S"then
  print("Study")
else
  print("Chill")
end

