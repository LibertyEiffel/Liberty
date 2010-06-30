deferred class CONTEXTED_NODE
	-- A Gccxml node with "context" attribute
inherit GCCXML_NODE
insert SHARED_COLLECTIONS
feature 

	context: UNICODE_STRING is 
		do 
			Result:=attribute_at(once U"context") 
		ensure Result/=Void
		end

	namespace: C_NAMESPACE is
		do
			Result:=namespaces.reference_at(context)
		end

	is_in_main_namespace: BOOLEAN is
		-- Does Current belong to the main ("::") namespace?
	local ns: C_NAMESPACE
	do
		ns := namespace
		if ns/=Void then Result := ns.c_name.is_equal(once U"::")
		else 
			log("Context of @(1) (line @(2)) is not a namespace", <<name.as_utf8, line.out>>)
			check
				Result=False
			end
		end
	end
end -- class CONTEXTED_NODE

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
