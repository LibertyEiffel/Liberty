indexing
	description: "Issuing commands to the provider."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli, GDA team
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hope that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

class GDA_COMMAND
	--The GdaCommand structure holds data needed to issue a command to
	--the providers. Applications usually create a GdaCommand (via
	--gda_command_new), set its properties (via the gda_command_set_*
	--functions) and pass it over to the database using the
	--GdaConnection functions.

	-- One interesting thing about GdaCommand's is that they can be
	-- reused over and over. That is, applications don't need to create
	-- a command every time they want to run something on the connected
	-- database. Moreover, the ability to create command strings with
	-- placeholders allows the use of parameters to specify the values
	-- for those placeholders. Thus, an application can create a
	-- command of the form:
			
	-- INSERT INTO employees VALUES (id, name, address, salary)
	
	-- and reuse the same command over and over, just using different
	-- values for the placeholders.

	-- The value for the placeholders is specified when sending the
	-- GdaCommand to a database connection, which is done via the
	-- gda_connection_execute function.

inherit 
	G_OBJECT 
		rename
			make as allocate_struct
		redefine
			dispose, copy
		end

insert
	GDA_COMMAND_EXTERNALS
	GDA_COMMAND_TYPE_ENUM
	GDA_COMMAND_OPTIONS_ENUM
	GDA_COMMAND_STRUCT

creation dummy,
	make, copy, from_external_pointer

feature {} -- Creation

	make (a_text: STRING; a_type,some_options: INTEGER) is
			-- Creates a new GdaCommand from the parameters that should
			-- be freed by calling gda_command_free.
		
			-- If there are conflicting options, this will set options to
			-- GDA_COMMAND_OPTION_DEFAULT.

			-- text : 	the text of the command.
			-- type : 	a GdaCommandType value.
			-- options : 	a GdaCommandOptions value.
			-- Returns : 	a newly allocated GdaCommand.
		do
			from_external_pointer (gda_command_new(a_text.to_external, a_type, some_options))
		end

feature {ANY} -- Copying
	copy (other: like Current) is
			-- Creates a new GdaCommand from an existing one.
		do
			from_external_pointer (gda_command_copy (other.handle))
		end

feature -- Disposing
	dispose is 
			-- Frees the resources allocated by gda_command_new.
		do
			gda_command_free (handle)
		end

feature -- Command text
	text: STRING is
			-- the command text.
		do
			create {CONST_STRING} Result.from_external (gda_command_get_text(handle))
		ensure not_void: Result /= Void
		end

	set_text (a_text: STRING) is 
			-- Sets the command text to `a_text'.
		do
			gda_command_set_text (handle, a_text.to_external)
		ensure set: a_text.is_equal (text)
		end

feature -- Command type
	command_type: INTEGER is
			-- the command type.
		do 
			Result := gda_command_get_command_type (handle)
		ensure valid: is_valid_command_type (Result)
		end

	set_command_type (a_type: INTEGER) is
			-- Sets the command type of cmd.
		require valid_type: is_valid_command_type (a_type)
		do
			gda_command_set_command_type (handle, a_type)
		end

feature -- Options
	options: INTEGER is
			-- the command options.
		do
			Result :=  gda_command_get_options (handle)
		ensure valid: are_valid_options (Result)
		end

	set_options (some_options: INTEGER) is
			-- Sets the command options. If there conflicting options, it
			-- will just leave the value as before.
		require valid_options: are_valid_options (some_options)
		do
			gda_command_set_options (handle, some_options)
		end

feature -- Transaction
	transaction: GDA_TRANSACTION is
			-- the GDA_TRANSACTION associated with the given GdaCommand.
		local r: G_OBJECT_EXPANDED_FACTORY[GDA_TRANSACTION]; ptr: POINTER
		do
			ptr := gda_command_get_transaction (handle)
			Result := r.eiffel_wrapper_from_gobject_pointer(ptr)
			if Result=Void then 
				debug
					print ("Warning! GDA_COMMAND.transaction got an unwrapped GdaTransaction object. Wrapping it%N")
				end
				create Result.from_external_pointer (ptr)
			end
		end

	set_transaction (a_transaction: GDA_TRANSACTION) is
			-- Sets the GDA_TRANSACTION associated with Current GDA_COMMAND.
		require transaction_not_void: a_transaction /= Void
		do
			gda_command_set_transaction (handle, a_transaction.handle)
		end
end -- class GDA_COMMAND
