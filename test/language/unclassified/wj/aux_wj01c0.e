class AUX_WJ01C0

feature {ANY}
   a: AUX_WJ01A0

   output (arg: like a): STRING
      do
         Result := arg.x0.out
         -- IN C0
      end

end -- class AUX_WJ01C0
