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
deferred class LIBERTY_ETC_VISITOR

inherit
	VISITOR

feature {LIBERTY_ETC}
	tool_name: FIXED_STRING is
		deferred
		end

	clusters: MAP[LIBERTY_ETC_CLUSTER, FIXED_STRING] is
		deferred
		end

	check_validity is
		deferred
		end

feature {LIBERTY_ETC_FACTORY} -- Lists
	visit_environment_variable_list (list: LIBERTY_ETC_LIST) is
		require
			list /= Void
		deferred
		end

	visit_cluster_list (list: LIBERTY_ETC_LIST) is
		require
			list /= Void
		deferred
		end

	visit_cluster_configuration_list (list: LIBERTY_ETC_LIST) is
		require
			list /= Void
		deferred
		end

	visit_debug_configuration_list (list: LIBERTY_ETC_LIST) is
		require
			list /= Void
		deferred
		end

	visit_debug_key_list (list: LIBERTY_ETC_LIST) is
		require
			list /= Void
		deferred
		end

feature {LIBERTY_ETC_FACTORY} -- Non-Terminals
	visit_master (nt: LIBERTY_ETC_NON_TERMINAL) is
		require
			nt /= Void
		deferred
		end

	visit_cluster_definition (nt: LIBERTY_ETC_NON_TERMINAL) is
		require
			nt /= Void
		deferred
		end

	visit_environment (nt: LIBERTY_ETC_NON_TERMINAL) is
		require
			nt /= Void
		deferred
		end

	visit_environment_variable (nt: LIBERTY_ETC_NON_TERMINAL) is
		require
			nt /= Void
		deferred
		end

	visit_clusters (nt: LIBERTY_ETC_NON_TERMINAL) is
		require
			nt /= Void
		deferred
		end

	visit_cluster (nt: LIBERTY_ETC_NON_TERMINAL) is
		require
			nt /= Void
		deferred
		end

	visit_location (nt: LIBERTY_ETC_NON_TERMINAL) is
		require
			nt /= Void
		deferred
		end

	visit_version (nt: LIBERTY_ETC_NON_TERMINAL) is
		require
			nt /= Void
		deferred
		end

	visit_needs (nt: LIBERTY_ETC_NON_TERMINAL) is
		require
			nt /= Void
		deferred
		end

	visit_cluster_configuration (nt: LIBERTY_ETC_NON_TERMINAL) is
		require
			nt /= Void
		deferred
		end

	visit_configure (nt: LIBERTY_ETC_NON_TERMINAL) is
		require
			nt /= Void
		deferred
		end

	visit_cluster_constraints (nt: LIBERTY_ETC_NON_TERMINAL) is
		require
			nt /= Void
		deferred
		end

	visit_cluster_version_constraint (nt: LIBERTY_ETC_NON_TERMINAL) is
		require
			nt /= Void
		deferred
		end

	visit_version_operator (nt: LIBERTY_ETC_NON_TERMINAL) is
		require
			nt /= Void
		deferred
		end

	visit_assertion (nt: LIBERTY_ETC_NON_TERMINAL) is
		require
			nt /= Void
		deferred
		end

	visit_assertion_level (nt: LIBERTY_ETC_NON_TERMINAL) is
		require
			nt /= Void
		deferred
		end

	visit_debug (nt: LIBERTY_ETC_NON_TERMINAL) is
		require
			nt /= Void
		deferred
		end

	visit_debug_configuration (nt: LIBERTY_ETC_NON_TERMINAL) is
		require
			nt /= Void
		deferred
		end

	visit_debug_key (nt: LIBERTY_ETC_NON_TERMINAL) is
		require
			nt /= Void
		deferred
		end

	visit_concurrency (nt: LIBERTY_ETC_NON_TERMINAL) is
		require
			nt /= Void
		deferred
		end

invariant
	clusters /= Void

end -- class LIBERTY_ETC_VISITOR
