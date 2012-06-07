class TEST_JSON_01

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
         text := parser.parse_json_text(once "[%"24%", -27.013e4]")
         assert(parser.error = Void)

         create encoder.make

         encoder.set_pretty(False)
         json := ""
         encoder.encode_in(text, json)
         assert(json.is_equal(once "[%"24%",-27.013e4]"))

         encoder.set_pretty(True)
         json := ""
         encoder.encode_in(text, json)
         assert(json.is_equal(once "[
                                    [
                                        "24",
                                        -27.013e4
                                    ]

                                    ]"))
      end

end
