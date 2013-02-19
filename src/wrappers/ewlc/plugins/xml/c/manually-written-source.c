inline xmlChar *xml_node_get_name (xmlNode *a_node) {
	return a_node->name;
}

inline xmlNode *xml_node_get_children (xmlNode *a_node) {
	return a_node->children;
}

inline xmlNode *xml_node_get_last (xmlNode *a_node) {
	return a_node->last;
}

inline xmlNode *xml_node_get_parent (xmlNode *a_node) {
	return a_node->parent;
}

inline xmlNode *xml_node_get_next (xmlNode *a_node) {
	return a_node->next;
}

inline xmlNode *xml_node_get_prev (xmlNode *a_node) {
	return a_node->prev;
}


