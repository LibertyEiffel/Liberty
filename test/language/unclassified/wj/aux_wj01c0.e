class AUX_WJ01C0
feature
  a: AUX_WJ01A0;
  output(arg: like a): STRING is
      do
	 Result := arg.x0.out; -- IN C0
      end
end
