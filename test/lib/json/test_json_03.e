class TEST_JSON_03

insert
   EIFFELTEST_TOOLS
   JSON_HANDLER

create {}
   make

feature {}
   make is
      local
         text: JSON_TEXT
         parser: JSON_PARSER
         decoder: JSON_DECODER
         data: JSON_TYPED_DATA[JSON_VALUE]
         codec: AUX_JSON_CODEC
      do
         text := parser.parse_json_text(once "{%"foo%": [%"24%", -27.013e4], %"barfop%": {%"test%": false}}")
         assert(parser.error = Void)

         create decoder.make
         create codec

         data ::= decoder.decode(codec, text)

         assert(data.item /= text)
         assert(data.item.is_equal(text))
      end

end
