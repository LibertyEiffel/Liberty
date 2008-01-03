indexing
	description: "GdaQueryCondition Represents a condition within a querya"
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

class GDA_QUERY_CONDITION
	-- GdaQueryCondition Represents a condition within a query

	-- This object represents a condition within a query. Usually there
	-- is one such object to express a WHERE condition and sometimes a
	-- GdaQueryJoin object con contain one as well to express a
	-- specific joinning condition.

	-- There are two types of conditions: 'node' conditions (AND, OR,
	-- NOT), where there are one or more children condition and 'leaf'
	-- conditions, where there are only operands.

inherit
	GDA_QUERY_OBJECT

	GDA_REFERER
	GDA_RENDERER
	GDA_XML_STORAGE

insert
	GDA_QUERY_CONDITION_TYPE
	GDA_QUERY_CONDITION_OPERATOR

creation from_external_pointer

feature {} -- Creation
	make (a_query: GDA_QUERY; a_type: INTEGER) is
			-- Creates a new GdaQueryCondition object
		require 
			query_not_void: a_query/=Void
			valid_type: is_valid_condition_type (a_type)
		do
			from_external_pointer(gda_query_condition_new 
										 (a_query.handle, a_type))
		end	

	--TODO: gda_query_condition_new_copy ()
	--
	-- GdaQueryCondition*  gda_query_condition_new_copy        (GdaQueryCondition *orig,
	--                                                          GHashTable *replacements);
	--
	--   This is a copy constructor
	--
	--   orig :         a GdaQueryCondition to copy
	--   replacements : a hash table to store replacements, or NULL
	--   Returns :      the new object
	--
	
	from_sql (a_query: GDA_QUERY; an_sql_condition: STRING) is
			-- Creates a new GdaQueryCondition object, which references
			-- other objects of `a_query,' from the `an_sql_condition'
			-- statement. `error' is updated.
		
			-- TODO: support targets : location to store a list of
			-- targets used by the new condition (and its children), or
			-- NULL

			-- Result can be invalid 
		require
			query_not_void: a_query/=Void
			condition_not_void: an_sql_condition/=Void
		local ptr: POINTER 
		do
			ptr:=(gda_query_condition_new_from_sql
					(a_query.handle, an_sql_condition.to_external,
					 default_pointer,
					 -- GSList **targets, a location to store a list of
					 -- targets used by the new condition (and its
					 -- children), or NULL
					 address_of(error.handle)))
			
			if ptr.is_not_null then from_external_pointer(ptr) end
		end

feature	
	set_condition_type (a_condition: INTEGER) is
			-- Sets the kind of condition condition represents. If type
			-- implies a node condition and condition currently
			-- represents a leaf, or if type implies a leaf condition and
			-- condition currently represents a node, then condition is
			-- changed without any error.
		require valid_type: is_valid_condition_type (a_condition)
		do
			gda_query_condition_set_cond_type (handle, a_condition)
		end	

	condition_type: INTEGER is
		-- the type of condition
		do
			Result:=gda_query_condition_get_cond_type(handle)
		ensure valid_type: is_valid_condition_type(Result)
		end

	children: G_OBJECT_SLIST[GDA_QUERY_CONDITION] is
			-- A list of GdaQueryCondition objects which are children of
			-- Current condition.
		do
			create Result.from_external_pointer(gda_query_condition_get_children(handle))
		end

	parent: GDA_QUERY_CONDITION is
			-- The parent of Current condition. Can be Void
		local f: G_OBJECT_EXPANDED_FACTORY[GDA_QUERY_CONDITION]; p: POINTER
		do
			p:=gda_query_condition_get_parent(handle)
			if p.is_not_null then 
				Result:=f.existant_wrapper(p)
				if Result=Void then  
					create Result.from_external_pointer(p)
				end
			end
		end

	child_by_xml_id (an_xml_id: STRING): GDA_QUERY_CONDITION is
			-- The child with `an_xml_id'. Void if `an_xml_id' is not
			-- found
		require id_not_void: an_xml_id/=Void
		local f: G_OBJECT_EXPANDED_FACTORY[GDA_QUERY_CONDITION]; p: POINTER
		do
			p:= gda_query_condition_get_child_by_xml_id (handle,an_xml_id.to_external)
			if p.is_not_null then 
				Result:=f.existant_wrapper(p)
				if Result=Void then  
					create Result.from_external_pointer(p)
				end
			end
		end

	is_ancestor (a_condition: GDA_QUERY_CONDITION): BOOLEAN is
			-- Is `a_condition' an ancestor of Current condition?
		do
			Result:=(gda_query_condition_is_ancestor(handle, a_condition.handle).to_boolean)
		end

	is_leaf: BOOLEAN is
			-- Is Current a leaf condition (not AND, OR, NOT, etc)?
		do
			Result:=gda_query_condition_is_leaf(handle).to_boolean
		end

	add_child (a_child: GDA_QUERY_CONDITION) is
			-- Adds `a_child' to condition; this is possible only if
			-- condition is a node type (AND, OR, etc). `is_successful'
			-- and `error' are updated.
		require child_not_void: a_child/=Void
		do
			is_successful:=(gda_query_condition_node_add_child
								 (handle, a_child.handle, address_of(error.handle))).to_boolean
		end	

	delete_child (a_child: GDA_QUERY_CONDITION) is
			-- Removes a child from condition; this is possible only if
			-- condition is a node type (AND, OR, etc) (TODO: Translate in a precondition)
		require child_not_void: a_child/=Void
		do
			gda_query_condition_node_del_child  (handle, a_child.handle)
		end

	leaf_set_operator (an_operator: INTEGER; a_field: GDA_QUERY_FIELD) is
		require 
			valid_operator: is_valid_condition_operator(an_operator)
			field_not_void: a_field/=Void
		do
			gda_query_condition_leaf_set_operator(handle, an_operator, a_field.handle)
		end

	leaf_operator (an_operator: INTEGER ): GDA_QUERY_FIELD is
			-- One of condition's operators.
		require 
			valid_operator: is_valid_condition_operator(an_operator)
		local p: POINTER; f: G_OBJECT_EXPANDED_FACTORY[GDA_QUERY_FIELD]
		do
			p:=gda_query_condition_leaf_get_operator(handle,an_operator)
			check p.is_not_null end
			Result:=f.existant_wrapper(p)
			if Result=Void then create Result.from_external_pointer(p) end
		end

feature -- Join queries
	target, another_target: GDA_QUERY_TARGET

	is_equi_join: BOOLEAN 

	represents_join: BOOLEAN is
			-- Does Current condition represent a join condition? It is a
			-- condition (within a GdaQuery object) for which the only
			-- GdaQueryFieldField fields taking part in the condition are
			-- from two distincts GdaQueryTarget objects. Such conditions
			-- can be assigned to a GdaQueryJoin object using the
			-- GDA_QUERY_JOIN.`set_condition' or
			-- GDA_QUERY_JOIN.`set_condition_from_fkcons' methods.
			
			-- Additionnaly, if Current condition is a join condition,
			-- and if `target' and `another_target' are not Void then
			-- they are set to point to the two GdaQueryTarget objects
			-- taking part in the condition. In this case `target' and
			-- `another_target' wil hold non Void values.
			
			-- In `is_equi_joi' will be set to TRUE if the join condition
			-- is an equi join (that is the only comparison operator is
			-- the equal sign and there are only AND operators in the
			-- condition).
			
			-- If condition is not a join condition, then `target',
			-- `another_target2' and `is_equi_join' are left untouched.
	
			--   condition :    a GdaQueryCondition object
			--   target1 :      place to store one of the targets, or NULL
			--   target2 :      place to store the other target, or NULL
			--   is_equi_join : place to store if the join is an equi join
			--   Returns :      TRUE if condition is a join condition
		do	
			Result:=(gda_query_condition_represents_join 
						(handle,
						 null_or(target), null_or(another_target),
						 $is_equi_join)).to_boolean
		end

	represents_join_strict: BOOLEAN is
			-- Does Current condition represents a strict join condition?
			-- It is a join condition as defined for the
			-- `represents_join', but where the condition is either
			-- "target1.field1=target2.field2" or a list of such
			-- conditions conjuncted by the AND operator.
	
			-- If condition is not a join condition, then `target' and
			-- `another_target' are left untouched.
		do
			Result:=(gda_query_condition_represents_join_strict
						(handle, null_or(target), null_or(another_target))).to_boolean
		end	


	main_conditions: G_OBJECT_SLIST[GDA_QUERY_CONDITION] is
			-- A newly allocated list of all the conditions which are
			-- always verified by condition when it returns TRUE when
			-- evaluated. Basically the returned list lists the atomic
			-- conditions which are AND'ed together to form the complex
			-- condition.
		
			--   Examples: if condition is:
		
			--     o "A and B" then the list will contains {A, B}
		
			--     o "A and (B or C)" it will contain {A, B or C}
		
			--     o "A and (B and not C)", it will contain {A, B, not C}
		do
			create Result.from_external_pointer(gda_query_condition_get_main_conditions(handle))
		ensure not_void: Result/=Void
		end			

	--  The "cond-type" property
	--
	--   "cond-type"                gint                  : Read / Write
	--
	--   Allowed values: [0,17]
	--
	--   Default value: 17
	--
	--   --------------------------------------------------------------------------
	--
	--  The "join" property
	--
	--   "join"                     GdaQueryJoin          : Read / Write
	--
	--   --------------------------------------------------------------------------
	--
	--  The "query" property
	--
	--   "query"                    GdaQuery              : Read / Write / Construct Only
feature
	dummy_gobject: POINTER is do unimplemented end
	
feature {} -- unwrapped 
	-- Note: it is not necessary to wrap  gda_query_condition_get_ref_objects_all ()
	--
	-- GSList*             gda_query_condition_get_ref_objects_all
	--                                                         (GdaQueryCondition *cond);
	--
	--   Get a complete list of the objects referenced by cond, including its
	--   descendants (unlike the gda_referer_get_ref_objects() function applied to
	--   cond).
	--
	--   cond :    a GdaQueryCondition object
	--   Returns : a new list of referenced objects
	--
	--Property Details
	--

feature {} -- External calls
	-- GdaQueryCondition;
	gda_query_condition_new (a_query: POINTER; a_type: INTEGER): POINTER is
			-- GdaQueryCondition* gda_query_condition_new (GdaQuery *query, GdaQueryConditionType type);
		external "C use <libgda/libgda.h>"
		end

	gda_query_condition_new_copy (a_orig, a_replacements: POINTER): POINTER is
			-- GdaQueryCondition* gda_query_condition_new_copy (GdaQueryCondition *orig, GHashTable *replacements);
		external "C use <libgda/libgda.h>"
		end

	gda_query_condition_new_from_sql (a_query, a_sql_cond, some_targets, an_error_ref: POINTER): POINTER is
			-- GdaQueryCondition* gda_query_condition_new_from_sql (GdaQuery *query, const gchar *sql_cond, GSList **targets, GError **error);
		external "C use <libgda/libgda.h>"
		end

	gda_query_condition_set_cond_type (a_condition: POINTER; a_type: INTEGER) is
			-- void gda_query_condition_set_cond_type (GdaQueryCondition *condition, GdaQueryConditionType type);
		external "C use <libgda/libgda.h>"
		end

	gda_query_condition_get_cond_type (a_condition: POINTER): INTEGER is
			-- GdaQueryConditionType gda_query_condition_get_cond_type (GdaQueryCondition *condition);
		external "C use <libgda/libgda.h>"
		end

	gda_query_condition_get_children (a_condition: POINTER): POINTER is
			-- GSList* gda_query_condition_get_children (GdaQueryCondition *condition);
		external "C use <libgda/libgda.h>"
		end

	gda_query_condition_get_parent (a_condition: POINTER): POINTER is
			-- GdaQueryCondition* gda_query_condition_get_parent (GdaQueryCondition *condition);
		external "C use <libgda/libgda.h>"
		end

	gda_query_condition_get_child_by_xml_id (a_condition, a_xml_id: POINTER): POINTER is
			-- GdaQueryCondition* gda_query_condition_get_child_by_xml_id
			-- (GdaQueryCondition *condition, const gchar *xml_id);
		external "C use <libgda/libgda.h>"
		end

	gda_query_condition_is_ancestor (a_condition, a_ancestor: POINTER): INTEGER is
			-- gboolean gda_query_condition_is_ancestor (GdaQueryCondition *condition, GdaQueryCondition *ancestor);
		external "C use <libgda/libgda.h>"
		end

	gda_query_condition_is_leaf (a_condition: POINTER): INTEGER is
			-- gboolean gda_query_condition_is_leaf (GdaQueryCondition *condition);
		external "C use <libgda/libgda.h>"
		end

	gda_query_condition_node_add_child (a_condition, a_child, an_error_ref: POINTER): INTEGER is
			-- gboolean gda_query_condition_node_add_child (GdaQueryCondition *condition, GdaQueryCondition *child, GError **error);
		external "C use <libgda/libgda.h>"
		end

	gda_query_condition_node_del_child (a_condition, a_child: POINTER) is
			-- void gda_query_condition_node_del_child (GdaQueryCondition *condition, GdaQueryCondition *child);
		external "C use <libgda/libgda.h>"
		end

	gda_query_condition_leaf_set_operator (a_condition: POINTER; an_op: INTEGER; a_field: POINTER) is
			-- void gda_query_condition_leaf_set_operator (GdaQueryCondition *condition, GdaQueryConditionOperator op, GdaQueryField *field);
		external "C use <libgda/libgda.h>"
		end

	gda_query_condition_leaf_get_operator (a_condition: POINTER; an_op: INTEGER): POINTER is
			-- GdaQueryField* gda_query_condition_leaf_get_operator (GdaQueryCondition *condition, GdaQueryConditionOperator op);
		external "C use <libgda/libgda.h>"
		end

	gda_query_condition_represents_join (a_condition, a_target1, a_target2, a_is_equi_join: POINTER): INTEGER is
			-- gboolean gda_query_condition_represents_join (GdaQueryCondition *condition, GdaQueryTarget **target1, GdaQueryTarget **target2, gboolean *is_equi_join);
		external "C use <libgda/libgda.h>"
		end

	gda_query_condition_represents_join_strict (a_condition, a_target1, a_target2: POINTER): INTEGER is
			-- gboolean gda_query_condition_represents_join_strict (GdaQueryCondition *condition, GdaQueryTarget **target1, GdaQueryTarget **target2);
		external "C use <libgda/libgda.h>"
		end

	gda_query_condition_get_main_conditions (a_condition: POINTER): POINTER is
			-- GSList* gda_query_condition_get_main_conditions (GdaQueryCondition *condition);
		external "C use <libgda/libgda.h>"
		end

	gda_query_condition_get_ref_objects_all (a_cond: POINTER): POINTER is
			-- GSList* gda_query_condition_get_ref_objects_all (GdaQueryCondition *cond);
		external "C use <libgda/libgda.h>"
		end

end -- class GDA_QUERY_CONDITION
