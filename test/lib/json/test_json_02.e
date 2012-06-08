class TEST_JSON_02

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
         encoder: JSON_ENCODER
         json: STRING
      do
         text := parser.parse_json_text(create {STRING_INPUT_STREAM}.from_string("{%"foo%": [%"24%", -27.013e4], %"barfop%": {%"test%": false}}"))
         assert(parser.error = Void)

         create encoder.make

         encoder.set_pretty(False)
         json := ""
         encoder.encode_in(text, create {STRING_OUTPUT_STREAM}.connect_to(json))
         assert(json.is_equal(once "{%"foo%":[%"24%",-27.013e4],%"barfop%":{%"test%":false}}"))

         encoder.set_pretty(True)
         json := ""
         encoder.encode_in(text, json)
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

end
