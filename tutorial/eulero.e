class EULERO
create make
feature 
   low: INTEGER 1; high: INTEGER 999;
   make do
   print( "Sum of all naturals divisible for 3 or 5 lower than 1000 is: "+ 
   (low|..|high).aggregate(agent (progressive,i: INTEGER): INTEGER do 
      if i.divisible(3) or i.divisible(5) 
      then Result:=progressive+i 
      else Result:=progressive
   end, 0).out+"%N")
end
end
