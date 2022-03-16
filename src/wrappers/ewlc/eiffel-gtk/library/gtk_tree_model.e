note
	description: "GtkTreeModel -- The tree interface used by GtkTreeView."
	copyright: "[
					Copyright (C) 2006-2022: eiffel-libraries team, GTK+ team
					
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

deferred class GTK_TREE_MODEL
	-- The GtkTreeModel interface defines a generic tree interface for use by the
	-- GtkTreeView widget. It is an abstract interface, and is designed to be
	-- usable with any appropriate data structure. The programmer just has to
	-- implement this interface on their own data type for it to be viewable by a
	-- GtkTreeView widget.

	-- The model is represented as a hierarchical tree of strongly-typed,
	-- columned data. In other words, the model can be seen as a tree where every
	-- node has different values depending on which column is being queried. The
	-- type of data found in a column is determined by using the GType system
	-- (ie. `g_type_int,' `gtk_type_button,' `g_type_pointer,' etc.). The types
	-- are homogeneous per column across all nodes. It is important to note that
	-- this interface only provides a way of examining a model and observing
	-- changes. The implementation of each individual model decides how and if
	-- changes are made.

	-- In order to make life simpler for programmers who do not need to write
	-- their own specialized model, two generic models are provided: the
	-- GtkTreeStore and the GtkListStore. To use these, the developer simply
	-- pushes data into these models as necessary. These models provide the data
	-- structure as well as all appropriate tree interfaces. As a result,
	-- implementing drag and drop, sorting, and storing data is trivial. For the
	-- vast majority of trees and lists, these two models are sufficient.
	
	-- Models are accessed on a node/column level of granularity. One can query
	-- for the value of a model at a certain node and a certain column on that
	-- node. There are two structures used to reference a particular node in a
	-- model. They are the GtkTreePath and the GtkTreeIter. Most of the interface
	-- consists of operations on a GtkTreeIter.

	-- A path is essentially a potential node. It is a location on a model that
	-- may or may not actually correspond to a node on a specific model. The
	-- GtkTreePath struct can be converted into either an array of unsigned
	-- integers or a string. The string form is a list of numbers separated by a
	-- colon. Each number refers to the offset at that level. Thus, the path 0:
	-- refers to the root node and the path "refers" to the fifth child of
	-- the third node.

	-- By contrast, a GtkTreeIter is a reference to a specific node on
	-- a specific model. It is a generic struct with an integer and
	-- three generic pointers. These are filled in by the model in a
	-- model-specific way. One can convert a path to an iterator by
	-- calling `get_new_iterator'. These iterators are the primary way
	-- of accessing a model and are similar to the iterators used by
	-- GtkTextBuffer. They are generally statically allocated on the
	-- stack and only used for a short time. The model interface
	-- defines a set of operations using them for navigating the model.

	-- It is expected that models fill in the iterator with private
	-- data. For example, the GtkListStore model, which is internally a
	-- simple linked list, stores a list node in one of the
	-- pointers. The GtkTreeModelSort stores an array and an offset in
	-- two of the pointers. Additionally, there is an integer
	-- field. This field is generally filled with a unique stamp per
	-- model. This stamp is for catching errors resulting from using
	-- invalid iterators with a model.

	-- The lifecycle of an iterator can be a little confusing at
	-- first. Iterators are expected to always be valid for as long as
	-- the model is unchanged (and doesn't emit a signal). The model is
	-- considered to own all outstanding iterators and nothing needs to
	-- be done to free them from the user's point of
	-- view. Additionally, some models guarantee that an iterator is
	-- valid for as long as the node it refers to is valid (most
	-- notably the GtkTreeStore and GtkListStore). Although generally
	-- uninteresting, as one always has to allow for the case where
	-- iterators do not persist beyond a signal, some very important
	-- performance enhancements were made in the sort model. As a
	-- result, the GTK_TREE_MODEL_ITERS_PERSIST flag was added to
	-- indicate this behavior.

inherit
	-- G_INTERFACE
	-- Prerequisites: GtkTreeModel requires GObject.
	G_OBJECT
		
		-- Known Derived Interfaces: GtkTreeModel is required by
		-- GtkTreeSortable.
		
		-- Known Implementations: GtkTreeModel is implemented by
		-- GtkTreeModelSort, GtkTreeStore, GtkListStore and
		-- GtkTreeModelFilter.

insert
	GTK
	GTK_TREE_MODEL_EXTERNALS
	GTK_TREE_MODEL_FLAGS

feature {ANY}
	flags: INTEGER
			-- The set of flags supported by Current's interface. The
			-- flags are a bitwise combination of GtkTreeModelFlags. The
			-- flags supported should not change during the lifecycle of
			-- the tree_model.
		do
			Result :=  gtk_tree_model_get_flags  (handle)
		ensure are_valid_tree_model_flags (Result)
		end

	n_columns, columns_count: INTEGER
			-- the number of columns supported by tree_model.
		do
			Result := gtk_tree_model_get_n_columns (handle)
		end

	column_type (a_column_number: INTEGER): INTEGER
			-- the type of the column; it is a G_TYPE integer
			-- TODO: require: valid_column_number: a_column_number.in_range (0,columns_count)
		do
			Result := gtk_tree_model_get_column_type  (handle, a_column_number)
			-- TODO: ensure is_g_type (Result)
		end

	get_new_iterator (a_path: GTK_TREE_PATH): GTK_TREE_ITER
			-- Gets a new iterator pointing to `a_path'. If it cannot be
			-- valid it will be Void (i.e. if `a_path' refers to a not
			-- existing row)
		require valid_path: a_path /= Void
		local gbool: INTEGER
		do
			create Result.from_model(Current)
			gbool := gtk_tree_model_get_iter (handle, Result.handle, a_path.handle)
			if (gbool = 0) then
				-- Should be also called by Eiffel's garbage collector but
				-- it is nevertheless worth to call it: it is safe and avoid a
				-- memory leak in the case you compile without a GC
				Result.dispose
				Result := Void
			end
		end

	get_iterator_from_string (a_path_string: STRING): GTK_TREE_ITER
			-- Gets a new iterator pointing to `a_path_string', if it exists. If it cannot be
			-- valid it will be Void
		require valid_path_string: a_path_string/=Void
		local gbool: INTEGER
		do
			create Result.make
			gbool := gtk_tree_model_get_iter_from_string (handle, Result.handle, a_path_string.to_external);
			if (gbool = 0) then
				Result.dispose -- See get_new_iterator for info
				Result := Void
			end
		end

	get_iterator_first: GTK_TREE_ITER
			-- Gets an first iterator to the first element in the tree
			-- (the one at the path "0"). Void if the tree is empty.
		local gbool: INTEGER
		do
			create Result.from_model (Current)
			gbool := gtk_tree_model_get_iter_first (handle, Result.handle)
			if (gbool = 0) then
				Result.dispose -- See get_new_iterator for info
				Result := Void
			end
		end

	path (an_iterator: GTK_TREE_ITER): GTK_TREE_PATH
			-- A newly-created GtkTreePath referenced by `an_iterator'.
		require valid_iterator: an_iterator/=Void
		do
			create Result.from_external_pointer (gtk_tree_model_get_path (handle, an_iterator.handle))
		end

	value_at,value (an_iterator: GTK_TREE_ITER; a_column: INTEGER): G_VALUE
			-- The value at `a_column' on the row referred by `an_iterator'.
		do
			create Result.make
			gtk_tree_model_get_value (handle, an_iterator.handle, a_column, Result.handle)
			-- Note: When done with value, g_value_unset() needs to be
			-- called to free any allocated memory. This should be
			-- already implemented into G_VALUE
		end

	ref_node (an_iter: GTK_TREE_ITER)
			-- Lets the tree ref the node referred by `an_iter'. This is
			-- an optional method for models to implement. To be more
			-- specific, models may ignore this call as it exists
			-- primarily for performance reasons.
	
			-- This feature is primarily meant as a way for views to let
			-- caching model know when nodes are being displayed (and
			-- hence, whether or not to cache that node.) For example, a
			-- file-system based model would not want to keep the entire
			-- file-hierarchy in memory, just the sections that are
			-- currently being displayed by every current view.
	
			-- A model should be expected to be able to get an iter independent
			-- of its reffed state.
		require iter_not_void: an_iter /= Void
		do
			gtk_tree_model_ref_node (handle, an_iter.handle)
		end
	
	unref_node (an_iter: GTK_TREE_ITER)
			-- Lets the tree unref the node referred by `an_iter'. This
			-- is an optional method for models to implement. To be more
			-- specific, models may ignore this call as it exists
			-- primarily for performance reasons.
	
			-- For more information on what this means, see
			-- `ref_node'. Please note that nodes that are deleted are
			-- not unreffed.
		require iter_not_void: an_iter /= Void
		do
			gtk_tree_model_unref_node (handle, an_iter.handle)
		end
	
	
	-- Note: gtk_tree_model_get and gtk_tree_model_get_valist are
	-- unwrappable since variadic or valist-using. They are implemented
	-- in C as a tight loop around a gtk_tree_model_get_value call. We 
	-- reimplement it
	
	values, get (an_iter: GTK_TREE_ITER; some_columns: COLLECTION[INTEGER]): COLLECTION[G_VALUE]
			-- the value of one or more cells in the row referenced by
			-- `an_iter'. `some_columns' are the integer column
			-- numbers.

			-- TODO: decide which name is better among `values' and `get'
		require 
			iter_not_void: an_iter /= Void
			valid_columns: some_columns /= Void
			-- TODO: correct_columns: some_columns.forall
			-- (is_valid_g_value (?))
		local columns_iterator: ITERATOR[INTEGER]; col_n: INTEGER
		do
			create {LINKED_LIST[G_VALUE]} Result.make
			columns_iterator:=some_columns.get_new_iterator
			from columns_iterator.start
			until columns_iterator.is_off
			loop
				col_n:=columns_iterator.item
				Result.add_last(value(an_iter, col_n))
				columns_iterator.next
			end
		ensure
			Result /= Void
			Result.count = some_columns.count
		end		
	
	for_each (a_test: FUNCTION[TUPLE[GTK_TREE_MODEL, GTK_TREE_PATH, GTK_TREE_ITER], BOOLEAN])
			-- Calls `a_test' on each node in model in a depth-first
			-- fashion. When `a_test' is True, then the tree ceases to
			-- be walked.		
		local a_path: GTK_TREE_PATH; an_iter: GTK_TREE_ITER; a_bool: BOOLEAN
		do
			-- Note: implementation paraphrased from the original C 
			create a_path.first
			an_iter := get_new_iterator (a_path)
			if an_iter = Void then a_path.dispose
			else
				a_bool:=for_each_helper(a_path,an_iter,a_test)
				-- for_each_helper ultimate result is thrown away
			end
		end

	row_changed (a_path: GTK_TREE_PATH; an_iter: GTK_TREE_ITER)
			-- Emits the "row_changed" signal on tree_model. `a_path'
			-- points to the changed row, `an_iter' is a valid
			-- GtkTreeIter pointing to the changed row
		require
			valid_path: a_path/=Void
			valid_iter: an_iter/=Void
			-- TODO: path_and_iter_refers_to_the_same_row
		do
			gtk_tree_model_row_changed (handle,a_path.handle,an_iter.handle)
		end

	row_inserted  (a_path: GTK_TREE_PATH; an_iter: GTK_TREE_ITER)
			-- Emits the "row_inserted" signal on Current GTK_TREE_MODEL;
			-- `a_path' points to the inserted row, `an_iter' is a valid
			-- GtkTreeIter pointing to the inserted row
		require
			valid_path: a_path/=Void
			valid_iter: an_iter/=Void
			-- TODO: path_and_iter_refers_to_the_same_row
		do
			gtk_tree_model_row_inserted (handle,a_path.handle,an_iter.handle)
		end

	row_has_child_toggled (a_path: GTK_TREE_PATH; an_iter: GTK_TREE_ITER)
			-- Emits the "row_has_child_toggled" signal on Current. This
			-- should be called by models after the child state of a node
			-- changes.
			
			-- `a_path' is a GtkTreePath pointing to the changed row
			
			-- `a_iter' is a valid GtkTreeIter pointing to the changed
			-- row		
		require
			valid_path: a_path/=Void
			valid_iter: an_iter/=Void
			-- TODO: path_and_iter_refers_to_the_same_row
		do
			gtk_tree_model_row_has_child_toggled (handle,a_path.handle,an_iter.handle)
		end

	row_deleted  (a_path: GTK_TREE_PATH)
			-- Emits the "row_deleted" signal on tree_model. This should
			-- be called by models after a row has been removed. The
			-- location pointed to by path should be the location that
			-- the row previously was at. It may not be a valid location
			-- anymore. `a_path' is a GtkTreePath pointing to the
			-- previous location of the deleted row.
		require valid_path: a_path/=Void
		do
			gtk_tree_model_row_deleted (handle, a_path.handle)
		end

	rows_reordered (a_path: GTK_TREE_PATH; an_iter: GTK_TREE_ITER; a_new_order: ARRAY[INTEGER])
			-- Emits the "rows_reordered" signal on tree_model. This
			-- should be called by models when their rows have been
			-- reordered.
			
			-- `a_path' is a GtkTreePath pointing to the tree node whose
			-- children have been reordered
			
			-- `an_iter' is a valid GtkTreeIter pointing to the node
			-- whose children have been reordered; Void if the depth of
			-- path is 0.
			
			-- a_new_order: an array of integers mapping the current
			-- position of each child to its old position before the
			-- re-ordering, i.e. new_order[newpos] = oldpos.
		require
			valid_path: a_path/=Void
			valid_order: a_new_order /= Void
		do
			if an_iter /= Void then
				gtk_tree_model_rows_reordered (handle, a_path.handle, an_iter.handle,
				                               a_new_order.to_external)
			else gtk_tree_model_rows_reordered (handle, a_path.handle, default_pointer,
			                                    a_new_order.to_external)
			end
		end

feature {ANY} -- The "row-changed" signal
	
	-- void user_function (GtkTreeModel *treemodel, GtkTreePath *arg1,
	-- GtkTreeIter *arg2, gpointer user_data) : Run last
	
	-- treemodel : 	the object which received the signal.
	-- arg1 : 	
	-- arg2 : 	
	-- user_data : 	user data set when the signal handler was
	--	connected.

	row_changed_signal_name: STRING is "row-changed"
	enable_on_row_changed
			-- Connects "row-changed" signal to `on_row_changed' feature.
		do
			connect (Current, row_changed_signal_name, $on_row_changed)
		end

	on_row_changed (a_path: GTK_TREE_PATH; an_iter: GTK_TREE_ITER)
			-- Built-in "row-changed" signal handler; empty by design;
			-- redefine it.
		do
		end

	connect_agent_to_row_changed_signal (a_procedure: PROCEDURE [ANY, TUPLE[GTK_TREE_MODEL,GTK_TREE_PATH,GTK_TREE_ITER]])
		require valid_procedure: a_procedure /= Void
		local
			row_changed_callback: ROW_CHANGED_CALLBACK
		do
			create row_changed_callback.make
			row_changed_callback.connect (Current, a_procedure)
		end

feature {ANY} -- The "row-deleted" signal

	row_deleted_signal_name: STRING is "row-deleted"
		-- void user_function (GtkTreeModel *treemodel, GtkTreePath
		-- *arg1, gpointer user_data) : Run first

	on_row_deleted
			-- Built-in row_deleted signal handler; empty by design; redefine it.
		do
		end

	enable_on_row_deleted
			-- Connects "row_deleted" signal to `on_row_deleted' feature.
		do
			connect (Current, row_deleted_signal_name, $on_row_deleted)
		end

	connect_agent_to_row_deleted_signal (a_procedure: PROCEDURE [ANY,
		                                                          TUPLE[GTK_TREE_PATH, GTK_TREE_MODEL]])
			-- treemodel : 	the object which received the signal.
			-- arg1 : 	
			-- user_data : 	user data set when the signal handler was connected.
		require valid_procedure: a_procedure /= Void
		local row_deleted_callback: ROW_DELETED_CALLBACK
		do
			create row_deleted_callback.make
			row_deleted_callback.connect (Current, a_procedure)
		end

feature {ANY} -- TODO:  "row-has-child-toggled" signal
	row_has_child_toggled_signal_name: STRING is "row-has-child-toggled"
			-- void user_function (GtkTreeModel *treemodel, GtkTreePath
			-- *arg1, GtkTreeIter *arg2, gpointer user_data) : Run last

	on_row_has_child_toggled
			-- Built-in row_has_child_toggled signal handler; empty by design; redefine it.
		do
		end

	enable_on_row_has_child_toggled
			-- Connects "row_has_child_toggled" signal to `on_row_has_child_toggled' feature.
		do
			connect (Current, row_has_child_toggled_signal_name, $on_row_has_child_toggled)
		end
	connect_agent_to_row_has_child_toggled_signal (a_procedure: PROCEDURE [ANY, TUPLE[GTK_TREE_MODEL, GTK_TREE_PATH, GTK_TREE_ITER]])
			-- treemodel : 	the object which received the signal.
			-- arg1 : 	
			-- user_data : 	user data set when the signal handler was connected.
		require valid_procedure: a_procedure /= Void
		local row_has_child_toggled_callback: ROW_HAS_CHILD_TOGGLED_CALLBACK
		do
			create row_has_child_toggled_callback.make
			row_has_child_toggled_callback.connect (Current, a_procedure)
		end

feature {ANY} -- The "row-inserted" signal

	row_inserted_signal_name: STRING is "row-inserted"
		-- "row-inserted"
		-- void        user_function                  (GtkTreeModel *treemodel,
		--                                             GtkTreePath  *arg1,
		--                                             GtkTreeIter  *arg2,
		--                                             gpointer      user_data)      : Run first

	on_row_inserted
			-- Built-in row_inserted signal handler; empty by design; redefine it.
		do
		end

	enable_on_row_inserted
			-- Connects "row_inserted" signal to `on_row_inserted' feature.
		do
			connect (Current, row_inserted_signal_name, $on_row_inserted)
		end

	connect_agent_to_row_inserted_signal (a_procedure: PROCEDURE [ANY,
		                                                          TUPLE[GTK_TREE_PATH, GTK_TREE_ITER, GTK_TREE_MODEL]])
			-- treemodel : 	the object which received the signal.
			-- arg1 : 	
			-- arg2 : 	
			-- user_data : 	user data set when the signal handler was connected.
		require valid_procedure: a_procedure /= Void
		local row_inserted_callback: ROW_INSERTED_CALLBACK
		do
			create row_inserted_callback.make
			row_inserted_callback.connect (Current, a_procedure)
		end

feature {ANY} -- The "rows-reordered" signal

-- void        user_function                  (GtkTreeModel *treemodel,
--                                             GtkTreePath  *arg1,
--                                             GtkTreeIter  *arg2,
--                                             gpointer      arg3,
--                                             gpointer      user_data)      : Run first

-- treemodel : 	the object which received the signal.
-- arg1 : 	
-- arg2 : 	
-- arg3 : 	
-- user_data : 	user data set when the signal handler was connected.

feature {} -- Moved here from top - unwrapped code 

-- GtkTreeModel

-- typedef struct _GtkTreeModel GtkTreeModel;

-- GtkTreeIter

-- typedef struct {
--   gint stamp;
--   gpointer user_data;
--   gpointer user_data2;
--   gpointer user_data3;
-- } GtkTreeIter;

-- The GtkTreeIter is the primary structure for accessing a structure. Models are expected to put a unique integer in the stamp member, and put model-specific data in the three user_data members.
-- gint stamp; 	A unique stamp to catch invalid iterators
-- gpointer user_data; 	Model specific data
-- gpointer user_data2; 	Model specific data
-- gpointer user_data3; 	Model specific data
-- GtkTreePath

-- typedef struct _GtkTreePath GtkTreePath;

-- GtkTreeRowReference

-- typedef struct _GtkTreeRowReference GtkTreeRowReference;

-- GtkTreeModelIface

-- typedef struct {
--   GTypeInterface g_iface;

--   /* Signals */
--   void         (* row_changed)           (GtkTreeModel *tree_model,
-- 					  GtkTreePath  *path,
-- 					  GtkTreeIter  *iter);
--   void         (* row_inserted)          (GtkTreeModel *tree_model,
-- 					  GtkTreePath  *path,
-- 					  GtkTreeIter  *iter);
--   void         (* row_has_child_toggled) (GtkTreeModel *tree_model,
-- 					  GtkTreePath  *path,
-- 					  GtkTreeIter  *iter);
--   void         (* row_deleted)           (GtkTreeModel *tree_model,
-- 					  GtkTreePath  *path);
--   void         (* rows_reordered)        (GtkTreeModel *tree_model,
-- 					  GtkTreePath  *path,
-- 					  GtkTreeIter  *iter,
-- 					  gint         *new_order);

--   /* Virtual Table */
--   GtkTreeModelFlags (* get_flags)  (GtkTreeModel *tree_model);   

--   gint         (* get_n_columns)   (GtkTreeModel *tree_model);
--   GType        (* get_column_type) (GtkTreeModel *tree_model,
-- 				    gint          index_);
--   gboolean     (* get_iter)        (GtkTreeModel *tree_model,
-- 				    GtkTreeIter  *iter,
-- 				    GtkTreePath  *path);
--   GtkTreePath *(* get_path)        (GtkTreeModel *tree_model,
-- 				    GtkTreeIter  *iter);
--   void         (* get_value)       (GtkTreeModel *tree_model,
-- 				    GtkTreeIter  *iter,
-- 				    gint          column,
-- 				    GValue       *value);
--   gboolean     (* iter_next)       (GtkTreeModel *tree_model,
-- 				    GtkTreeIter  *iter);
--   gboolean     (* iter_children)   (GtkTreeModel *tree_model,
-- 				    GtkTreeIter  *iter,
-- 				    GtkTreeIter  *parent);
--   gboolean     (* iter_has_child)  (GtkTreeModel *tree_model,
-- 				    GtkTreeIter  *iter);
--   gint         (* iter_n_children) (GtkTreeModel *tree_model,
-- 				    GtkTreeIter  *iter);
--   gboolean     (* iter_nth_child)  (GtkTreeModel *tree_model,
-- 				    GtkTreeIter  *iter,
-- 				    GtkTreeIter  *parent,
-- 				    gint          n);
--   gboolean     (* iter_parent)     (GtkTreeModel *tree_model,
-- 				    GtkTreeIter  *iter,
-- 				    GtkTreeIter  *child);
--   void         (* ref_node)        (GtkTreeModel *tree_model,
-- 				    GtkTreeIter  *iter);
--   void         (* unref_node)      (GtkTreeModel *tree_model,
-- 				    GtkTreeIter  *iter);
-- } GtkTreeModelIface;

feature {} -- Implementation
	for_each_helper (a_path: GTK_TREE_PATH; an_iter: GTK_TREE_ITER; 
						  a_test: FUNCTION[TUPLE[GTK_TREE_MODEL, GTK_TREE_PATH, GTK_TREE_ITER], BOOLEAN]): BOOLEAN
			-- Helper function of the `for_each' feature.

			-- Calls `a_test' on node referred by `an_iter' and `a_path',
			-- then recursively on all its children. When `a_test' is
			-- True, then the tree ceases to be walked.
		require
			iter_not_void: an_iter /= Void
			path_not_void: a_path /= Void
			test_not_void: a_test /= Void
			valid_iter: an_iter.is_valid
			-- TODO: iter and path refer the same node
		local a_child: GTK_TREE_ITER; continue: BOOLEAN
		do
			check Result_must_be_initially_false: Result=False end
			from 
			until Result = False and then an_iter.is_valid 
			loop
				Result := a_test.item([Current, a_path, an_iter])

				if not Result and then an_iter.has_children then
					create a_child.as_children_of(an_iter)
					a_path.down
					Result:= for_each_helper (a_path, a_child, a_test)
					a_path.up
				end
				a_path.next
				an_iter.next
			end
		end
end
