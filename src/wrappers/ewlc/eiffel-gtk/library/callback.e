note
	description: "Signal callback: a object that receive a signal when it is emitted and call its callback feature"
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team,  GTK+ team and others
					
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
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$Revision:$"

deferred class CALLBACK

inherit
	ANY undefine is_equal, copy end
	G_CLOSURE

insert G_SIGNAL_EXTERNALS

feature {ANY}
	make
		do
			-- Using the _swap version is the key here. When the callback
			-- is invoked the first parameter of the C function will be
			-- the address of Eiffel's Current
			from_external_pointer (g_cclosure_new_swap (callback_pointer,
																	  Current.to_pointer, -- as user_data
																	  default_pointer -- i.e.: NULL as destroy callback
																	  ))
			-- See G_CLOSURE eiffel class, and libgobject documentation for
			-- GClosure to understand the next two lines.
			ref
			sink
		end

	-- connect (an_object: like object; a_routine: like routine) is
	-- 		do
	-- 			debug
	-- 				print (generating_type) print(".connect (an_object=") print (an_object.to_pointer.to_string)
	-- 				print (" an_object.handle=") print (an_object.handle.to_string)
	-- 				print (") Current=") print (to_pointer.to_string)
	-- 				print (" Current.handle=") print (handle.to_string)
	-- 				print ("%N")
	-- 			end
	
	-- 			handler_id := g_signal_connect_closure (an_object.handle,
	-- 																 signal_name.to_external,
	-- 																 handle,
	-- 																 0 -- i.e. call it before default handler
	-- 																 )
	-- 			-- routine:=a_routine
	-- 		end

	-- routine: FUNCTION [ANY, TUPLE , BOOLEAN]

	signal_name: STRING
			-- The name of the signal that Current callback will connect to.
		deferred
		end

	handler_id: INTEGER_64
			-- The numerical id of Current 

feature {} -- Auxiliar

	get_callback_pointer (pointer: POINTER): POINTER
			-- Identity on pointers. Workaround for SE's stupidity
			-- accepting $feature only as argument
		do
			Result := pointer
		ensure
			Result = pointer
		end

end
