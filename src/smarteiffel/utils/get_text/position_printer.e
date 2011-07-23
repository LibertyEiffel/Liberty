class POSITION_PRINTER

inherit
   ANY
      redefine
         print_on
      end

creation
   set_position, default_create

feature {ANY}
   print_on (file: OUTPUT_STREAM) is
      local
         buffer: STRING
      do
         buffer := once ""
         buffer.clear_count
         position.append_in(buffer)
         file.put_string(buffer)
      end

feature {ANY}
   set_position (position_: like position) is
      do
         position := position_
      ensure
         position = position_
      end

   position: POSITION

end -- class POSITION_PRINTER
