class PROCESS_GROUP_POSIX

inherit
	PROCESS_GROUP

insert
	PLATFORM
		rename
			Maximum_integer as capacity
		end

creation {PROCESS_FACTORY}
	make

feature {ANY}
	wait: PROCESS_POSIX is
		local
			process_id, status: INTEGER
		do
			basic_exec_posix_wait_any(data)
			process_id := basic_exec_id(data)
			if process_id /= -1 then
				check
					id_map.has(process_id)
				end
				Result := id_map.at(process_id)
				check
					Result.id = process_id
				end
				status := basic_exec_status(data)
				Result.cleanup(status)
			end
		end

	finished: PROCESS_POSIX is
		local
			process_id, status: INTEGER
		do
			basic_exec_posix_any_finished(data)
			process_id := basic_exec_id(data)
			if process_id /= -1 and then process_id /= 0 then
				check
					id_map.has(process_id)
				end
				Result := id_map.at(process_id)
				check
					Result.id = process_id
				end
				status := basic_exec_status(data)
				Result.cleanup(status)
			end
		end

	count: INTEGER is
		do
			Result := id_map.count
		end

feature {PROCESS_POSIX}
	register (process: PROCESS_POSIX) is
		local
			process_id: INTEGER
		do
			process_id := process.id
			id_map.put(process, process_id)
		end

	unregister (process: PROCESS_POSIX) is
		local
			process_id: INTEGER
		do
			process_id := process.id
			id_map.remove(process_id)
		end

feature {}
	make is
		do
			create id_map.make
			data := basic_exec_alloc_data
		end

	id_map: HASHED_DICTIONARY[PROCESS_POSIX, INTEGER]

	data: POINTER

	basic_exec_posix_wait_any (dat: POINTER) is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "exec"
			feature_name: "basic_exec_posix_wait_any"
			}"
		end

	basic_exec_posix_any_finished (dat: POINTER) is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "exec"
			feature_name: "basic_exec_posix_any_finished"
			}"
		end

	basic_exec_alloc_data: like data is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "exec"
			feature_name: "basic_exec_alloc_data()"
			}"
		end

	basic_exec_id (dat: like data): INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "exec"
			feature_name: "basic_exec_id"
			}"
		end

	basic_exec_status (dat: like data): INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "exec"
			feature_name: "basic_exec_status"
			}"
		end

end -- class PROCESS_GROUP_POSIX
