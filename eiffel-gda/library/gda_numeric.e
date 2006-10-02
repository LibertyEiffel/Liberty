indexing
	description: "Gda numeric."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli, GTK+ team
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hopeOA that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

class GDA_NUMERIC
 
inherit C_STRUCT

insert GDA_NUMERIC_STRUCT

creation make, from_external_pointer

feature -- TODO: understand its field and implement them

-- GdaNumeric

-- typedef struct {
-- gchar *number;
-- glong precision;
-- glong width;
-- } GdaNumeric;

end -- class GDA_NUMERIC
