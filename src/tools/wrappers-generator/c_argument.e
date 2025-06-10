class C_ARGUMENT
   -- An "Argument" node of an XML file made by castxml.

inherit
   C_FUNCTION_ARGUMENT
   NAMED_NODE
   TYPED_NODE

insert
   NAME_CONVERTER

create {CASTXML_TREE}
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
         -- Previously it was "Result := types.at(dequalify(type)).has_wrapper"
         -- but that's too brittle. Those queries cannot akswer attached types as
         -- sometimes the right answer may be void.
         if type = Void then
            log.warning.put_line("#(1) has no type" # Current.tagged_out)
            Result := False
         else
            dequalified := dequalify(type)
            if dequalified /= Void then
                actual_type := types.reference_at(dequalified)
                if actual_type/=Void then
                    Result := actual_type.has_wrapper
                else
                   Result:=False
                   -- It already should be false, so we just could write check Result=False end
                end
            else
               Result:=False
               -- It already should be false, so we just could write check Result=False end
            end
         end
         -- rescue
      --    log.warning.put_line("has_wrapper failed. Known types:%N")
      --    types.for_each_item(agent (a_type: C_TYPE)
      --       do
      --          io.put_string(a_type.out)
      --       end(?))

      --    print_run_time_stack
      --    die_with_code(5)
      end

   wrapper_type: STRING
      do
         Result := types.at(dequalify(type)).wrapper_type
      end

   placeholder: STRING
         -- The placeholder name of Current, suitable for Liberty; a newly created string.
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
         -- Manually cache the results of `placeholder' and `wrapper_type' queries
         a_placeholder := placeholder
         a_wrapper_type := wrapper_type
         a_buffer.append(once "#(1): #(2)" # a_placeholder # a_wrapper_type)
      end
end -- class C_ARGUMENT

-- Copyright (C) 2008-2025: Paolo Redaelli
-- wrappers-generator  is free software: you can redistribute it and/or modify it
-- under the terms of the GNU General Public License as publhed by the Free
-- Software Foundation, either version 2 of the License, or (at your option)
-- any later version.
-- wrappers-generator is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-- or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-- more details.
-- You should have received a copy of the GNU General Public License along with
-- th program.  If not, see <http://www.gnu.org/licenses/>.
