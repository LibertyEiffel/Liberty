expanded class PARSER_MARK

feature {ANY}
   position: INTEGER

   is_begin: BOOLEAN

   is_end: BOOLEAN is
      do
         Result := not is_begin
      end

   parseable: PARSER_PARSEABLE

   make_begin (pos: INTEGER; what: like parseable) is
      do
         is_begin := True
         position := pos
         parseable := what
      end

   make_end (pos: INTEGER; what: like parseable) is
      do
         is_begin := False
         position := pos
         parseable := what
      end

end
