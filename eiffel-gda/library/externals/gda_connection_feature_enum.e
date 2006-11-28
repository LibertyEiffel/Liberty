indexing
	description: "enum GdaConnectionFeature"
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team, GTK+ team
					
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

deferred class GDA_CONNECTION_FEATURE_ENUM

inherit ANY undefine is_equal, copy end


feature {} -- enum
	is_valid_connection_feature (a_feature :INTEGER): BOOLEAN is
		do	
			Result:=((a_feature = gda_connection_feature_aggregates) or else
						(a_feature = gda_connection_feature_blobs) or else
						(a_feature = gda_connection_feature_indexes) or else
						(a_feature = gda_connection_feature_inheritance) or else
						(a_feature = gda_connection_feature_namespaces) or else
						(a_feature = gda_connection_feature_procedures) or else
						(a_feature = gda_connection_feature_sequences) or else
						(a_feature = gda_connection_feature_sql) or else
						(a_feature = gda_connection_feature_transactions) or else
						(a_feature = gda_connection_feature_triggers) or else
						(a_feature = gda_connection_feature_updatable_cursor) or else
						(a_feature = gda_connection_feature_users) or else
						(a_feature = gda_connection_feature_views) or else
						(a_feature = gda_connection_feature_xml_queries))
		end

	gda_connection_feature_aggregates: INTEGER is
      external "C macro use <libgda/libgda.h>"
      alias "GDA_CONNECTION_FEATURE_AGGREGATES"
      end
	
	gda_connection_feature_blobs: INTEGER is
      external "C macro use <libgda/libgda.h>"
      alias "GDA_CONNECTION_FEATURE_BLOBS"
      end
	
	gda_connection_feature_indexes: INTEGER is
      external "C macro use <libgda/libgda.h>"
      alias "GDA_CONNECTION_FEATURE_INDEXES"
      end
	
	gda_connection_feature_inheritance: INTEGER is
      external "C macro use <libgda/libgda.h>"
      alias "GDA_CONNECTION_FEATURE_INHERITANCE"
      end
	
	gda_connection_feature_namespaces: INTEGER is
      external "C macro use <libgda/libgda.h>"
      alias "GDA_CONNECTION_FEATURE_NAMESPACES"
      end
	
	gda_connection_feature_procedures: INTEGER is
      external "C macro use <libgda/libgda.h>"
      alias "GDA_CONNECTION_FEATURE_PROCEDURES"
      end
	
	gda_connection_feature_sequences: INTEGER is
      external "C macro use <libgda/libgda.h>"
      alias "GDA_CONNECTION_FEATURE_SEQUENCES"
      end
	
	gda_connection_feature_sql: INTEGER is
      external "C macro use <libgda/libgda.h>"
      alias "GDA_CONNECTION_FEATURE_SQL"
      end
	
	gda_connection_feature_transactions: INTEGER is
      external "C macro use <libgda/libgda.h>"
      alias "GDA_CONNECTION_FEATURE_TRANSACTIONS"
      end
	
	gda_connection_feature_triggers: INTEGER is
      external "C macro use <libgda/libgda.h>"
      alias "GDA_CONNECTION_FEATURE_TRIGGERS"
      end
	
	gda_connection_feature_updatable_cursor: INTEGER is
      external "C macro use <libgda/libgda.h>"
      alias "GDA_CONNECTION_FEATURE_UPDATABLE_CURSOR"
      end
	
	gda_connection_feature_users: INTEGER is
      external "C macro use <libgda/libgda.h>"
      alias "GDA_CONNECTION_FEATURE_USERS"
      end
	
	gda_connection_feature_views: INTEGER is
      external "C macro use <libgda/libgda.h>"
      alias "GDA_CONNECTION_FEATURE_VIEWS"
      end
	
	gda_connection_feature_xml_queries: INTEGER is
      external "C macro use <libgda/libgda.h>"
      alias "GDA_CONNECTION_FEATURE_XML_QUERIES"
      end
end
