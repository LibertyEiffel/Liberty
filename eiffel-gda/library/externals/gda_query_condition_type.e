indexing
	description: "Enum "
	copyright: "[
					Copyright (C) 2007 $EWLC_developer, $original_copyright_holder
					
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

deferred class GDA_QUERY_CONDITION_TYPE

inherit ANY undefine is_equal, copy end

feature {} -- enum
	is_valid_condition_type (a_type: INTEGER): BOOLEAN is
		do	
			Result:=((a_type = gda_query_condition_node_and) or else
						(a_type = gda_query_condition_node_or) or else
						(a_type = gda_query_condition_node_not) or else
						(a_type = gda_query_condition_leaf_equal) or else
						(a_type = gda_query_condition_leaf_diff) or else
						(a_type = gda_query_condition_leaf_sup) or else
						(a_type = gda_query_condition_leaf_supequal) or else
						(a_type = gda_query_condition_leaf_inf) or else
						(a_type = gda_query_condition_leaf_infequal) or else
						(a_type = gda_query_condition_leaf_like) or else
						(a_type = gda_query_condition_leaf_similar) or else
						(a_type = gda_query_condition_leaf_regex) or else
						(a_type = gda_query_condition_leaf_regex_nocase) or else
						(a_type = gda_query_condition_leaf_not_regex) or else
						(a_type = gda_query_condition_leaf_not_regex_nocase) or else
						(a_type = gda_query_condition_leaf_in) or else
						(a_type = gda_query_condition_leaf_between) or else
						(a_type = gda_query_condition_type_unknown))
		end
	
	gda_query_condition_node_and: INTEGER is
			-- GDA_QUERY_CONDITION_NODE_AND
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_CONDITION_NODE_AND"
		end
	gda_query_condition_node_or: INTEGER is
			-- GDA_QUERY_CONDITION_NODE_OR
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_CONDITION_NODE_OR"
		end
	gda_query_condition_node_not: INTEGER is
			-- GDA_QUERY_CONDITION_NODE_NOT
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_CONDITION_NODE_NOT"
		end
	gda_query_condition_leaf_equal: INTEGER is
			-- GDA_QUERY_CONDITION_LEAF_EQUAL
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_CONDITION_LEAF_EQUAL"
		end
	gda_query_condition_leaf_diff: INTEGER is
			-- GDA_QUERY_CONDITION_LEAF_DIFF
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_CONDITION_LEAF_DIFF"
		end
	gda_query_condition_leaf_sup: INTEGER is
			-- GDA_QUERY_CONDITION_LEAF_SUP
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_CONDITION_LEAF_SUP"
		end
	gda_query_condition_leaf_supequal: INTEGER is
			-- GDA_QUERY_CONDITION_LEAF_SUPEQUAL
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_CONDITION_LEAF_SUPEQUAL"
		end
	gda_query_condition_leaf_inf: INTEGER is
			-- GDA_QUERY_CONDITION_LEAF_INF
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_CONDITION_LEAF_INF"
		end
	gda_query_condition_leaf_infequal: INTEGER is
			-- GDA_QUERY_CONDITION_LEAF_INFEQUAL
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_CONDITION_LEAF_INFEQUAL"
		end
	gda_query_condition_leaf_like: INTEGER is
			-- GDA_QUERY_CONDITION_LEAF_LIKE
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_CONDITION_LEAF_LIKE"
		end
	gda_query_condition_leaf_similar: INTEGER is
			-- GDA_QUERY_CONDITION_LEAF_SIMILAR
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_CONDITION_LEAF_SIMILAR"
		end
	gda_query_condition_leaf_regex: INTEGER is
			-- GDA_QUERY_CONDITION_LEAF_REGEX
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_CONDITION_LEAF_REGEX"
		end
	gda_query_condition_leaf_regex_nocase: INTEGER is
			-- GDA_QUERY_CONDITION_LEAF_REGEX_NOCASE
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_CONDITION_LEAF_REGEX_NOCASE"
		end
	gda_query_condition_leaf_not_regex: INTEGER is
			-- GDA_QUERY_CONDITION_LEAF_NOT_REGEX
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_CONDITION_LEAF_NOT_REGEX"
		end
	gda_query_condition_leaf_not_regex_nocase: INTEGER is
			-- GDA_QUERY_CONDITION_LEAF_NOT_REGEX_NOCASE
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_CONDITION_LEAF_NOT_REGEX_NOCASE"
		end
	gda_query_condition_leaf_in: INTEGER is
			-- GDA_QUERY_CONDITION_LEAF_IN
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_CONDITION_LEAF_IN"
		end
	gda_query_condition_leaf_between: INTEGER is
			-- GDA_QUERY_CONDITION_LEAF_BETWEEN
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_CONDITION_LEAF_BETWEEN"
		end
	gda_query_condition_type_unknown: INTEGER is
			-- GDA_QUERY_CONDITION_TYPE_UNKNOWN
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_CONDITION_TYPE_UNKNOWN"
		end
end
