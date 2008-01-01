indexing
	description: "Enum "
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, GDA developers
					
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

deferred class GDA_RENDERER_OPTIONS

inherit ANY undefine is_equal, copy end

feature {} -- enum
	are_valid_renderer_options (some_options: INTEGER): BOOLEAN is
		do	
			Result:=(some_options & (gda_renderer_extra_pretty_sql |
											 gda_renderer_params_as_detailed |
											 gda_renderer_error_if_default |
											 gda_renderer_fields_no_target_alias |
											 gda_renderer_params_as_colon |
											 gda_renderer_params_as_dollar)).to_boolean
		end

	gda_renderer_extra_pretty_sql: INTEGER is
			-- GDA_RENDERER_EXTRA_PRETTY_SQL The rendered statement will output easy to read SQL
		external "C macro use <libgda/libgda.h>"
		alias "GDA_RENDERER_EXTRA_PRETTY_SQL"
		end

	gda_renderer_params_as_detailed: INTEGER is
			-- GDA_RENDERER_PARAMS_AS_DETAILED
		external "C macro use <libgda/libgda.h>"
		alias "GDA_RENDERER_PARAMS_AS_DETAILED"
		end

	gda_renderer_error_if_default: INTEGER is
			-- GDA_RENDERER_ERROR_IF_DEFAULT
		external "C macro use <libgda/libgda.h>"
		alias "GDA_RENDERER_ERROR_IF_DEFAULT"
		end

	gda_renderer_fields_no_target_alias: INTEGER is
			-- GDA_RENDERER_FIELDS_NO_TARGET_ALIAS
		external "C macro use <libgda/libgda.h>"
		alias "GDA_RENDERER_FIELDS_NO_TARGET_ALIAS"
		end

	gda_renderer_params_as_colon: INTEGER is
			-- GDA_RENDERER_PARAMS_AS_COLON params as :param_name 
		external "C macro use <libgda/libgda.h>"
		alias "GDA_RENDERER_PARAMS_AS_COLON"
		end

	gda_renderer_params_as_dollar: INTEGER is
			-- GDA_RENDERER_PARAMS_AS_DOLLAR params as $1, $2, etc (starts at $1) 
		external "C macro use <libgda/libgda.h>"
		alias "GDA_RENDERER_PARAMS_AS_DOLLAR"
		end
end
