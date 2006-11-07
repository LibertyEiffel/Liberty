indexing
	description: "GdaDictConstraint Represents a constraint within a database."
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

			-- Description: Any type of constraint in a database is represented by
			-- one instance of the class (see the possible types of
			-- constraints). As some constraints may not depend exclusively on a
			-- table, all the constraints are attached to the database itself.

class GDA_DICT_CONSTRAINT

inherit
	GDA_OBJECT

   -- TODO: GdaDictConstraint implements GdaXmlStorage and GdaReferer.

insert GDA_DICT_CONSTRAINT_EXTERNALS

creation from_table, from_external_pointer

feature {} -- Creation
	from_table (a_table: GDA_DICT_TABLE; a_type: INTEGER) is
			-- Creates a new GdaDictConstraint object

			-- `a_table': the GdaDictTable to which the constraint is attached
		
			-- `a_type': the type of constraint
		require
			table_not_void: a_table /= Void
			valid_type: is_valid_constraint_type (a_type)
		do
			from_external_pointer(gda_dict_constraint_new
										 (a_table.handle, a_type))
		end

	with_db (a_database: GDA_DICT_DATABASE) is
			-- Creates a new GdaDictConstraint object without specifying anything
			-- about the constraint except the database it is attached to. This is
			-- usefull only when the object is going to be loaded from an XML node.
		require database_not_void: a_database /= Void
		do
			from_external_pointer(gda_dict_constraint_new_with_db
										 (a_database.handle))
		end

feature
	constraint_type: INTEGER is
			-- the type of constraint the cstr object represents
		do
			Result:=(gda_dict_constraint_get_constraint_type
						(handle))
		ensure
			valid_type: is_valid_constraint_type (Result)
		end

	is_equal (another: like Current): BOOLEAN is
			-- Compares Current to `another' to see if they are equal, without
			-- taking into account the name of the constraints or weather they are
			-- user or system defined
		do
			Result:=(gda_dict_constraint_equal
						(handle, another.handle)).to_boolean
		end

	table: GDA_DICT_TABLE is
			-- the table to which the constraint is attached
		local r: G_RETRIEVER[GDA_DICT_TABLE]; p: POINTER
		do
			p:=gda_dict_constraint_get_table(handle)
			Result:=r.eiffel_wrapper_from_gobject_pointer(p)
			if Result=Void then 
				create Result.from_external_pointer(p) 
			end
		end

	does_use_field (a_field: GDA_DICT_FIELD): BOOLEAN is
			-- Is `a_field' is part of the Current constraint.
		do
			Result:=(gda_dict_constraint_uses_field
						(handle, a_field.handle)).to_boolean
		end

	set_primary_key_fields (some_fields: G_SLIST[GDA_DICT_FIELD]) is
			-- Sets the fields which make the primary key represented by
			-- Current. All the fields must belong to the same GdaDictTable to
			-- which the constraint is attached
		require
			fields_not_void: some_fields /= Void
			-- TODO: All the fields must belong to the same GdaDictTable to which
			-- the constraint is attached
		do
			gda_dict_constraint_pkey_set_fields
			(handle, some_fields.handle)
		end

	primary_key_fields: G_SLIST[GDA_DICT_FIELD] is
			-- the list of fields composing the primary key constraint which
			-- Current represents. The returned list is allocated and must be
			-- de-allocated by the caller.
		local r: G_RETRIEVER[G_SLIST[GDA_DICT_FIELD]]; p: POINTER
		do
			p:=gda_dict_constraint_pkey_get_fields(handle)
			-- TODO: The returned list is allocated and must be de-allocated by the
			-- caller.
			Result:=r.eiffel_wrapper_from_gobject_pointer(p)
			if Result=Void then 
				create Result.from_external_pointer(p) 
			end
		end
		
	set_foreign_key_fields (some_fields: G_SLIST[GDA_DICT_CONSTRAINT_FOREIGN_KEY_PAIR]) is
			-- Sets the field pairs which make the foreign key
			-- represented by Current. All the field pairs must list a field
			-- which belong to the same GdaDictTable to which the
			-- constraint is attached and a field which belongs to a
			-- GdaDictTable which is different from the one just
			-- mentionned and which is within the same database. The
			-- pairs are of type GdaDictConstraintFkeyPair.
		require 
			fields_not_void: some_fields /= Void
			fields_number_even: some_fields.count.is_even
		do
			gda_dict_constraint_fkey_set_fields(handle,some_fields.handle)
		end

	-- TODO: wrap  gda_dict_constraint_fkey_get_ref_table ()
	
	-- GdaDictTable* gda_dict_constraint_fkey_get_ref_table
	-- (GdaDictConstraint *cstr); Get the GdaDictTable at the other end
	-- of the foreign key relaion represented by this constraint cstr :
	-- a GdaDictConstraint object Returns : the GdaDictTable


	foreign_key_fields: G_SLIST[GDA_DICT_CONSTRAINT_FOREIGN_KEY_PAIR] is
			-- the list of field pairs composing the foreign key
			-- constraint which cstr represents. TODO: implement this "In
			-- the returned list, each pair item is allocated and it's up
			-- to the caller to free the list and each pair, and the
			-- reference count for each pointer to GObjects in each pair
			-- is NOT INCREASED, which means the caller of this function
			-- DOES NOT hold any reference on the mentionned GObjects (if
			-- he needs to, it has to call G_OBJECT.ref)".
		local r: G_RETRIEVER[GDA_DICT_CONSTRAINT_FOREIGN_KEY_PAIR]; p: POINTER
		do
			p:=gda_dict_constraint_fkey_get_fields(handle)
			Result:=r.eiffel_wrapper_from_gobject_pointer(p)
			if Result=Void then 
				create Result.from_external_pointer(p) 
			end
		end

	set_foreign_key_actions (on_update, on_delete: INTEGER) is
			-- Sets the actions undertaken by the DBMS when some actions
			-- occur on the referenced data: `on_update' is the action
			-- undertaken when an UPDATE occurs. `on_delete' is the
			-- action undertaken when a DELETE occurs.
		require 
			valid_update_action: is_valid_foreign_key_action (on_update)
			valid_delete_action: is_valid_foreign_key_action (on_delete)
		do
			gda_dict_constraint_fkey_set_actions(handle, on_update, on_delete)
		end

	foreing_key_actions: TUPLE[INTEGER,INTEGER] is
			-- The actions undertaken by the DBMS when some actions occur
			-- on the referenced
			-- data. `[on_update,on_delete]'. `on_update': an address to
			-- store the action undertaken when an UPDATE occurs
			-- `on_delete': an address to store the action undertaken
			-- when a DELETE occurs
		local onu, und: INTEGER
		do
			gda_dict_constraint_fkey_get_actions(handle,$onu,$ond)
			create Result.make_2(onu,ond)
		end

	set_unique_fields (some_fields: G_SLIST[GDA_DICT_FIELD]) is
		require fields_not_void: some_fields /= Void 
		do
			gda_dict_constraint_unique_set_fields(handle,some_fields.handle)
		end

	unique_fields: G_SLIST[GDA_DICT_FIELD] is
			-- the list of fields represented by this UNIQUE
			-- constraint. It's up to the caller to free the list.
		local r: G_RETRIEVER[GDA_DICT_CONSTRAINT_FOREIGN_KEY_PAIR]; p: POINTER
		do
			p:=gda_dict_constraint_unique_get_fields(handle)
			Result:=r.eiffel_wrapper_from_gobject_pointer(p)
			if Result=Void then 
				create Result.from_external_pointer(p) 
			end
			Result.set_unshared
		end

	set_not_null_field (a_field: GDA_DICT_FIELD) is
		require field_not_void: a_field /= Void
		do
			gda_dict_constraint_not_null_set_field(handle,a_field.handle)
		end

	not_null_field: GDA_DICT_FIELD is
		local r: G_RETRIEVER[GDA_DICT_CONSTRAINT_FOREIGN_KEY_PAIR]; p: POINTER
		do
			p:=gda_dict_constraint_not_null_get_field(handle)
			Result:=r.eiffel_wrapper_from_gobject_pointer(p)
			if Result=Void then 
				create Result.from_external_pointer(p) 
			end
			Result.set_unshared
		end

feature -- Property Details
	-- The "user-constraint" property "user-constraint" gboolean :
	-- Read/Write Default value: FALSE
end -- class GDA_DICT_CONSTRAINT
