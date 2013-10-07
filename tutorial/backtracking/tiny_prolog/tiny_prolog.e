class TINY_PROLOG

create {ANY}
   make

feature {ANY}
   make is
      do
         create base.make
         create parser.make(base)
         from
            io.get_line
         until
            io.end_of_input
         loop
            parser.put_line(io.last_string)
            io.get_line
         end
      end

   base: BASE

   parser: PARSER

end -- class TINY_PROLOG
