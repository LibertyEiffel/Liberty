indexing
	description: "Access to GdaParameterListGroup C structure"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GDA_PARAMETER_LIST_GROUP_STRUCT

inherit ANY undefine is_equal, copy end


feature {} -- Structure getter/setter c

	-- typedef struct {
	-- 	GSList                 *nodes;        /* list of GdaParameterListNode, at least one entry */
	-- 	GdaParameterListSource *nodes_source; /* if NULL, then @nodes contains exactly one entry */
	-- } GdaParameterListGroup;
	
	get_nodes (a_struct: POINTER): POINTER is
		external "C struct GdaParameterListGroup get nodes use <libgda/libgda.h>"
		end

	set_nodes (a_struct: POINTER; a_nodes: POINTER) is
		external "C struct GdaParameterListGroup set nodes use <libgda/libgda.h>"
		end

	get_nodes_source (a_struct: POINTER): POINTER is
		external "C struct GdaParameterListGroup get nodes_source use <libgda/libgda.h>"
		end

	set_nodes_source (a_struct: POINTER; a_nodes_source: POINTER) is
		external "C struct GdaParameterListGroup set nodes_source use <libgda/libgda.h>"
		end

feature {} -- size
	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaParameterListGroup)"
		end

end
