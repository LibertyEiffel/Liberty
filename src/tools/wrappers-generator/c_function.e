class C_FUNCTION
   -- A "Function" node of an XML file made by gccxml.

inherit
   CONTEXTED_NODE
   IDENTIFIED_NODE
   MOVABLE_NODE
      -- hence a NAMED_NODE and a FILED_NODE
      redefine compute_eiffel_name
      end
   STORABLE_NODE
   WRAPPER_FEATURE
      redefine compute_eiffel_name
      end

create {GCCXML_TREE}
   make

feature {ANY}
   store
      do
		log("Storing function '#(1)', line #(2)%N" # c_string_name # line_row.to_utf8 )
		if is_anonymous then
			log("Skipping anonymous funtion at line #(2)%N" # line_row.as_utf8)
		else
			check 
				c_string_name /= Void 
			end
			symbols.put(Current, c_string_name)
			functions.add_first(Current)
		end
      end

   returns: UNICODE_STRING
      do
         Result := attribute_at(once U"returns")
      end

   return_type: C_TYPE
      do
         Result := types.reference_at(returns)
      end

   compute_eiffel_name
      do
         cached_eiffel_name := eiffel_feature(c_string_name)
      end

   has_arguments: BOOLEAN
         -- Does Current function have arguments?
      do
		  inspect children_count
		  when 0 then Result := False
		  when 1 then Result := not argument(1).is_ellipsis
		  else Result := True
		  end

      end

   is_variadic: BOOLEAN
         -- Does current function accept a variable number of arguments?
      do
         if children_count > 0 then
            Result := argument(children_count).is_ellipsis
         else
            Result := False
         end
      end

   is_wrappable: BOOLEAN
         -- Are all arguments wrappable and its return type either void or
         -- wrappable? The variadic part of the function, the ellipsis ("...")
         -- is ignored.
      local
         i: INTEGER_32; a_return_type: C_TYPE
      do
         a_return_type := return_type
         Result := a_return_type/=Void and then (a_return_type.is_void or a_return_type.has_wrapper) -- return_type.referree.has_wrapper
         if Result then
            -- Check for
            from
               i := children_count
            until
               not Result or i < 1
            loop
               Result := argument(i).has_wrapper or else argument(i).is_ellipsis
               i := i - 1
            end
         end
      end

   is_to_be_emitted: BOOLEAN
      do
          Result := not avoided_symbols.has(c_string_name)
      end

   wrap_on (a_stream: OUTPUT_STREAM)
      do
         if not is_wrappable then
			log("Function `#(1)' is  not wrappable%N" #  c_string_name)
            buffer.reset
            buffer.append(once "       -- unwrappable function #(1) in file `#(2)'%N" #
					c_string_name # c_file.c_string_name)
            -- TODO: provide the reason; using developer_exception_name
            -- triggers some recursion bug AFAIK. Paolo 2009-10-02
         elseif not is_public then
            log(once "Skipping 'hidden' function `#(1)'%N" # c_string_name)
            buffer.append(once "%T-- `hidden' function #(1) skipped.%N" # c_string_name)
         elseif not namespace.is_main then
            log(once "Skipping function `#(1)' belonging to namespace #(2) which is not wrapped%N" #
				c_string_name # namespace.c_string_name)
            buffer.append(once "%T-- function #(1) in unwrapped namespace #(2) skipped.%N" #
				c_string_name # namespace.c_string_name)
         elseif avoided_symbols.has(c_string_name) then
             log(once "Function `#(1)' is among the avoided symbols: not wrapping as requested.%N" # c_string_name)
            buffer.append(once "%T-- function #(1) skipped as requested.%N" # c_string_name)
         else
            log(once "Function #(1)" # c_string_name)
            buffer.append(once "%T#(1)" # eiffel_name)
			append_arguments
            append_return_type
            append_description
            append_body
            log(once "%N")
         end
         buffer.print_on(a_stream)
      end

   append_description
         -- Put a description on 'buffer' formatting it as an Eiffel comment
         -- with lines shorter that 'description_lenght' characters.
         -- local description: COLLECTION[STRING];  word: STRING; iter: ITERATOR[STRING];  length,new_length: INTEGER
      do
         -- TODO: complete C_FUNCTION.append_description
         buffer.append(once "%N%T%T-- function #(1) (in `#(2)')%N" #
					c_string_name # c_file.c_string_name)
         -- description := feature_description(class_name, name)
         -- if description/=Void then
         --      from
         --              iter:=a_description.get_new_iterator; iter.start;
         --              buffer.append(once "%N%T%T-- "); length:=0
         --      until iter.is_off loop
         --              word := iter.item
         --              new_length := length + word.count
         --              if new_length>description_lenght then
         --                      buffer.append(once "%N%T%T-- ")
         --                      length := 0
         --              else
         --                      buffer.put(' ')
         --                      length := new_length + 1
         --              end
         --              buffer.append(word)
         --              iter.next
         --      end
         -- end
      end

   append_arguments
         -- Append the arguments of function referred by `a_node' into
         -- `buffer'.
         -- C requires at least one argument before the eventual ellips;
         -- C++ allows ellips to be the only argument. (source
         -- http://publib.boulder.ibm.com/infocenter/iadthelp/v7r0/index.jsp?topic=/com.ibm.etools.eries.langref.doc/as400clr155.htm)
		 -- This command also deals with argument-less functions like "fork". For example an
         -- argument-less function returning an integer shall be marked with
         -- "()", the empty argument lt, otherwe the C compiler will
         -- interpret it as the address of the call casted to an integer.
      local
         i, last: INTEGER
         an_arg: C_FUNCTION_ARGUMENT
      do
		  if has_arguments then
			  log(once " (")
			  buffer.append(once " (")
			  -- Omit the eventual ellips
			  if is_variadic then
				  -- Skip the last argument
				  last := children_count - 1
			  else
				  last := children_count
			  end
			  log(once "#(1) args: " # &children_count)
			  from
				  i := 1
			  until
				  i > last - 1
			  loop
                  an_arg := argument(i)
                  an_arg.set_pos(i)
				  an_arg.put_on(buffer) -- argument(i).put_on(buffer)
				  buffer.append(once "; ")
				  i := i + 1
			  end

              an_arg := argument(last)
              an_arg.set_pos(last)
			  an_arg.put_on(buffer)
			  log(once ")")
			  buffer.append(once ")")
		  end
	  end

	  append_return_type
		 -- Append the Eiffel equivalent type of the return type of
         -- Current node to `buffer' and the "is" keyword, i.e. ": INTEGER_32 is " or ":
         -- POINTER is". When result of `a_node' is "void" only " is" is appended.
      do
         if return_type.is_void then
            -- don't print anything; the correct "return type" of a C
            -- function returning void (i.e. a command) is an empty string.
         else
            buffer.append(once ": ")
            buffer.append(return_type.wrapper_type)
         end
         buffer.append(once " %N")
      rescue
         log(once "Unwrappable return type: #(1)... " # developer_exception_name)
      end

   append_body
         -- Append the body of function to `buffer'
      local
         description: ABSTRACT_STRING
         feature_name: ABSTRACT_STRING
      do
         if is_variadic then
            description := c_string_name & variadic_function_note
         else
            description := c_string_name
         end
         if has_arguments then 
            feature_name := c_string_name
         else
            -- Handle the case of parameterless C functions like fork or getpid
            feature_name := c_string_name|"()"
         end
         buffer.append(once "%
                        %               -- #(1)%N%
                        %               external %"plug_in%"%N%
                        %               alias %"{%N%
                        %                       location: %".%"%N%
                        %                       module_name: %"plugin%"%N%
                        %                       feature_name: %"#(2)%"%N%
                        %               }%"%N%
                        %               end%N%N" #
                        description # feature_name)
         -- For debugging purpose the line where the node occurred were once printed in the comment, like th:
         -- buffer.append(once "%
         -- %            -- #(1) (node at line #(3))%N%
         -- %            external %"plug_in%"%N%
         -- %            alias %"{%N%
         -- %                    location: %".%"%N%
         -- %                    module_name: %"plugin%"%N%
         -- %                    feature_name: %"#(2)%"%N%
         -- %            }%"%N%
         -- %            end%N%N" #
         -- description # actual_c_symbol # line.out)
         -- th feature has been removed to make the generated classes a little more stable, avoiding unnecessary changes.
      end

feature {} -- Implementation
   argument (an_index: INTEGER): C_FUNCTION_ARGUMENT
         -- The argument at `an_index'.
      do
         Result ?= child(an_index)
      ensure
         no_child_with_wrong_type: Result /= Void
      end -- invariant name.is_equal(once U"Function")

end -- class C_FUNCTION
-- Copyright (C) 2008-2018: Paolo Redaelli
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
