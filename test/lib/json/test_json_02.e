class TEST_JSON_02

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
         encoder: JSON_ENCODER
         json: STRING
      do
         create parser.make(agent on_error(?))
         text := parser.parse_json_text(create {STRING_INPUT_STREAM}.from_string("{%"foo%": [%"24%", -27.013e4], %"barfop%": {%"test%": false}}"))
         assert(error = Void)
         assert(text /= Void)

         create encoder.make

         encoder.set_pretty(False)
         json := ""
         encoder.encode_in(text, create {STRING_OUTPUT_STREAM}.connect_to(json))
         assert(json.is_equal(once "{%"foo%":[%"24%",-27.013e4],%"barfop%":{%"test%":false}}"))

         encoder.set_pretty(True)
         json := ""
         encoder.encode_in(text, create {STRING_OUTPUT_STREAM}.connect_to(json))
         assert(json.is_equal(once "[
                                    {
                                        "foo":    [
                                            "24",
                                            -27.013e4
                                        ],
                                        "barfop": {
                                            "test": false
                                        }
                                    }

                                    ]"))
      end

   error: ABSTRACT_STRING
   on_error (message: ABSTRACT_STRING)
      do
         sedb_breakpoint
         error := message
      end

end
