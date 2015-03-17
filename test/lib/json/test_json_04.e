class TEST_JSON_04

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      do
         prepare_storage_pickle
         test_commit
         test_update
      end

   test_commit
      local
         str: STRING
         strout: STRING_OUTPUT_STREAM
         repo: JSON_STREAM_REPOSITORY[STRING]
      do
         str := ""
         create strout.connect_to(str)
         create repo.connect_to(Void, strout)

         repo.put("foobar", "test")
         repo.put("hello world", "greetings")

         assert(repo.is_commitable)
         repo.commit
         assert(str.is_equal(pickle))
      end

   test_update
      local
         strin: STRING_INPUT_STREAM
         repo: JSON_STREAM_REPOSITORY[STRING]
         value: STRING
      do
         create strin.from_string(pickle)
         create repo.connect_to(strin, Void)
         repo.update

         assert(repo.count = 2)

         assert(repo.has("test"))
         value := repo.at("test")
         assert(value.is_equal("foobar"))
         assert(repo.has("greetings"))
         value := repo.at("greetings")
         assert(value.is_equal("hello world"))

         if repo.item(1).is_equal("hello world") then
            assert(repo.key(2).is_equal("test"))
            assert(repo.item(2).is_equal("foobar"))
            assert(repo.key(1).is_equal("greetings"))
            assert(repo.item(1).is_equal("hello world"))
         else
            assert(repo.key(1).is_equal("test"))
            assert(repo.item(1).is_equal("foobar"))
            assert(repo.key(2).is_equal("greetings"))
            assert(repo.item(2).is_equal("hello world"))
         end
      end

feature {} -- Expected pickle data (depends on compilation mode)
   storage_pickle: STRING

   check_storage_pickle: BOOLEAN
      do
         debug
            storage_pickle := "%N%
            %                %"storage_signature_count%": {%N%
            %                    %"*%":     %"basic%",%N%
            %                    %"type%":  %"INTEGER_32%",%N%
            %                    %"value%": %"4%"%N%
            %                },%N%
            %                %"has_storage_signature%":   {%N%
            %                    %"*%":     %"basic%",%N%
            %                    %"type%":  %"BOOLEAN%",%N%
            %                    %"value%": %"True%"%N%
            %                },"
         end
         if storage_pickle = Void then
            -- not debug
            storage_pickle := "%N%
            %                %"storage_signature_count%": {%N%
            %                    %"*%":     %"basic%",%N%
            %                    %"type%":  %"INTEGER_32%",%N%
            %                    %"value%": %"0%"%N%
            %                },%N%
            %                %"has_storage_signature%":   {%N%
            %                    %"*%":     %"basic%",%N%
            %                    %"type%":  %"BOOLEAN%",%N%
            %                    %"value%": %"False%"%N%
            %                },"
         end
         Result := True
      end

   prepare_storage_pickle
      require
         storage_pickle = Void
      do
         check
            check_storage_pickle
         end
         if storage_pickle = Void then
            storage_pickle := "%N%
            %                %"storage_signature_count%": {%N%
            %                    %"*%":     %"basic%",%N%
            %                    %"type%":  %"INTEGER_32%",%N%
            %                    %"value%": %"0%"%N%
            %                },"
         end
      ensure
         storage_pickle /= Void
      end

   pickle: STRING
      once
         Result := ("[
                    {
                        "*":       "repository",
                        "version": "1",
                        "data":    {
                            "test":      1,
                            "greetings": 2
                        },
                        "refs":    [
                            {
                                "*":    "layout",
                                "type": "STRING",
                                "ref":  1,
                                "data": {#(1)
                                    "generation":              {
                                        "*":     "basic",
                                        "type":  "INTEGER_32",
                                        "value": "1"
                                    },
                                    "storage_lower":           {
                                        "*":     "basic",
                                        "type":  "INTEGER_32",
                                        "value": "0"
                                    },
                                    "capacity":                {
                                        "*":     "basic",
                                        "type":  "INTEGER_32",
                                        "value": "6"
                                    },
                                    "storage":                 {
                                        "*":        "array",
                                        "type":     "CHARACTER",
                                        "capacity": 6,
                                        "data":     [
                                            {
                                                "*":     "basic",
                                                "type":  "CHARACTER",
                                                "value": "102"
                                            },
                                            {
                                                "*":     "basic",
                                                "type":  "CHARACTER",
                                                "value": "111"
                                            },
                                            {
                                                "*":     "basic",
                                                "type":  "CHARACTER",
                                                "value": "111"
                                            },
                                            {
                                                "*":     "basic",
                                                "type":  "CHARACTER",
                                                "value": "98"
                                            },
                                            {
                                                "*":     "basic",
                                                "type":  "CHARACTER",
                                                "value": "97"
                                            },
                                            {
                                                "*":     "basic",
                                                "type":  "CHARACTER",
                                                "value": "114"
                                            }
                                        ]
                                    },
                                    "count":                   {
                                        "*":     "basic",
                                        "type":  "INTEGER_32",
                                        "value": "6"
                                    }
                                }
                            },
                            {
                                "*":    "layout",
                                "type": "STRING",
                                "ref":  2,
                                "data": {#(1)
                                    "generation":              {
                                        "*":     "basic",
                                        "type":  "INTEGER_32",
                                        "value": "1"
                                    },
                                    "storage_lower":           {
                                        "*":     "basic",
                                        "type":  "INTEGER_32",
                                        "value": "0"
                                    },
                                    "capacity":                {
                                        "*":     "basic",
                                        "type":  "INTEGER_32",
                                        "value": "11"
                                    },
                                    "storage":                 {
                                        "*":        "array",
                                        "type":     "CHARACTER",
                                        "capacity": 11,
                                        "data":     [
                                            {
                                                "*":     "basic",
                                                "type":  "CHARACTER",
                                                "value": "104"
                                            },
                                            {
                                                "*":     "basic",
                                                "type":  "CHARACTER",
                                                "value": "101"
                                            },
                                            {
                                                "*":     "basic",
                                                "type":  "CHARACTER",
                                                "value": "108"
                                            },
                                            {
                                                "*":     "basic",
                                                "type":  "CHARACTER",
                                                "value": "108"
                                            },
                                            {
                                                "*":     "basic",
                                                "type":  "CHARACTER",
                                                "value": "111"
                                            },
                                            {
                                                "*":     "basic",
                                                "type":  "CHARACTER",
                                                "value": "32"
                                            },
                                            {
                                                "*":     "basic",
                                                "type":  "CHARACTER",
                                                "value": "119"
                                            },
                                            {
                                                "*":     "basic",
                                                "type":  "CHARACTER",
                                                "value": "111"
                                            },
                                            {
                                                "*":     "basic",
                                                "type":  "CHARACTER",
                                                "value": "114"
                                            },
                                            {
                                                "*":     "basic",
                                                "type":  "CHARACTER",
                                                "value": "108"
                                            },
                                            {
                                                "*":     "basic",
                                                "type":  "CHARACTER",
                                                "value": "100"
                                            }
                                        ]
                                    },
                                    "count":                   {
                                        "*":     "basic",
                                        "type":  "INTEGER_32",
                                        "value": "11"
                                    }
                                }
                            }
                        ]
                    }

                    ]" # storage_pickle).out
      end

end
