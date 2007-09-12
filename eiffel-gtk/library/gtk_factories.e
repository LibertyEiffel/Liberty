indexing
	description: "Factories shares in eiffel-gtk"
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli
					
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

deferred class GTK_FACTORIES
	-- Some of the (Eiffel object) factories are shared here as
	-- singletons (once features)

inherit ANY undefine is_equal, copy end

feature {WRAPPER, WRAPPER_HANDLER} -- Shared factories
	cell_renderer_factory: G_OBJECT_FACTORY[GTK_CELL_RENDERER] is
		once
			create Result
		end

	filter_factory: G_OBJECT_FACTORY[GTK_FILE_FILTER] is
		once
			create Result
		end

	path_factory: ARCHETYPE_FACTORY[GTK_TREE_PATH] is
		once
			create Result.with_archetype(path_archetype)
		end	

	radio_action_factory: G_OBJECT_FACTORY[GTK_RADIO_ACTION] is
		once
			create Result
		end
	
	radio_button_factory: G_OBJECT_FACTORY[GTK_RADIO_BUTTON] is
		once
			create Result
		end
	
	radio_menu_item_factory: G_OBJECT_FACTORY[GTK_RADIO_MENU_ITEM] is
		once
			create Result
		end
		
	radio_tool_button_factory: G_OBJECT_FACTORY[GTK_RADIO_TOOL_BUTTON] is
		once
			create Result
		end
		
	-- text_iter_factory: ARCHETYPE_FACTORY[GTK_TEXT_ITER] is once
	-- create Result.with_archetype(text_iter_archetype) end

	text_mark_factory: G_OBJECT_FACTORY[GTK_TEXT_MARK] is
		once
			create Result
		end

	text_tag_factory: G_OBJECT_FACTORY[GTK_TEXT_TAG] is
		once
			create Result
		end

	tree_model_factory: G_OBJECT_FACTORY[GTK_TREE_MODEL] is
		once
			create Result
		end

	tree_view_column_factory: G_OBJECT_FACTORY[GTK_TREE_VIEW_COLUMN] is
		once
			create Result
		end

	widget_factory: G_OBJECT_FACTORY[GTK_WIDGET] is
		once
			create Result
		end

	window_factory: G_OBJECT_FACTORY[GTK_WINDOW] is
		once
			create Result
		end

feature -- Shared archetypes
	--text_iter_archetype: GTK_TEXT_ITER is do create Result.dummy end

	path_archetype: GTK_TREE_PATH is
		once
			create Result.make
		end
	
end -- class GTK_FACTORIES
