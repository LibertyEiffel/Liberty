note
   description:
      "A tuple from an SQLite query."
   copyright:
      "(C) 2006,2016 Paolo Redaelli "
   license:
      "LGPL v2 or later"
   date:
      "$Date:$"
   revision:
      "$Revision:$"

class SQLITE_RESULT_ROW

inherit
   RESULT_ROW
      undefine default_create, fill_tagged_out_memory, out_in_tagged_out_memory
      end
   TRAVERSABLE[VARIANT]
      undefine copy, is_equal
      end

insert
   SQLITE3_EXTERNALS
      undefine default_create, fill_tagged_out_memory, out_in_tagged_out_memory
      end
   SQLITE_ERROR_CODES
      undefine default_create, copy, is_equal, fill_tagged_out_memory, out_in_tagged_out_memory
      end
   EXCEPTIONS
      undefine default_create, copy, is_equal, fill_tagged_out_memory, out_in_tagged_out_memory
      end

create {ANY}
   make

feature {ANY} -- Accessing
   

   is_empty: BOOLEAN
      do
      end -- is_empty

   lower: INTEGER 0;

   last: VARIANT
      do
      end -- last

   first: VARIANT
      do
      end -- first

   upper: INTEGER
      do
      end -- upper

   item (an_index: INTEGER;): VARIANT
      do
      end -- item

   new_iterator: ITERATOR[VARIANT]
      do
         create {SQLITE_RESULT_ROW_ITERATOR} Result.from_row(Current)
      end -- new_iterator

   count: INTEGER;

end -- class SQLITE_RESULT_ROW
