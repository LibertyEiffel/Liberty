class TEST_JSON_04

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   pickle: STRING is
      once
         Result := "[
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
                                "data": {
                                    "storage_signature_count": {
                                        "*":     "basic",
                                        "type":  "INTEGER_32",
                                        "value": "0"
                                    },
                                    "has_storage_signature":   {
                                        "*":     "basic",
                                        "type":  "BOOLEAN",
                                        "value": "False"
                                    },
                                    "generation":              {
                                        "*":     "basic",
                                        "type":  "INTEGER_32",
                                        "value": "0"
                                    },
                                    "storage_lower":           {
                                        "*":     "basic",
                                        "type":  "INTEGER_32",
                                        "value": "0"
                                    },
                                    "capacity":                {
                                        "*":     "basic",
                                        "type":  "INTEGER_32",
                                        "value": "7"
                                    },
                                    "storage":                 {
                                        "*":        "array",
                                        "type":     "CHARACTER",
                                        "capacity": 7,
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
                                            },
                                            {
                                                "*":     "basic",
                                                "type":  "CHARACTER",
                                                "value": "0"
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
                                "data": {
                                    "storage_signature_count": {
                                        "*":     "basic",
                                        "type":  "INTEGER_32",
                                        "value": "0"
                                    },
                                    "has_storage_signature":   {
                                        "*":     "basic",
                                        "type":  "BOOLEAN",
                                        "value": "False"
                                    },
                                    "generation":              {
                                        "*":     "basic",
                                        "type":  "INTEGER_32",
                                        "value": "0"
                                    },
                                    "storage_lower":           {
                                        "*":     "basic",
                                        "type":  "INTEGER_32",
                                        "value": "0"
                                    },
                                    "capacity":                {
                                        "*":     "basic",
                                        "type":  "INTEGER_32",
                                        "value": "12"
                                    },
                                    "storage":                 {
                                        "*":        "array",
                                        "type":     "CHARACTER",
                                        "capacity": 12,
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
                                            },
                                            {
                                                "*":     "basic",
                                                "type":  "CHARACTER",
                                                "value": "0"
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

                    ]"
      end

   make is
      do
         test_commit
         test_update
      end

   test_commit is
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

   test_update is
      local
         strin: STRING_INPUT_STREAM
         repo: JSON_STREAM_REPOSITORY[STRING]
      do
         create strin.from_string(pickle)
         create repo.connect_to(strin, Void)
         repo.update

         assert(repo.count = 2)

         assert(repo.has("test"))
         assert(repo.at("test").is_equal("foobar"))
         assert(repo.has("greetings"))
         assert(repo.at("greetings").is_equal("hello world"))

         assert(repo.key(1).is_equal("test"))
         assert(repo.item(1).is_equal("foobar"))
         assert(repo.key(2).is_equal("greetings"))
         assert(repo.item(2).is_equal("hello world"))
      end

end
