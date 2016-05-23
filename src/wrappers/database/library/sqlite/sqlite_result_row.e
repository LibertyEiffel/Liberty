note
	description: "A tuple from an SQLite query."
	copyright: "(C) 2006,2016 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

class SQLITE_RESULT_ROW

inherit
   RESULT_ROW
      undefine default_create, fill_tagged_out_memory, out_in_tagged_out_memory
      redefine out
      end
   FAST_ARRAY[VARIANT]
      undefine copy, is_equal
      redefine out
      end

insert
   SQLITE3_EXTERNALS
      undefine default_create, fill_tagged_out_memory, out_in_tagged_out_memory
      redefine out
      end
   SQLITE_ERROR_CODES
      undefine default_create, copy, is_equal, fill_tagged_out_memory, out_in_tagged_out_memory
      redefine out
      end
   EXCEPTIONS
      undefine default_create, copy, is_equal, fill_tagged_out_memory, out_in_tagged_out_memory
      redefine out
      end

create {ANY}
   make

feature {ANY}
    out: STRING 
    local i: INTEGER
    do
        from i:=lower; Result:=""
        until i<upper
        loop
            Result.append(item(i).out)
            Result.append(once ", ")
            i:=i+1
        end
    end

end -- class SQLITE_RESULT_ROW
