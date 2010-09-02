class C_NAMESPACE
	-- The root node of an XML file made by gccxml.

	-- A C++ name-space is modelled in Liberty as a cluster, a directory
	-- containing classes, subclusters and how they shall be compiled and
	-- linked.
inherit 
	GCCXML_NODE 
		redefine emit_wrapper end
	CONTEXTED_NODE
	NAMED_NODE
	IDENTIFIED_NODE
	STORABLE_NODE

creation make
feature 
	store is
		do
			namespaces.put(Current,id)
		end

	is_main: BOOLEAN is
		-- Is Current name space the "main" default namespace? The default namespace is named "::"
	do
		Result:=c_string_name.is_equal(once "::")
	end

	directory: PATH_NAME is
		-- Path of the directory representing Current namespace
	do
		if cached_dir=Void then
			if is_main then create cached_dir.make_current 
			else -- Recursively build the path
				cached_dir := namespace.directory / c_string_name
			end
		end
		Result := cached_dir
	end

	are_members_wrapped: BOOLEAN is
		-- Shall the members of this namespace be wrapped?
		attribute
	end

	emit_wrapper is
		-- The wrapper of a namespace actually is not any Liberty code but only
		-- a directory that will be the cluster representing that namespace.
	local cwd: STRING; bd: BASIC_DIRECTORY; outcome: BOOLEAN
	do
		-- Create a directory named like Current namespace that will contain everything defined in that namespace.
		-- Try to create the directory and forget about the result
		outcome :=  bd.create_new_directory(directory.to_string);
		if directory.is_directory then
			are_members_wrapped:=True 
			-- Each gccxml node will query its containing namespace to see if it shall be wrapped.
		else -- directory still doesn't exists, we cannot wrap its content. 
			log("Namespace `@(1)' would be wrapped into `@(2)', but it is not a directory or could not be created: its contents shall not be wrapped.%N",
			<<c_string_name, directory.to_string>>)
		end
	end

feature {STORABLE_NODE} -- Contained nodes
	
feature {} -- Implementation
	cached_dir: PATH_NAME
-- invariant name.is_equal(once "Namespace")
end -- class C_NAMESPACE

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
