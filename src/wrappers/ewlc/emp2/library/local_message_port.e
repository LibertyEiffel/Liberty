note
	description: "."
	copyright: "[

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

deferred class LOCAL_MESSAGE_PORT
	-- A MESSAGE_PORT that is stored in a memory region that is shared between
	-- the writer and reader processes.

	-- Known implementation are: 

	-- * MEMORY_MAPPED_MESSAGE_PORT used by a FORKED object to communicate with its father and

	-- * SHARED_MEMORY_MESSAGE_PORT used by to communicate with unrelated
	-- processes, tipically executed by the father. 

inherit MESSAGE_PORT

insert UNISTD_EXTERNALS

feature {ANY} 
	has (a_message: MESSAGE): BOOLEAN is
		do
			if a_message/=Void then
				Result := pointer_in_range
				(a_message.to_pointer,
				start, start+size)
			end
	   end
feature {ANY}	 -- Ownership
	owner: INTEGER
	-- Process ID (pid) of the process owning the message port. The owner is
	-- allowed to write in the message port. 

	pass_ownership_to (a_pid: INTEGER) is
		-- Pass the ownership of the port to another process with `a_pid'.
	require is_owner
	do
		owner := a_pid
	end

	is_owner: BOOLEAN is
		-- Is the running process the owner of Current port?
	do
		Result := owner=getpid
	end

feature {} -- Implementation
	start: POINTER
	size: INTEGER_32

	tiny_size: INTEGER is 1024
	small_size: INTEGER is 65 536 -- 64k
	default_size: INTEGER is 10 485 760 -- 10 Mbytes

feature {} -- Low-level
	compare_pointers (p,r: POINTER): BOOLEAN is
		-- Is `p' before 'r' in memory?
	external "C inline"
	alias "((EIF_BOOLEAN) $p < $r)"
	end

	pointer_in_range (p,a,b: POINTER): BOOLEAN is
		-- Is `p' contained in the range from `a' and `b'.
	external "C inline"
	alias "((EIF_BOOLEAN) ($a<$p) & ($p<$b))"
	end

end -- class LOCAL_MESSAGE_PORT
