class GCCXML_TREE
   -- A partially validated representation of an XML file made by gccxml
   -- Effective heirs will emit wrappers using the plugin machanm.

inherit
   XML_TREE
      redefine make, new_node, open_node
      end

insert
   DESCRIPTIONS
   SHARED_COLLECTIONS
   SHARED_SETTINGS
   EXCEPTIONS
   FILE_TOOLS

create {ANY}
   make

feature {ANY}
   make (url: URL)
      do
         create moved.make
         Precursor(url)
      end

   new_node (node_name: UNICODE_STRING; line, column: INTEGER): XML_COMPOSITE_NODE
      do
         inspect
            node_name.as_utf8
         when "Argument" then
            create {C_ARGUMENT} Result.make(node_name, line, column)
         when "ArrayType" then
            create {C_ARRAY_TYPE} Result.make(node_name, line, column)
         when "Base" then
            create {CPP_BASE_NODE} Result.make(node_name, line, column)
         when "Class" then
            create {CPP_CLASS} Result.make(node_name, line, column)
         when "Constructor" then
            create {C_CONSTRUCTOR} Result.make(node_name, line, column)
         when "Converter" then
            create {CONVERTER_NODE} Result.make(node_name, line, column)
         when "CvQualifiedType" then
            create {C_QUALIFIED_TYPE} Result.make(node_name, line, column)
         when "Destructor" then
            create {DESTRUCTOR_NODE} Result.make(node_name, line, column)
         when "Ellipsis" then
            create {C_ELLIPSIS} Result.make(node_name, line, column)
         when "Enumeration" then
            create {C_ENUM} Result.make(node_name, line, column)
         when "EnumValue" then
            create {C_ENUM_VALUE} Result.make(node_name, line, column)
         when "Field" then
            create {C_FIELD} Result.make(node_name, line, column)
         when "File" then
            create {C_FILE} Result.make(node_name, line, column)
         when "Function" then
            create {C_FUNCTION} Result.make(node_name, line, column)
         when "FunctionType" then
            create {C_FUNCTION_TYPE} Result.make(node_name, line, column)
         when "FundamentalType" then
            create {C_FUNDAMENTAL_TYPE} Result.make(node_name, line, column)
         when "GCC_XML" then
            create {GCC_XML} Result.make(node_name, line, column)
         when "Method" then
            create {METHOD_NODE} Result.make(node_name, line, column)
         when "MethodType" then
            create {METHOD_TYPE_NODE} Result.make(node_name, line, column)
         when "Namespace" then
            create {C_NAMESPACE} Result.make(node_name, line, column)
         when "NamespaceAlias" then
            create {C_NAMESPACE_ALIAS} Result.make(node_name, line, column)
         when "OffsetType" then
            create {OFFSET_TYPE_NODE} Result.make(node_name, line, column)
         when "OperatorFunction" then
            create {OPERATOR_FUNCTION_NODE} Result.make(node_name, line, column)
         when "OperatorMethod" then
            create {OPERATOR_METHOD_NODE} Result.make(node_name, line, column)
         when "PointerType" then
            create {C_POINTER_TYPE} Result.make(node_name, line, column)
         when "ReferenceType" then
            create {C_REFERENCE_TYPE} Result.make(node_name, line, column)
         when "Struct" then
            create {C_STRUCT_NODE} Result.make(node_name, line, column)
         when "Typedef" then
            create {C_TYPEDEF} Result.make(node_name, line, column)
         when "Union" then
            create {C_UNION} Result.make(node_name, line, column)
         when "Unimplemented" then
            create {UNIMPLEMENTED_NODE} Result.make(node_name, line, column)
         when "Variable" then
            create {C_VARIABLE} Result.make(node_name, line, column)
         else
            raise(node_name.as_utf8 + " does not have an GCCXML_NODE")
            -- create {XML_COMPOSITE_NODE} Result.make(node_name, line, column)
         end
         -- TODO: it would be nice to allow direct inspection of UNICODE_STRING
         -- and other COMPARABLE classes
      end

   open_node (node_name: UNICODE_STRING; line, column: INTEGER)
      local
         storable: STORABLE_NODE
      do
         Precursor(node_name, line, column)
         storable ?= open_nodes.top
         if storable /= Void then
            storable.store
         end
      end

feature {ANY} -- Wrappers emittions
   emit_wrappers
      local
         node: GCCXML_NODE
      do
         log(once "Moving symbols.%N")
         moved.for_each(agent move_symbol(?,?))
         log(once "Making typedefs and assigning names to typedeffed types.%N")
         typedefs.emit_wrappers
         -- Assign each field to the composed node it belongs to
         -- Wrap namespaces as Eiffel clusters which are directories containing classes
         -- Assign each function to the file they belong to.

         functions.for_each(agent move_feature(?))
         -- Assign each variable to the file they belong to.
         variables.for_each(agent move_feature(?))
         namespaces.for_each(agent {C_NAMESPACE}.emit_wrapper)
         check
            node ?:= root
         end
         -- this is not stricly necessary, we check that root is actually a GCCXML_NODE
         node ::= root
         node.emit_wrappers
         -- Note that an eventual assertion like "check node/=Void end" or a
         -- run-time check like "if node/=Void then node.emit_wrappers end"
         -- are not necessary since "node ::= root" actually requires root to be a GCCXML_NODE
      end

   move_feature (a_feature: WRAPPER_FEATURE)
      require
         a_feature /= Void
      local
         destination: ABSTRACT_STRING; file: C_FILE
      do
          if not a_feature.is_anonymous then
             destination := moved.reference_at(a_feature.c_string_name)
             if destination /= Void then
                -- user required move
                file := files_by_name.reference_at(destination)
                log(once "Moving #(1) into #(2) as requested.%N"
                # a_feature.c_string_name # file.c_string_name)
             else
                -- a_feature belong to the file as declared in the gcc-xml file
                file := files.reference_at(a_feature.c_file.id)
                log(once "Moving #(1) from #(2) into #(3).%N" 
                # a_feature.c_string_name # a_feature.c_file.c_string_name # file.c_string_name)
             end
             check
                file /= Void
             end
             file.features.add_last(a_feature)
         end
      end

feature {ANY}
   read_flags_from (a_file_name: STRING)
         -- Read the lt of enumeration that shall be wrapped as flags from the
         -- file named `a_file_name'.
      require
         a_file_name /= Void
         file_exists(a_file_name)
         is_file(a_file_name)
      do
         flag_enums.add_from_file(a_file_name)
      end

   read_avoided_from (a_file_name: STRING)
         -- Read from the file named `a_file_name' the lt of symbols that will
         -- be avoided, i.e. not wrapped.
      require
         a_file_name /= Void
         file_exists(a_file_name)
         is_file(a_file_name)
      do
         avoided_symbols.add_from_file(a_file_name)
      end

   moved: HASHED_DICTIONARY[ABSTRACT_STRING, ABSTRACT_STRING]

   read_moved_from (a_name: STRING)
         -- Read the file with `a_name' and fills `moved' dictionary. For each line the
         -- first word will be used as key, the second as value. The rest of the
         -- line is ignored and may be considered comment.
         -- Used to read the lt of renamed symbols and moved functions.
      require
         a_name /= Void
         file_exists(a_name)
         is_file(a_name)
      local
         file: TEXT_FILE_READ; symbol, value: STRING; words: STRING_INPUT_STREAM
      do
         create file.connect_to(a_name)
         check
            file.is_connected
         end
         from
            file.read_line
         until
            file.end_of_input
         loop
            if file.last_string.has_prefix(once "--") then
               -- skip the comment
            else
               create words.from_string(file.last_string)
               words.read_word
               if not words.last_string.is_empty then
                   -- twin is used because last_string is reused. Otherwise the symbols will change once stored. And this is bad, like crossing rays.
                  symbol := words.last_string.twin
                  words.read_word
                  if not words.last_string.is_empty then
                     value := words.last_string.twin
                     log(once "Symbol #(1) moved to #(2)%N" # symbol # value)
                     moved.put(value, symbol)
                  end
               end
               -- Issueing words.skip_remainder_of_line is useless
            end
            file.read_line
         end
      end

   move_symbol (a_file_name, a_symbol: ABSTRACT_STRING)
         -- Makes `a_symbol' as if it was part of file with `a_file_name'.
      local
         f: C_FILE; symbol: MOVABLE_NODE
      do
         f := files_by_name.reference_at(a_file_name)
         if f = Void then
            log(once "Symbol `#(1)' can't be considered part of file #(2): file not referenced by in input file%N" # a_symbol # a_file_name)
         else
            symbol ?= symbols.reference_at(a_symbol)
            if symbol /= Void then
               log(once "Considering #(1) as declared into file #(2)%N"
			   # a_symbol # a_file_name)
               symbol.set_file(f)
            else
               log(once "Cannot find symbol #(1) (that would be considered part of #(2))%N"
			   # a_symbol # a_file_name)
            end
         end
      end

invariant
   moved /= Void

end -- class GCCXML_TREE
-- Copyright (C) 2008-2017: Paolo Redaelli
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
