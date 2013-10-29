expanded class PARSER_CONTEXT

feature {ANY}
   depth, position: INTEGER

   make (d,p: INTEGER) is
      do
         depth := d
         position := p
      end

end
