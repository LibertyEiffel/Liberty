class TEST_JSON_04

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make is
      local
         str: STRING
         strout: STRING_OUTPUT_STREAM
         repo: JSON_STREAM_REPOSITORY[STRING]
      do
         str := ""
         create strout.connect_to(str)
         create repo.connect_to(Void, strout)

         repo.put("foobar", "test")
         repo.put("hello world", "greatings")

         --| TODO
         --| ~~~~
         --|  * refs seulement au niveau 0 (repository)
         --|  * references par identifiant indépendant du pointeur (car intestable) : INTEGER, 0 = Void
         --|  * data du NATIVE_ARRAY = tableau

         assert(repo.is_commitable)
         repo.commit
         assert(str.is_equal(once "[
                                   {
                                       "type":    "repository",
                                       "version": "1",
                                       "data":    {
                                           "test":      1,
                                           "greatings": 2
                                       },
                                       "refs":    [
                                           {
                                               "layout": "STRING",
                                               "data":   {
                                                   "storage_signature_count": {
                                                       "basic": "INTEGER_32",
                                                       "value": "0"
                                                   },
                                                   "has_storage_signature":   {
                                                       "basic": "BOOLEAN",
                                                       "value": "False"
                                                   },
                                                   "generation":              {
                                                       "basic": "INTEGER_32",
                                                       "value": "0"
                                                   },
                                                   "storage_lower":           {
                                                       "basic": "INTEGER_32",
                                                       "value": "0"
                                                   },
                                                   "capacity":                {
                                                       "basic": "INTEGER_32",
                                                       "value": "7"
                                                   },
                                                   "storage":                 {
                                                       "array":    "CHARACTER",
                                                       "capacity": "7",
                                                       "data":     [
                                                           {
                                                               "basic": "CHARACTER",
                                                               "value": "102"
                                                           },
                                                           {
                                                               "basic": "CHARACTER",
                                                               "value": "111"
                                                           },
                                                           {
                                                               "basic": "CHARACTER",
                                                               "value": "111"
                                                           },
                                                           {
                                                               "basic": "CHARACTER",
                                                               "value": "98"
                                                           },
                                                           {
                                                               "basic": "CHARACTER",
                                                               "value": "97"
                                                           },
                                                           {
                                                               "basic": "CHARACTER",
                                                               "value": "114"
                                                           },
                                                           {
                                                               "basic": "CHARACTER",
                                                               "value": "0"
                                                           }
                                                       ]
                                                   },
                                                   "count":                   {
                                                       "basic": "INTEGER_32",
                                                       "value": "6"
                                                   }
                                               }
                                           },
                                           {
                                               "layout": "STRING",
                                               "data":   {
                                                   "storage_signature_count": {
                                                       "basic": "INTEGER_32",
                                                       "value": "0"
                                                   },
                                                   "has_storage_signature":   {
                                                       "basic": "BOOLEAN",
                                                       "value": "False"
                                                   },
                                                   "generation":              {
                                                       "basic": "INTEGER_32",
                                                       "value": "0"
                                                   },
                                                   "storage_lower":           {
                                                       "basic": "INTEGER_32",
                                                       "value": "0"
                                                   },
                                                   "capacity":                {
                                                       "basic": "INTEGER_32",
                                                       "value": "12"
                                                   },
                                                   "storage":                 {
                                                       "array":    "CHARACTER",
                                                       "capacity": "12",
                                                       "data":     [
                                                           {
                                                               "basic": "CHARACTER",
                                                               "value": "104"
                                                           },
                                                           {
                                                               "basic": "CHARACTER",
                                                               "value": "101"
                                                           },
                                                           {
                                                               "basic": "CHARACTER",
                                                               "value": "108"
                                                           },
                                                           {
                                                               "basic": "CHARACTER",
                                                               "value": "108"
                                                           },
                                                           {
                                                               "basic": "CHARACTER",
                                                               "value": "111"
                                                           },
                                                           {
                                                               "basic": "CHARACTER",
                                                               "value": "32"
                                                           },
                                                           {
                                                               "basic": "CHARACTER",
                                                               "value": "119"
                                                           },
                                                           {
                                                               "basic": "CHARACTER",
                                                               "value": "111"
                                                           },
                                                           {
                                                               "basic": "CHARACTER",
                                                               "value": "114"
                                                           },
                                                           {
                                                               "basic": "CHARACTER",
                                                               "value": "108"
                                                           },
                                                           {
                                                               "basic": "CHARACTER",
                                                               "value": "100"
                                                           },
                                                           {
                                                               "basic": "CHARACTER",
                                                               "value": "0"
                                                           }
                                                       ]
                                                   },
                                                   "count":                   {
                                                       "basic": "INTEGER_32",
                                                       "value": "11"
                                                   }
                                               }
                                           }
                                       ]
                                   }

                                   ]"))
      end

end
