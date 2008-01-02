indexing
	description: "GdaRenderer, an interface to get representations of objects as SQL statements, XML nodes or human readable text."
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

deferred class GDA_RENDERER
	-- GdaRenderer Interface to get representations of objects as SQL
	-- statements, XML nodes or human readable text

inherit G_OBJECT  undefine copy, is_equal end
	-- Known Implementations: GdaRenderer is implemented by
	-- GdaQueryFieldFunc, GdaQueryFieldAgg, GdaQueryFieldValue,
	-- GdaQueryCondition, GdaQueryFieldAll, GdaQueryTarget,
	-- GdaDictField, GdaQuery and GdaQueryFieldField.

insert 
	GDA_RENDERER_OPTIONS
	SHARED_G_ERROR

feature 
	as_sql (a_context: GDA_PARAMETER_LIST; some_options: INTEGER): STRING is
			-- An SQL statement representing the object, in the specified
			-- context.
	
			-- If `a_context' is NULL, then no error related to missing
			-- parameters (which should be in the context) is returned,
			-- and missing values are replaced by 'human readable' SQL.
			
			-- `error' is updated; Result can be Void.

			-- TODO: handle out parameters
		require valid_options: are_valid_renderer_options(some_options)
		local ptr: POINTER
		do
			-- If out_params_used is not NULL, then pointers to the
			-- GdaParameter objects used to actually render the SQL
			-- statement are appended to the list (in case a parameter
			-- object is used several times, it is only once listed in
			-- the resulting list).
		
			-- out_params_used : a place to append GdaParameter which
			-- have been used during the rendering process, or NULL

			ptr:=gda_renderer_render_as_sql(handle, null_or(a_context),
													  default_pointer, -- address_of(used_parameters.handle),
													  some_options, address_of(error.handle))
		end	

	as_str (a_context: GDA_PARAMETER_LIST): STRING is
			-- A human readable string representing the object, in `a_context'.
		require context_void: a_context/=Void
		do
			create Result.from_external(gda_renderer_render_as_str
												 (handle, a_context.handle))
		end

	is_valid (a_context: GDA_PARAMETER_LIST): BOOLEAN is
			-- Does Current have the necessary information in `a_context'
			-- to be rendered into a valid statement (which can be
			-- executed)? `error' is updated.
		do
			Result:=(gda_renderer_is_valid(handle, a_context.handle,
													 address_of(error.handle)).to_boolean)
		end

feature {} -- External calls
	gda_renderer_render_as_sql (a_iface, a_context, a_out_params_used: POINTER; some_options: INTEGER; an_error_ref: POINTER): POINTER is
			-- gchar* gda_renderer_render_as_sql (GdaRenderer *iface, GdaParameterList *context, GSList **out_params_used, GdaRendererOptions options, GError **error);
		external "C use <libgda/libgda.h>"
		end

	gda_renderer_render_as_str (a_iface, a_context: POINTER): POINTER is
			-- gchar* gda_renderer_render_as_str (GdaRenderer *iface, GdaParameterList *context);
		external "C use <libgda/libgda.h>"
		end

	gda_renderer_is_valid (an_iface, a_context, an_error_ref: POINTER) : INTEGER is
			-- gboolean gda_renderer_is_valid (GdaRenderer *iface, GdaParameterList *context, GError **error);
		external "C use <libgda/libgda.h>"
		end

end -- class GDA_RENDERER
