indexing
	description: "."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, GDA developers
					
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

	wrapped_version: "3.0.1"

class GDA_QUERY_TARGET
	-- GdaQueryTarget represents a target entity within a query.

	-- A GdaQueryTarget object represents an entity (usually a table,
	-- as a GdaDictTable) which is taking part in a query. For SELECT
	-- queries, the targets are the entities listed after the FROM
	-- clause; for the INSERT, DELETE and UPDATE queries, there is only
	-- one target which is the entity to which the modifications apply.

	-- Within a single SELECT query, there can be more than one
	-- GdaQueryTarget object representing the same entity for queries
	-- making usage of an entity more than one time.

inherit
	GDA_QUERY_OBJECT redefine copy, struct_size end
	
	GDA_REFERER
	GDA_RENDERER
	GDA_XML_STORAGE

creation from_external_pointer

feature {} -- Creation
	make (a_query: GDA_QUERY; a_table: STRING) is
			-- Creates a new GdaQueryTarget object, specifying the name
			-- of the table to reference.
		require 
			query_not_void: a_query/=Void
			table_not_void: a_table/=Void
		do
			from_external_pointer(gda_query_target_new
										 (a_query.handle, a_table.to_external))

		end

feature
	copy (another: like Current) is
			-- Makes a copy of an existing object (copy constructor)
		do
			from_external_pointer(gda_query_target_new_copy(another.handle))
		end

feature
	gda_query: GDA_QUERY is
			--  the GdaQuery in which target is
		local p: POINTER; f: G_OBJECT_EXPANDED_FACTORY[GDA_QUERY]
		do
			p:=gda_query_target_get_query(handle)
			check p.is_not_null end
			Result:=f.existant_wrapper(p)
			if Result=Void then create Result.from_external_pointer(p) end
		end

	represented_table_name: CONST_STRING is
		-- the table name represented by target; Void if Current does
		-- not represent a database table
		local p: POINTER
		do
			p:=gda_query_target_get_represented_table_name(handle)
			if p.is_not_null then create Result.from_external(p) end
		end

	represented_entity: GDA_ENTITY is
			-- the GdaEntity object which is represented by Current; 
			-- Void if Current target is not active
		
		local f: G_OBJECT_EXPANDED_FACTORY[GDA_ENTITY]; p: POINTER
		do
			p:=gda_query_target_get_represented_entity(handle)
			if p.is_not_null then
				Result:=f.wrapper(p)
			end
		end
	
	set_alias (an_alias: STRING) is
			--   Sets target's alias to alias
		require an_alias/=Void
		do
			gda_query_target_set_alias(handle,an_alias.to_external)
		ensure set: an_alias.is_equal(target_alias)
		end

	target_alias: CONST_STRING is
			-- Alias of Current.
		do
			create Result.from_external(gda_query_target_get_alias(handle)) 
		ensure not_void: Result/=Void
		end	

	--  gda_query_target_get_complete_name ()
	--
	-- gchar*              gda_query_target_get_complete_name  (GdaQueryTarget *target);
	--
	--   Get a complete name for target in the form of "<entity name> AS <target
	--   alias>"
	--
	--   target :  a GdaQueryTarget object
	--   Returns : a new string
	--
	--Properties
	--
	--
	--   "entity"                   GdaEntity             : Read / Write
	--   "entity-id"                gchararray            : Write
	--   "entity-name"              gchararray            : Write
	--   "query"                    GdaQuery              : Read / Write / Construct Only

	--Property Details
	--
	--  The "entity" property
	--
	--   "entity"                   GdaEntity             : Read / Write
	--
	--   --------------------------------------------------------------------------
	--
	--  The "entity-id" property
	--
	--   "entity-id"                gchararray            : Write
	--
	--   Default value: NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  The "entity-name" property
	--
	--   "entity-name"              gchararray            : Write
	--
	--   Default value: NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  The "query" property
	--
	--   "query"                    GdaQuery              : Read / Write / Construct Only
feature
	dummy_gobject: POINTER is do unimplemented end
	
	struct_size: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "sizeof(GdaQueryTarget)"
		end

feature {} -- External calls
	 gda_query_target_new (a_query, a_table: POINTER): POINTER is
			-- GdaQueryTarget* gda_query_target_new (GdaQuery *query, const gchar *table);
		external "C use <libgda/libgda.h>"
		end
	
	gda_query_target_new_copy (an_orig: POINTER): POINTER is
			-- GdaQueryTarget* gda_query_target_new_copy (GdaQueryTarget *orig);
		external "C use <libgda/libgda.h>"
		end

	gda_query_target_get_query (a_target: POINTER): POINTER is
			-- GdaQuery* gda_query_target_get_query (GdaQueryTarget *target);
		external "C use <libgda/libgda.h>"
		end

	 gda_query_target_get_represented_table_name (a_target: POINTER): POINTER is
			-- const gchar* gda_query_target_get_represented_table_name (GdaQueryTarget *target);
		external "C use <libgda/libgda.h>"
		end

	gda_query_target_get_represented_entity (a_target: POINTER): POINTER is
			-- GdaEntity* gda_query_target_get_represented_entity (GdaQueryTarget *target);
		external "C use <libgda/libgda.h>"
		end

	gda_query_target_set_alias (a_target, an_alias: POINTER) is
			-- void gda_query_target_set_alias (GdaQueryTarget *target, const gchar *alias);
		external "C use <libgda/libgda.h>"
		end

	gda_query_target_get_alias (a_target: POINTER): POINTER is
			-- const gchar* gda_query_target_get_alias (GdaQueryTarget *target);
		external "C use <libgda/libgda.h>"
		end
	
	gda_query_target_get_complete_name (a_target: POINTER): POINTER is
			-- gchar* gda_query_target_get_complete_name (GdaQueryTarget *target);
		external "C use <libgda/libgda.h>"
		end

end -- class GDA_QUERY_TARGET
