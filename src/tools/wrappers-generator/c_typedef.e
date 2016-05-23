class C_TYPEDEF

inherit
   C_TYPE
   IDENTIFIED_NODE
   MOVABLE_NODE
      -- Hence a NAMED_NODE and FILED_NODE
      -- using the definition made in WRAPPER_CLASS
      undefine compute_eiffel_name
      end
   TYPED_NODE
   CONTEXTED_NODE
   STORABLE_NODE
   WRAPPER_CLASS

create {GCCXML_TREE}
   make

feature {ANY}
   store
      do
         -- if not standard_typedefs.has(c_string_name) then
         -- Current typedef is not a standard one and requires a query for anchored declarations.
         typedefs.add_first(Current)
         -- end
         types.fast_put(Current, id)
         check
            is_named
         end
         symbols.put(Current, c_string_name)
      end

   standard_typedefs: SET[STRING]
         -- The standard typedefs defined by the C language.
      once
         Result := {HASHED_SET[STRING] << "long int", "int8_t", "uint8_t", "int16_t", "uint16_t", "int32_t", "uint32_t", "int64_t", "uint64_t", "intptr_t", "uintptr_t", "int_least8_t", "uint_least8_t", "int_least16_t", "uint_least16_t", "int_least32_t", "uint_least32_t", "int_least64_t", "uint_least64_t", "int_fast8_t", "uint_fast8_t", "int_fast16_t", "uint_fast16_t", "int_fast32_t", "uint_fast32_t", "int_fast64_t", "uint_fast64_t", "intmax_t", "uintmax_t", "size_t", "ssize_t", "ptrdiff_t" >> }
      end

   wrapper_type: STRING
      do
         if not settings.are_standard_typedefs_emitted and then standard_typedefs.has(c_string_name) then
            Result := once "like " + c_string_name
         else
            if referree.has_wrapper then
               Result := referree.wrapper_type
            else
				log("C typedef #(1) at line #(2) is not wrappable" # c_string_name # &line)
            end
         end
      end

   is_fundamental: BOOLEAN
      local
         a_type: C_TYPE
      do
         a_type := types.at(type)
         if a_type /= Void then
            Result := a_type.is_fundamental
         else
            raise("unknown type")
         end
      end

   is_void: BOOLEAN False

   has_wrapper: BOOLEAN
      do
         Result := types.at(type).has_wrapper
      end

   is_to_be_emitted: BOOLEAN
      do
         Result := is_public and then (global or else headers.has(c_file.c_string_name))
      end

   wrap_on (a_stream: OUTPUT_STREAM)
         -- If Current ultimately refers to a fundamental type then put an empty query on `a_stream', otherwise nothing is done.
      local
         query_name: STRING
      do
         if is_to_be_emitted then
            if is_fundamental then
               if has_wrapper then
                  query_name := eiffel_feature(c_string_name)
                  log(once "Anchored query #(2) for typedef #(1)%N" # c_string_name # query_name)

				  buffer.append(once "       #(1): #(2)%N%
							  %               -- typedef #(3) from #(4)%N%
							  %               -- Empty by design, used for anchored declarations.%N%
							  %       do%N%
							  %       ensure Result.is_default%N%
							  %       end%N%
							  %%N" # query_name # wrapper_type # c_string_name 
                              # c_file.c_string_name )
			  else
				  buffer.append(once "%T-- #(1) unwrappable: no wrapper type.%N" # c_string_name)
                  -- TODO: add the case of typedef to void
               end
               buffer.print_on(a_stream)
            else
               -- It refers to something else; let's assign it a name
               referree.set_name(eiffel_feature(c_string_name))
            end
         end
      end -- invariant name.is_equal(once U"Typedef")

feature {ANY}
    emit_wrapper
    local a_composed_type: COMPOSED_NODE
    do
        if a_composed_type ?:= referree then
            log("Emitting wrapper for typedef #(1)%N" # c_string_name)
            a_composed_type ::= referree 
            if a_composed_type /=Void then
                if not a_composed_type.is_named then
                    log("Referred #(1) is anonymous, forcingly setting its name to #(2)%N" # 
                    a_composed_type.c_type # c_string_name)
                    a_composed_type.set_name(c_string_name)
                end
                a_composed_type.emit_wrapper  
            else
                log(" typedef #(1) has no referree node%N" # c_string_name)
            end
        else
            log("No wrapper for typedef #(1)%N" # c_string_name)
        end
        emitted := True
    end

   suffix: STRING ""

end -- class C_TYPEDEF
-- Copyright (C) 2008-2016:  Paolo Redaelli
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
