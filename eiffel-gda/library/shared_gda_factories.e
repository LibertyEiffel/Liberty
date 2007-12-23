indexing
	description: "Shared object factories used by GDA wrapper"
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

deferred class SHARED_GDA_FACTORIES

insert ANY undefine copy, is_equal, fill_tagged_out_memory end

feature {} -- Factories
	gda_dict_aggregate_factory: G_OBJECT_FACTORY[GDA_DICT_AGGREGATE] is once create Result end
	gda_dict_constraint_factory: G_OBJECT_FACTORY[GDA_DICT_CONSTRAINT] is once create Result end
	gda_dict_database_factory: G_OBJECT_FACTORY[GDA_DICT_DATABASE] is once create Result end
	gda_dict_factory: G_OBJECT_FACTORY[GDA_DICT] is once create Result end
	gda_dict_field_factory: G_OBJECT_FACTORY[GDA_DICT_FIELD] is once create Result end
	gda_dict_function_factory: G_OBJECT_FACTORY[GDA_DICT_FUNCTION] is once create Result end
	gda_dict_table_factory: G_OBJECT_FACTORY[GDA_DICT_TABLE] is once create Result end
	gda_dict_type_factory: G_OBJECT_FACTORY[GDA_DICT_TYPE] is once create Result end

end -- class SHARED_GDA_FACTORIES


