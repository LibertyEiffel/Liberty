class C_ARGUMENT
   -- An "Argument" node of an XML file made by gccxml.

inherit
   C_FUNCTION_ARGUMENT
   NAMED_NODE
   TYPED_NODE
 
insert
   NAME_CONVERTER

create {GCCXML_TREE}
   make

feature {ANY}
   is_ellipsis: BOOLEAN False

   is_fundamental: BOOLEAN
      do
         Result := types.at(dequalify(type)).is_fundamental
      end

   is_void: BOOLEAN
      do
         Result := types.at(dequalify(type)).is_void
      end

   has_wrapper: BOOLEAN
      local dequalified: UNICODE_STRING; actual_type: C_TYPE
      do
         -- Previously it was "Result := types.at(dequalify(type)).has_wrapper" but that's too brittle
         check type/=Void end -- unnecessary when we will have attached types
         dequalified := dequalify(type)
         if dequalified /= Void then
             actual_type := types.reference_at(dequalified)
             if actual_type/=Void then
                 Result := actual_type.has_wrapper
             else
                 check 
                     Result=False
                 end
             end
         else
             check
                 Result=False
             end
         end
      rescue
         log("has_wrapper failed. Known types:%N")
         types.for_each_item(agent (a_type: C_TYPE)
            do
               io.put_string(a_type.out)
            end(?))

         print_run_time_stack
         die_with_code(5)
      end

   wrapper_type: STRING
      do
         Result := types.at(dequalify(type)).wrapper_type
      end

   placeholder: STRING
         -- The placeholder name of Current, suitable for Liberty as a newly created string.
      do
         if c_name = Void then
            -- Nameless prototype: 
            if pos /= 0 then
                -- the position of Current argment has been set by its
                -- function. We trust it to be unique in the function and use
                -- it to give a name to this nameless argument
                Result := "argument_"
                pos.append_in(Result)
            else
                -- no position set. Using providing sound default, using
                -- line and column, which are locally unique. 
                Result := "an_argument_l"
                line.append_in(Result)
                Result.append(once "_c")
                column.append_in(Result)
            end
         else
            Result := eiffel_argument(c_name.to_utf8)
         end
      ensure
         Result /= Void
         not Result.is_empty
      end

   put_on (a_buffer: FORMATTER)
      require else
         has_wrapper
      local
         a_placeholder, a_wrapper_type: STRING
      do
         -- Cache results of `placeholder' and `wrapper_type' queries
         a_placeholder := placeholder
         a_wrapper_type := wrapper_type
         log(once "#(1): #(2) " # a_placeholder # a_wrapper_type)

         a_buffer.append(once "#(1): #(2)" # a_placeholder # a_wrapper_type)
      end
end -- class C_ARGUMENT
