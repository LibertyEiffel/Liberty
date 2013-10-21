class TINY_PROLOG

create {ANY}
   make

feature {ANY}
   make is
      do
         create base.make
         create parser.make(base)
         from
            io.read_line
         until
            io.end_of_input
         loop
            parser.put_line(io.last_string)
            io.read_line
         end
      end

   base: PROLOG_DATABASE

   parser: PROLOG_PARSER

end -- class TINY_PROLOG
