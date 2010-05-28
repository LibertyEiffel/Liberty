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
class LIBERTY_ETC_NEEDS

create {LIBERTY_ETC_VISITOR_IMPL}
	make

feature {ANY}
	cluster: LIBERTY_ETC_CLUSTER

feature {LIBERTY_ETC_CLUSTER}
	check_validity (all_clusters: MAP[LIBERTY_ETC_CLUSTER, FIXED_STRING]) is
		require
			all_clusters /= Void
		do
			if cluster = Void then
				cluster := all_clusters.fast_reference_at(cluster_name)
				if cluster = Void then
					std_error.put_string("Unknown cluster: " + cluster_name)
					die_with_code(1)
				end
			else
				check
					cluster = all_clusters.fast_at(cluster_name)
				end
			end
			constraints.do_all(agent {LIBERTY_ETC_CONSTRAINT}.check_validity(cluster))
		end

	in_cycle: BOOLEAN

	set_in_cycle is
		do
			in_cycle := True
		ensure
			in_cycle
		end

feature {}
	make (a_cluster_name: like cluster_name; a_cluster: like cluster; a_constraints: like constraints) is
		require
			a_cluster_name /= Void
			a_constraints /= Void
		do
			cluster_name := a_cluster_name
			cluster := a_cluster
			constraints := a_constraints
		ensure
			cluster_name = a_cluster_name
			cluster = a_cluster
			constraints = a_constraints
		end

	cluster_name: FIXED_STRING
	constraints: TRAVERSABLE[LIBERTY_ETC_CONSTRAINT]

invariant
	cluster_name /= Void
	constraints /= Void

end -- class LIBERTY_ETC_NEEDS
