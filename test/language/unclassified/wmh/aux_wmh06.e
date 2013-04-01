class AUX_WMH06
inherit DISPOSABLE
creation make
feature

   make is
      do
      end;

feature {}

   dispose is
      do
    dispose_count := dispose_count + 1;
    if dispose_count > 1 then
       io.put_string("Error in TEST_WMH06.%N");
    end;
      end;

   dispose_count : INTEGER

end
