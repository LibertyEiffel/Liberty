class TEST_UW02
-- From a bug report of Ulrich Windl
create {}
   make

feature
   make is
      local
    s: STRING;
      do
    s := dummy_once;
      end; -- make
   

   dummy_once: STRING is
      do
    Result := "Is this stupid ;-)";
      end;

end 
