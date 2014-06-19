class TEST_JSON_03

insert
   EIFFELTEST_TOOLS
   JSON_HANDLER

create {}
   make

feature {}
   make
      local
         text: JSON_TEXT
         parser: JSON_PARSER
         decoder: JSON_DECODER
         data: JSON_TYPED_DATA[JSON_VALUE]
         codec: AUX_JSON_CODEC
      do
         create parser.make(agent on_error(?))
         text := parser.parse_json_text(create {STRING_INPUT_STREAM}.from_string("{%"foo%": [%"24%", -27.013e4], %"barfop%": {%"test%": false}}"))
         assert(error = Void)
         assert(text /= Void)

         create decoder.make
         create codec

         data ::= decoder.decode(codec, text)

         assert(data.item /= text)
         assert(data.item.is_equal(text))
      end

   error: ABSTRACT_STRING
   on_error (message: ABSTRACT_STRING)
      do
         sedb_breakpoint
         error := message
      end

end
