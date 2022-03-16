note
	description: "An object that can be made  ."
	copyright: "[
					Copyright (C) 2007-2022: Paolo Redaelli
					
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

deferred class G_FREEZABLE
	-- An object that can be made temporary or permanently
	-- unchangable.

	-- Note for the developer: this behaviour is
	-- currently only a hint to the end-user and
	-- it is not enforced throught an invariant.

	-- TODO: implement an invariant.
insert ANY undefine copy, is_equal, fill_tagged_out_memory end

feature {ANY}
	freeze
			-- Forbid further changes to Current until thaw is invoked
		do
			state := state.max(freezed_state)
		end

	thaw
			-- Allow changes to Current
		require can_be_thawed
		do
			state := mutable_state
		end

	petrify
		do
			state := petrified_state
		end

	is_mutable: BOOLEAN
		do
			Result := state=mutable_state
		end

	is_freezed: BOOLEAN
		do
			Result := state>=freezed_state
		end

	can_be_thawed: BOOLEAN
		do
			Result := not is_petrified
		end

	is_petrified: BOOLEAN
		do
			Result := state>=petrified_state
		end

feature {} 
	state: INTEGER_8

	mutable_state: INTEGER_8 is 0
	-- The object can be changed
	freezed_state: INTEGER_8 is 1
	-- The object cannot currently be changed but can be
	-- made changeable
	petrified_state: INTEGER_8 is 2
	-- The object cannot be changed anymore	
end -- class G_FREEZABLE
