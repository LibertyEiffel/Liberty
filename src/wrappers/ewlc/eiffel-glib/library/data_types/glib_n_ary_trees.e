note
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class GLIB_N_ARY_TREES
	-- Prev 	Up 	Home 	GLib Reference Manual 	Next
-- Top  |  Description
-- N-ary Trees

-- N-ary Trees %GÅ‚Äî%@ trees of data with any number of branches.
	
-- Synopsis

-- #include <glib.h>


--             GNode;
-- GNode*      g_node_new                      (gpointer data);
-- GNode*      g_node_copy                     (GNode *node);
-- gpointer    (*GCopyFunc)                    (gconstpointer src,
--                                              gpointer data);
-- GNode*      g_node_copy_deep                (GNode *node,
--                                              GCopyFunc copy_func,
--                                              gpointer data);

-- GNode*      g_node_insert                   (GNode *parent,
--                                              gint position,
--                                              GNode *node);
-- GNode*      g_node_insert_before            (GNode *parent,
--                                              GNode *sibling,
--                                              GNode *node);
-- GNode*      g_node_insert_after             (GNode *parent,
--                                              GNode *sibling,
--                                              GNode *node);
-- #define     g_node_append                   (parent, node)
-- GNode*      g_node_prepend                  (GNode *parent,
--                                              GNode *node);

-- #define     g_node_insert_data              (parent, position, data)
-- #define     g_node_insert_data_before       (parent, sibling, data)
-- #define     g_node_append_data              (parent, data)
-- #define     g_node_prepend_data             (parent, data)

-- void        g_node_reverse_children         (GNode *node);
-- void        g_node_traverse                 (GNode *root,
--                                              GTraverseType order,
--                                              GTraverseFlags flags,
--                                              gint max_depth,
--                                              GNodeTraverseFunc func,
--                                              gpointer data);
-- enum        GTraverseFlags;
-- gboolean    (*GNodeTraverseFunc)            (GNode *node,
--                                              gpointer data);
-- void        g_node_children_foreach         (GNode *node,
--                                              GTraverseFlags flags,
--                                              GNodeForeachFunc func,
--                                              gpointer data);
-- void        (*GNodeForeachFunc)             (GNode *node,
--                                              gpointer data);

-- GNode*      g_node_get_root                 (GNode *node);
-- GNode*      g_node_find                     (GNode *root,
--                                              GTraverseType order,
--                                              GTraverseFlags flags,
--                                              gpointer data);
-- GNode*      g_node_find_child               (GNode *node,
--                                              GTraverseFlags flags,
--                                              gpointer data);
-- gint        g_node_child_index              (GNode *node,
--                                              gpointer data);
-- gint        g_node_child_position           (GNode *node,
--                                              GNode *child);
-- #define     g_node_first_child              (node)
-- GNode*      g_node_last_child               (GNode *node);
-- GNode*      g_node_nth_child                (GNode *node,
--                                              guint n);
-- GNode*      g_node_first_sibling            (GNode *node);
-- #define     g_node_next_sibling             (node)
-- #define     g_node_prev_sibling             (node)
-- GNode*      g_node_last_sibling             (GNode *node);

-- #define     G_NODE_IS_LEAF                  (node)
-- #define     G_NODE_IS_ROOT                  (node)
-- guint       g_node_depth                    (GNode *node);
-- guint       g_node_n_nodes                  (GNode *root,
--                                              GTraverseFlags flags);
-- guint       g_node_n_children               (GNode *node);
-- gboolean    g_node_is_ancestor              (GNode *node,
--                                              GNode *descendant);
-- guint       g_node_max_height               (GNode *root);

-- void        g_node_unlink                   (GNode *node);
-- void        g_node_destroy                  (GNode *root);

-- void        g_node_push_allocator           (GAllocator *allocator);
-- void        g_node_pop_allocator            (void);

-- Description

-- The GNode struct and its associated functions provide a N-ary tree data structure, where nodes in the tree can contain arbitrary data.

-- To create a new tree use g_node_new().

-- To insert a node into a tree use g_node_insert(), g_node_insert_before(), g_node_append() and g_node_prepend().

-- To create a new node and insert it into a tree use g_node_insert_data(), g_node_insert_data_before(), g_node_append_data() and g_node_prepend_data().

-- To reverse the children of a node use g_node_reverse_children().

-- To find a node use g_node_get_root(), g_node_find(), g_node_find_child(), g_node_child_index(), g_node_child_position(), g_node_first_child(), g_node_last_child(), g_node_nth_child(), g_node_first_sibling(), g_node_prev_sibling(), g_node_next_sibling() or g_node_last_sibling().

-- To get information about a node or tree use G_NODE_IS_LEAF(), G_NODE_IS_ROOT(), g_node_depth(), g_node_n_nodes(), g_node_n_children(), g_node_is_ancestor() or g_node_max_height().

-- To traverse a tree, calling a function for each node visited in the traversal, use g_node_traverse() or g_node_children_foreach().

-- To remove a node or subtree from a tree use g_node_unlink() or g_node_destroy().
-- Details
-- GNode

-- typedef struct {
--   gpointer data;
--   GNode	  *next;
--   GNode	  *prev;
--   GNode	  *parent;
--   GNode	  *children;
-- } GNode;

-- The GNode struct represents one node in a N-ary Tree. The data field contains the actual data of the node. The next and prev fields point to the node's siblings (a sibling is another GNode with the same parent). The parent field points to the parent of the GNode, or is NULL if the GNode is the root of the tree. The children field points to the first child of the GNode. The other children are accessed by using the next pointer of each child.
-- g_node_new ()

-- GNode*      g_node_new                      (gpointer data);

-- Creates a new GNode containing the given data. Used to create the first node in a tree.
-- data : 	the data of the new node.
-- Returns : 	a new GNode.
-- g_node_copy ()

-- GNode*      g_node_copy                     (GNode *node);

-- Recursively copies a GNode (but does not deep-copy the data inside the nodes, see g_node_copy_deep() if you need that).
-- node : 	a GNode.
-- Returns : 	a new GNode containing the same data pointers.
-- GCopyFunc ()

-- gpointer    (*GCopyFunc)                    (gconstpointer src,
--                                              gpointer data);

-- A function of this signature is used to copy the node data when doing a deep-copy of a tree.
-- src : 	A pointer to the data which should be copied.
-- data : 	Additional data.
-- Returns : 	A pointer to the copy.

-- Since 2.4
-- g_node_copy_deep ()

-- GNode*      g_node_copy_deep                (GNode *node,
--                                              GCopyFunc copy_func,
--                                              gpointer data);

-- Recursively copies a GNode and its data.

-- node : 	a GNode
-- copy_func : 	the function which is called to copy the data inside each node, or NULL to use the original data.
-- data : 	data to pass to copy_func
-- Returns : 	a new GNode containing copies of the data in node.

-- Since 2.4
-- g_node_insert ()

-- GNode*      g_node_insert                   (GNode *parent,
--                                              gint position,
--                                              GNode *node);

-- Inserts a GNode beneath the parent at the given position.
-- parent : 	the GNode to place node under.
-- position : 	the position to place node at, with respect to its siblings. If position is -1, node is inserted as the last child of parent.
-- node : 	the GNode to insert.
-- Returns : 	the inserted GNode.
-- g_node_insert_before ()

-- GNode*      g_node_insert_before            (GNode *parent,
--                                              GNode *sibling,
--                                              GNode *node);

-- Inserts a GNode beneath the parent before the given sibling.
-- parent : 	the GNode to place node under.
-- sibling : 	the sibling GNode to place node before. If sibling is NULL, the node is inserted as the last child of parent.
-- node : 	the GNode to insert.
-- Returns : 	the inserted GNode.
-- g_node_insert_after ()

-- GNode*      g_node_insert_after             (GNode *parent,
--                                              GNode *sibling,
--                                              GNode *node);

-- Inserts a GNode beneath the parent after the given sibling.
-- parent : 	the GNode to place node under.
-- sibling : 	the sibling GNode to place node after. If sibling is NULL, the node is inserted as the first child of parent.
-- node : 	the GNode to insert.
-- Returns : 	the inserted GNode.
-- g_node_append()

-- #define     g_node_append(parent, node)

-- Inserts a GNode as the last child of the given parent.
-- parent : 	the GNode to place the new GNode under.
-- node : 	the GNode to insert.
-- Returns : 	the inserted GNode.
-- g_node_prepend ()

-- GNode*      g_node_prepend                  (GNode *parent,
--                                              GNode *node);

-- Inserts a GNode as the first child of the given parent.
-- parent : 	the GNode to place the new GNode under.
-- node : 	the GNode to insert.
-- Returns : 	the inserted GNode.
-- g_node_insert_data()

-- #define     g_node_insert_data(parent, position, data)

-- Inserts a new GNode at the given position.
-- parent : 	the GNode to place the new GNode under.
-- position : 	the position to place the new GNode at. If position is -1, the new GNode is inserted as the last child of parent.
-- data : 	the data for the new GNode.
-- Returns : 	the new GNode.
-- g_node_insert_data_before()

-- #define     g_node_insert_data_before(parent, sibling, data)

-- Inserts a new GNode before the given sibling.
-- parent : 	the GNode to place the new GNode under.
-- sibling : 	the sibling GNode to place the new GNode before.
-- data : 	the data for the new GNode.
-- Returns : 	the new GNode.
-- g_node_append_data()

-- #define     g_node_append_data(parent, data)

-- Inserts a new GNode as the last child of the given parent.
-- parent : 	the GNode to place the new GNode under.
-- data : 	the data for the new GNode.
-- Returns : 	the new GNode.
-- g_node_prepend_data()

-- #define     g_node_prepend_data(parent, data)

-- Inserts a new GNode as the first child of the given parent.
-- parent : 	the GNode to place the new GNode under.
-- data : 	the data for the new GNode.
-- Returns : 	the new GNode.
-- g_node_reverse_children ()

-- void        g_node_reverse_children         (GNode *node);

-- Reverses the order of the children of a GNode. (It doesn't change the order of the grandchildren.)
-- node : 	a GNode.
-- g_node_traverse ()

-- void        g_node_traverse                 (GNode *root,
--                                              GTraverseType order,
--                                              GTraverseFlags flags,
--                                              gint max_depth,
--                                              GNodeTraverseFunc func,
--                                              gpointer data);

-- Traverses a tree starting at the given root GNode. It calls the given function for each node visited. The traversal can be halted at any point by returning TRUE from func.
-- root : 	the root GNode of the tree to traverse.
-- order : 	the order in which nodes are visited - G_IN_ORDER, G_PRE_ORDER, G_POST_ORDER, or G_LEVEL_ORDER.
-- flags : 	which types of children are to be visited, one of G_TRAVERSE_ALL, G_TRAVERSE_LEAVES and G_TRAVERSE_NON_LEAVES.
-- max_depth : 	the maximum depth of the traversal. Nodes below this depth will not be visited. If max_depth is -1 all nodes in the tree are visited. If depth is 1, only the root is visited. If depth is 2, the root and its children are visited. And so on.
-- func : 	the function to call for each visited GNode.
-- data : 	user data to pass to the function.
-- enum GTraverseFlags

-- typedef enum
-- {
--   G_TRAVERSE_LEAVES     = 1 << 0,
--   G_TRAVERSE_NON_LEAVES = 1 << 1,
--   G_TRAVERSE_ALL        = G_TRAVERSE_LEAVES | G_TRAVERSE_NON_LEAVES,
--   G_TRAVERSE_MASK       = 0x03,
--   G_TRAVERSE_LEAFS      = G_TRAVERSE_LEAVES,
--   G_TRAVERSE_NON_LEAFS  = G_TRAVERSE_NON_LEAVES
-- } GTraverseFlags;

-- Specifies which nodes are visited during several of the tree functions, including g_node_traverse() and g_node_find().
-- G_TRAVERSE_LEAVES 	only leaf nodes should be visited. This name has been introduced in 2.6, for older version use G_TRAVERSE_LEAFS.
-- G_TRAVERSE_NON_LEAVES 	only non-leaf nodes should be visited. This name has been introduced in 2.6, for older version use G_TRAVERSE_NON_LEAFS.
-- G_TRAVERSE_ALL 	all nodes should be visited.
-- G_TRAVERSE_MASK 	
-- G_TRAVERSE_LEAFS 	identical to G_TRAVERSE_LEAVES
-- G_TRAVERSE_NON_LEAFS 	identical to G_TRAVERSE_NON_LEAVES
-- GNodeTraverseFunc ()

-- gboolean    (*GNodeTraverseFunc)            (GNode *node,
--                                              gpointer data);

-- Specifies the type of function passed to g_node_traverse(). The function is called with each of the nodes visited, together with the user data passed to g_node_traverse(). If the function returns TRUE, then the traversal is stopped.
-- node : 	a GNode.
-- data : 	user data passed to g_node_traverse().
-- Returns : 	TRUE to stop the traversal.
-- g_node_children_foreach ()

-- void        g_node_children_foreach         (GNode *node,
--                                              GTraverseFlags flags,
--                                              GNodeForeachFunc func,
--                                              gpointer data);

-- Calls a function for each of the children of a GNode. Note that it doesn't descend beneath the child nodes.
-- node : 	a GNode.
-- flags : 	which types of children are to be visited, one of G_TRAVERSE_ALL, G_TRAVERSE_LEAVES and G_TRAVERSE_NON_LEAVES.
-- func : 	the function to call for each visited node.
-- data : 	user data to pass to the function.
-- GNodeForeachFunc ()

-- void        (*GNodeForeachFunc)             (GNode *node,
--                                              gpointer data);

-- Specifies the type of function passed to g_node_children_foreach(). The function is called with each child node, together with the user data passed to g_node_children_foreach().
-- node : 	a GNode.
-- data : 	user data passed to g_node_children_foreach().
-- g_node_get_root ()

-- GNode*      g_node_get_root                 (GNode *node);

-- Gets the root of a tree.
-- node : 	a GNode.
-- Returns : 	the root of the tree.
-- g_node_find ()

-- GNode*      g_node_find                     (GNode *root,
--                                              GTraverseType order,
--                                              GTraverseFlags flags,
--                                              gpointer data);

-- Finds a GNode in a tree.
-- root : 	the root GNode of the tree to search.
-- order : 	the order in which nodes are visited - G_IN_ORDER, G_PRE_ORDER, G_POST_ORDER, or G_LEVEL_ORDER.
-- flags : 	which types of children are to be searched, one of G_TRAVERSE_ALL, G_TRAVERSE_LEAVES and G_TRAVERSE_NON_LEAVES.
-- data : 	the data to find.
-- Returns : 	the found GNode, or NULL if the data is not found.
-- g_node_find_child ()

-- GNode*      g_node_find_child               (GNode *node,
--                                              GTraverseFlags flags,
--                                              gpointer data);

-- Finds the first child of a GNode with the given data.
-- node : 	a GNode.
-- flags : 	which types of children are to be searched, one of G_TRAVERSE_ALL, G_TRAVERSE_LEAVES and G_TRAVERSE_NON_LEAVES.
-- data : 	the data to find.
-- Returns : 	the found child GNode, or NULL if the data is not found.
-- g_node_child_index ()

-- gint        g_node_child_index              (GNode *node,
--                                              gpointer data);

-- Gets the position of the first child of a GNode which contains the given data.
-- node : 	a GNode.
-- data : 	the data to find.
-- Returns : 	the index of the child of node which contains data, or -1 if the data is not found.
-- g_node_child_position ()

-- gint        g_node_child_position           (GNode *node,
--                                              GNode *child);

-- Gets the position of a GNode with respect to its siblings. child must be a child of node. The first child is numbered 0, the second 1, and so on.
-- node : 	a GNode.
-- child : 	a child of node.
-- Returns : 	the position of child with respect to its siblings.
-- g_node_first_child()

-- #define     g_node_first_child(node)

-- Gets the first child of a GNode.
-- node : 	a GNode.
-- Returns : 	the last child of node, or NULL if node is NULL or has no children.
-- g_node_last_child ()

-- GNode*      g_node_last_child               (GNode *node);

-- Gets the last child of a GNode.
-- node : 	a GNode (must not be NULL).
-- Returns : 	the last child of node, or NULL if node has no children.
-- g_node_nth_child ()

-- GNode*      g_node_nth_child                (GNode *node,
--                                              guint n);

-- Gets a child of a GNode, using the given index. The first child is at index 0. If the index is too big, NULL is returned.
-- node : 	a GNode.
-- n : 	the index of the desired child.
-- Returns : 	the child of node at index n.
-- g_node_first_sibling ()

-- GNode*      g_node_first_sibling            (GNode *node);

-- Gets the first sibling of a GNode. This could possibly be the node itself.
-- node : 	a GNode.
-- Returns : 	the first sibling of node.
-- g_node_next_sibling()

-- #define     g_node_next_sibling(node)

-- Gets the next sibling of a GNode.
-- node : 	a GNode.
-- Returns : 	the next sibling of node, or NULL if node is NULL.
-- g_node_prev_sibling()

-- #define     g_node_prev_sibling(node)

-- Gets the previous sibling of a GNode.
-- node : 	a GNode.
-- Returns : 	the previous sibling of node, or NULL if node is NULL.
-- g_node_last_sibling ()

-- GNode*      g_node_last_sibling             (GNode *node);

-- Gets the last sibling of a GNode. This could possibly be the node itself.
-- node : 	a GNode.
-- Returns : 	the last sibling of node.
-- G_NODE_IS_LEAF()

-- #define	 G_NODE_IS_LEAF(node)	(((GNode*) (node))->children == NULL)

-- Returns TRUE if a GNode is a leaf node.
-- node : 	a GNode.
-- Returns : 	TRUE if the GNode is a leaf node (i.e. it has no children).
-- G_NODE_IS_ROOT()

-- #define     G_NODE_IS_ROOT(node)

-- Returns TRUE if a GNode is the root of a tree.
-- node : 	a GNode.
-- Returns : 	TRUE if the GNode is the root of a tree (i.e. it has no parent or siblings).
-- g_node_depth ()

-- guint       g_node_depth                    (GNode *node);

-- Gets the depth of a GNode.

-- If node is NULL the depth is 0. The root node has a depth of 1. For the children of the root node the depth is 2. And so on.
-- node : 	a GNode.
-- Returns : 	the depth of the GNode.
-- g_node_n_nodes ()

-- guint       g_node_n_nodes                  (GNode *root,
--                                              GTraverseFlags flags);

-- Gets the number of nodes in a tree.
-- root : 	a GNode.
-- flags : 	which types of children are to be counted, one of G_TRAVERSE_ALL, G_TRAVERSE_LEAVES and G_TRAVERSE_NON_LEAVES.
-- Returns : 	the number of nodes in the tree.
-- g_node_n_children ()

-- guint       g_node_n_children               (GNode *node);

-- Gets the number of children of a GNode.
-- node : 	a GNode.
-- Returns : 	the number of children of node.
-- g_node_is_ancestor ()

-- gboolean    g_node_is_ancestor              (GNode *node,
--                                              GNode *descendant);

-- Returns TRUE if node is an ancestor of descendant. This is true if node is the parent of descendant, or if node is the grandparent of descendant etc.
-- node : 	a GNode.
-- descendant : 	a GNode.
-- Returns : 	TRUE if node is an ancestor of descendant.
-- g_node_max_height ()

-- guint       g_node_max_height               (GNode *root);

-- Gets the maximum height of all branches beneath a GNode. This is the maximum distance from the GNode to all leaf nodes.

-- If root is NULL, 0 is returned. If root has no children, 1 is returned. If root has children, 2 is returned. And so on.
-- root : 	a GNode.
-- Returns : 	the maximum height of the tree beneath root.
-- g_node_unlink ()

-- void        g_node_unlink                   (GNode *node);

-- Unlinks a GNode from a tree, resulting in two separate trees.
-- node : 	the GNode to unlink, which becomes the root of a new tree.
-- g_node_destroy ()

-- void        g_node_destroy                  (GNode *root);

-- Removes the GNode and its children from the tree, freeing any memory allocated.
-- root : 	the root of the tree/subtree to destroy.
-- g_node_push_allocator ()

-- void        g_node_push_allocator           (GAllocator *allocator);

-- Sets the allocator to use to allocate GNode elements. Use g_node_pop_allocator() to restore the previous allocator.

-- Note that this function is not available if GLib has been compiled with --disable-mem-pools
-- allocator : 	the GAllocator to use when allocating GNode elements.
-- g_node_pop_allocator ()

-- void        g_node_pop_allocator            (void);

-- Restores the previous GAllocator, used when allocating GNode elements.

-- Note that this function is not available if GLib has been compiled with --disable-mem-pools
end
										 
