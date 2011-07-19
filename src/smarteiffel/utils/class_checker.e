-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class CLASS_CHECKER
	--
	-- Common parent of SHORT and CLASS_CHECK
	--

inherit
	COMMAND_LINE_TOOLS

feature {}
	parent_list: FAST_ARRAY[TYPE] is
			-- All paths from the type to `short' to the ANY type excluded (when the class to `short' is ANY, ANY is the first
			-- element). Actually, this `parent_list' is used to select the order of features output of command `short'.
			-- Indeed, we have to use the order of the original text source as a guide. As an example, if you short ARRAY, the
			-- order given in COLLECTION is used first. Finally, the ANY type is not included in `parent_list' to avoid printing
			-- of well knowns features.
		once
			create Result.with_capacity(4)
		end

	type: TYPE
			-- The corresponding one of the class to class_check.

	client: CLASS_NAME
			-- The client for whom the class is class_check'ed (-client flag).
			-- If no client is provided on the command line, the default is ANY.
			-- To see all features (i.e. the old NONE behavior), `client' is Void.

	format: STRING
			-- The selected format directory to find hooks files.

	obsolete_mark: MANIFEST_STRING
			-- Non Void when the class to short is itself obsolete.

	output: OUTPUT_STREAM

	root_class_names: FAST_ARRAY[HASHED_STRING] is
		once
			create Result.with_capacity(1)
		end

	short: BOOLEAN

	start is
			-- Should be called by the make procedure of `short' or `class_check'.
		require
			output /= Void
		local
			bc: CLASS_TEXT; cn: CLASS_NAME; i: INTEGER
		do
			smart_eiffel.set_short_or_class_check_flag
			parse_arguments

			-- Force client class lookup:
			smart_eiffel.initialize_any_tuple
			if client /= Void then
				bc := smart_eiffel.class_text(client, True)
			end

			-- Set the output stream:
			short_printer.set_out_stream(output)
			from
				i := root_class_names.lower
			until
				i > root_class_names.upper
			loop
				create cn.unknown_position(root_class_names.item(i))
				bc := smart_eiffel.class_text(cn, True)
				obsolete_mark := bc.obsolete_mark
				class_check(bc)
				i := i + 1
			end
		end

	parse_arguments is
		deferred
		ensure
			format /= Void
			not root_class_names.is_empty
		end

	class_check (class_text: CLASS_TEXT) is
			-- Actually check the class `class_text'.
		require
			class_text /= Void
		local
			ccl: CREATION_CLAUSE_LIST; tuple_flag, obsolete_flag: BOOLEAN; comment: COMMENT
			obsolete_text: STRING
		do
			parent_list.clear_count
			if class_text.name.is_tuple_related then
				tuple_flag := True
				smart_eiffel.tuple_related_classes_in(parent_list)
			else
				parent_list.add_last(class_text.declaration_type_of_like_current)
				if not short then
					parent_list.first.up_to_any_in(parent_list)
				end
			end
			-- Prepare data:
			ace.set_command_line_debug
			if tuple_flag then
				short_printer.short_for_tuple(format, parent_list)
			else
				type := class_text.declaration_type_of_like_current
				-- Print the class interface:
				short_printer.start(format, class_text, type)
				if obsolete_mark /= Void then
					obsolete_flag := True
		         obsolete_mark.set_once_flag(False)
		         obsolete_text := "%NWARNING THIS CLASS IS OBSOLETE!%N%N"
		         obsolete_text.append(obsolete_mark.to_string)
		         obsolete_text.add_last('%N')
	            create comment.from_string(class_text, obsolete_text)
		         comment.short(once "hook311", once "      --", once "hook312", once "%N")
		         short_printer.put_character('%N')
				else
					ccl := class_text.creation_clause_list
					if ccl = Void or else not ccl.short(client) then
						short_printer.hook(once "hook102")
					end
					prepare_or_collect_features_for(client)
					if short_printer.sort_flag then
						if not short_printer.is_empty then
							short_printer.hook_or(once "hook200", once "feature(s)%N")
						end
						short_printer.do_sorted_print
					else
						-- Nothing to do because features are actually already printed
						-- using the order of feature clauses in various source files.
					end
					short_printer.hook(once "hook201")
				end
				short_printer.finish(obsolete_flag)
			end
		end

	set_format (a_format: like format) is
		do
			format := a_format
		end

	set_client (a_client_or_void: HASHED_STRING) is
			-- A Void argument indicates that all features are visibles.
		do
			if a_client_or_void = Void then
				client := Void
			else
				create client.unknown_position(a_client_or_void)
			end
			short_printer.set_client(client)
		end

	prepare_or_collect_features_for (cn: CLASS_NAME) is
		local
			i: INTEGER; ct: CLASS_TEXT; fcl: FEATURE_CLAUSE_LIST; parent: TYPE
		do
			from
				i := parent_list.upper
			until
				i < 0
			loop
				parent := parent_list.item(i)
				ct := parent.class_text
				fcl := ct.feature_clause_list
				if fcl /= Void then
					fcl.for_short(ct.name, parent, type, cn)
				end
				i := i - 1
			end
		end

	fatal_bad_usage is
		do
			system_tools.bad_use_exit(command_name, command_line_help_summary)
		end

invariant
	out /= Void

end -- class CLASS_CHECKER
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- SmartEiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- SmartEiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with SmartEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2004: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
