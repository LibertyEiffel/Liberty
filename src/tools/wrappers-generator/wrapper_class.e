deferred class WRAPPER_CLASS
	-- A node of an XML file made by gccxml which is wrappable with a class.
	-- This class will contain the wrapping of this class and wrapped features
	-- of many child and/or related nodes.

inherit WRAPPABLE_NODE
	
feature
	emit_wrapper is
		deferred
		end

	class_name: STRING is
		-- the name of the Eiffel class that wraps Current. CamelCase is converted into CAMEL_CASE, `suffix' is added at the end, eventual trailing underscores are removed.
	do
		if stored_class_name=Void then 
			if assigned_name/=Void then stored_class_name:=assigned_name.twin
			else stored_class_name:=c_string_name.twin
			end
			insert_underscores(stored_class_name)
			stored_class_name.append(suffix)
			stored_class_name.to_upper
			check 
				is_public: stored_class_name.first/='_'
				not class_name.has_substring("__")	
			end
		end
		Result := stored_class_name
	ensure 
		non_void: Result/=Void
		is_valid_class_name(Result)
	end

feature {}
	stored_class_name: STRING

	output: TERMINAL_OUTPUT_STREAM

	suffix: STRING is
		-- The suffix that will be added to class_name, i.e. "_EXTERNALS", "_ENUM", "_STRUCT"
		deferred
		end
end -- class WRAPPER_CLASS
-- Copyright 2008,2009,2010 Paolo Redaelli

-- wrappers-generator  is free software: you can redistribute it and/or modify it
-- under the terms of the GNU General Public License as published by the Free
-- Software Foundation, either version 2 of the License, or (at your option)
-- any later version.

-- wrappers-generator is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-- or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-- more details.

-- You should have received a copy of the GNU General Public License along with
-- this program.  If not, see <http://www.gnu.org/licenses/>.
