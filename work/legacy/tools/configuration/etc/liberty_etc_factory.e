-- This file is part of Liberty Eiffel.
--
-- Liberty Eiffel is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, version 3 of the License.
--
-- Liberty Eiffel is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with Liberty Eiffel.  If not, see <http://www.gnu.org/licenses/>.
--
class LIBERTY_ETC_FACTORY

inherit
   EIFFEL_NODE_FACTORY

create {LIBERTY_ETC}
   make

feature {EIFFEL_GRAMMAR}
   list (name: FIXED_STRING): EIFFEL_LIST_NODE
      local
         visitor: PROCEDURE[TUPLE[LIBERTY_ETC_VISITOR, LIBERTY_ETC_LIST]]
      do
         inspect
            name
         when "Environment_Variable*" then
            visitor := agent_environment_variable_list
         when "Cluster*" then
            visitor := agent_cluster_list
         when "Cluster_Configuration*" then
            visitor := agent_cluster_configuration_list
         when "Debug_Configuration*" then
            visitor := agent_debug_configuration_list
         when "Debug_Key+" then
            visitor := agent_debug_key_list
         when "Location+" then
            visitor := agent_location_list
         end
         create {LIBERTY_ETC_LIST} Result.make(name, visitor)
      end

   non_terminal (name: FIXED_STRING; names: TRAVERSABLE[FIXED_STRING]): EIFFEL_NON_TERMINAL_NODE
      local
         visitor: PROCEDURE[TUPLE[LIBERTY_ETC_VISITOR, LIBERTY_ETC_NON_TERMINAL]]
      do
         inspect
            name
         when "Master" then
            visitor := agent_master
         when "Cluster_Definition" then
            visitor := agent_cluster_definition
         when "Configure" then
            visitor := agent_configure
         when "Environment" then
            visitor := agent_environment
         when "Environment_Variable" then
            visitor := agent_environment_variable
         when "Clusters" then
            visitor := agent_clusters
         when "Cluster" then
            visitor := agent_cluster
         when "Version" then
            visitor := agent_version
         when "Needs" then
            visitor := agent_needs
         when "Cluster_Configuration" then
            visitor := agent_cluster_configuration
         when "Cluster_Constraints" then
            visitor := agent_cluster_constraints
         when "Cluster_Version_Constraint" then
            visitor := agent_cluster_version_constraint
         when "Version_Operator" then
            visitor := agent_version_operator
         when "Assertion" then
            visitor := agent_assertion
         when "Assertion_Level" then
            visitor := agent_assertion_level
         when "Debug" then
            visitor := agent_debug
         when "Debug_Configuration" then
            visitor := agent_debug_configuration
         when "Debug_Key" then
            visitor := agent_debug_key
         when "Concurrency" then
            visitor := agent_concurrency
         when "Locations" then
            visitor := agent_locations
         when "Location" then
            visitor := agent_location
         end
         create {LIBERTY_ETC_NON_TERMINAL} Result.make(name, names, visitor)
      end

   terminal (name: FIXED_STRING; image: EIFFEL_IMAGE): EIFFEL_TERMINAL_NODE
      do
         create {EIFFEL_TERMINAL_NODE_IMPL} Result.make(name, image)
      end

feature {}
   make
      do
      end

feature {} -- visitor agents
   agent_environment_variable_list: PROCEDURE[TUPLE[LIBERTY_ETC_VISITOR, LIBERTY_ETC_LIST]]
      once
         Result := agent {LIBERTY_ETC_VISITOR}.visit_environment_variable_list
      end

   agent_cluster_list: PROCEDURE[TUPLE[LIBERTY_ETC_VISITOR, LIBERTY_ETC_LIST]]
      once
         Result := agent {LIBERTY_ETC_VISITOR}.visit_cluster_list
      end

   agent_cluster_configuration_list: PROCEDURE[TUPLE[LIBERTY_ETC_VISITOR, LIBERTY_ETC_LIST]]
      once
         Result := agent {LIBERTY_ETC_VISITOR}.visit_cluster_configuration_list
      end

   agent_debug_configuration_list: PROCEDURE[TUPLE[LIBERTY_ETC_VISITOR, LIBERTY_ETC_LIST]]
      once
         Result := agent {LIBERTY_ETC_VISITOR}.visit_debug_configuration_list
      end

   agent_debug_key_list: PROCEDURE[TUPLE[LIBERTY_ETC_VISITOR, LIBERTY_ETC_LIST]]
      once
         Result := agent {LIBERTY_ETC_VISITOR}.visit_debug_key_list
      end

   agent_location_list: PROCEDURE[TUPLE[LIBERTY_ETC_VISITOR, LIBERTY_ETC_LIST]]
      once
         Result := agent {LIBERTY_ETC_VISITOR}.visit_location_list
      end

   agent_master: PROCEDURE[TUPLE[LIBERTY_ETC_VISITOR, LIBERTY_ETC_NON_TERMINAL]]
      once
         Result := agent {LIBERTY_ETC_VISITOR}.visit_master
      end

   agent_cluster_definition: PROCEDURE[TUPLE[LIBERTY_ETC_VISITOR, LIBERTY_ETC_NON_TERMINAL]]
      once
         Result := agent {LIBERTY_ETC_VISITOR}.visit_cluster_definition
      end

   agent_configure: PROCEDURE[TUPLE[LIBERTY_ETC_VISITOR, LIBERTY_ETC_NON_TERMINAL]]
      once
         Result := agent {LIBERTY_ETC_VISITOR}.visit_configure
      end

   agent_environment: PROCEDURE[TUPLE[LIBERTY_ETC_VISITOR, LIBERTY_ETC_NON_TERMINAL]]
      once
         Result := agent {LIBERTY_ETC_VISITOR}.visit_environment
      end

   agent_environment_variable: PROCEDURE[TUPLE[LIBERTY_ETC_VISITOR, LIBERTY_ETC_NON_TERMINAL]]
      once
         Result := agent {LIBERTY_ETC_VISITOR}.visit_environment_variable
      end

   agent_clusters: PROCEDURE[TUPLE[LIBERTY_ETC_VISITOR, LIBERTY_ETC_NON_TERMINAL]]
      once
         Result := agent {LIBERTY_ETC_VISITOR}.visit_clusters
      end

   agent_cluster: PROCEDURE[TUPLE[LIBERTY_ETC_VISITOR, LIBERTY_ETC_NON_TERMINAL]]
      once
         Result := agent {LIBERTY_ETC_VISITOR}.visit_cluster
      end

   agent_locations: PROCEDURE[TUPLE[LIBERTY_ETC_VISITOR, LIBERTY_ETC_NON_TERMINAL]]
      once
         Result := agent {LIBERTY_ETC_VISITOR}.visit_locations
      end

   agent_location: PROCEDURE[TUPLE[LIBERTY_ETC_VISITOR, LIBERTY_ETC_NON_TERMINAL]]
      once
         Result := agent {LIBERTY_ETC_VISITOR}.visit_location
      end

   agent_version: PROCEDURE[TUPLE[LIBERTY_ETC_VISITOR, LIBERTY_ETC_NON_TERMINAL]]
      once
         Result := agent {LIBERTY_ETC_VISITOR}.visit_version
      end

   agent_needs: PROCEDURE[TUPLE[LIBERTY_ETC_VISITOR, LIBERTY_ETC_NON_TERMINAL]]
      once
         Result := agent {LIBERTY_ETC_VISITOR}.visit_needs
      end

   agent_cluster_configuration: PROCEDURE[TUPLE[LIBERTY_ETC_VISITOR, LIBERTY_ETC_NON_TERMINAL]]
      once
         Result := agent {LIBERTY_ETC_VISITOR}.visit_cluster_configuration
      end

   agent_cluster_constraints: PROCEDURE[TUPLE[LIBERTY_ETC_VISITOR, LIBERTY_ETC_NON_TERMINAL]]
      once
         Result := agent {LIBERTY_ETC_VISITOR}.visit_cluster_constraints
      end

   agent_cluster_version_constraint: PROCEDURE[TUPLE[LIBERTY_ETC_VISITOR, LIBERTY_ETC_NON_TERMINAL]]
      once
         Result := agent {LIBERTY_ETC_VISITOR}.visit_cluster_version_constraint
      end

   agent_version_operator: PROCEDURE[TUPLE[LIBERTY_ETC_VISITOR, LIBERTY_ETC_NON_TERMINAL]]
      once
         Result := agent {LIBERTY_ETC_VISITOR}.visit_version_operator
      end

   agent_assertion: PROCEDURE[TUPLE[LIBERTY_ETC_VISITOR, LIBERTY_ETC_NON_TERMINAL]]
      once
         Result := agent {LIBERTY_ETC_VISITOR}.visit_assertion
      end

   agent_assertion_level: PROCEDURE[TUPLE[LIBERTY_ETC_VISITOR, LIBERTY_ETC_NON_TERMINAL]]
      once
         Result := agent {LIBERTY_ETC_VISITOR}.visit_assertion_level
      end

   agent_debug: PROCEDURE[TUPLE[LIBERTY_ETC_VISITOR, LIBERTY_ETC_NON_TERMINAL]]
      once
         Result := agent {LIBERTY_ETC_VISITOR}.visit_debug
      end

   agent_debug_configuration: PROCEDURE[TUPLE[LIBERTY_ETC_VISITOR, LIBERTY_ETC_NON_TERMINAL]]
      once
         Result := agent {LIBERTY_ETC_VISITOR}.visit_debug_configuration
      end

   agent_debug_key: PROCEDURE[TUPLE[LIBERTY_ETC_VISITOR, LIBERTY_ETC_NON_TERMINAL]]
      once
         Result := agent {LIBERTY_ETC_VISITOR}.visit_debug_key
      end

   agent_concurrency: PROCEDURE[TUPLE[LIBERTY_ETC_VISITOR, LIBERTY_ETC_NON_TERMINAL]]
      once
         Result := agent {LIBERTY_ETC_VISITOR}.visit_concurrency
      end

end -- class LIBERTY_ETC_FACTORY
