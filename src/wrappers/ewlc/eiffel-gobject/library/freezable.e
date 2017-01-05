note
	copyright: "[
		Copyright (C) 2007-2017: Paolo Redaelli

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

deferred class FREEZABLE
	-- An object that can be made temporary or permanently unchangable.

	-- Note: this class is currently used only in G_VALUE. It is debatable if
	-- the behaviour it provides is actually useful or desiderable.

insert ANY undefine copy, is_equal, fill_tagged_out_memory end

feature {ANY}
	freeze
		-- Forbid further changes to Current until thaw is invoked
	do
		state := state.bit_set(freezed_bit)
	end

	thaw
		-- Allow changes to Current
	do
		state := state.bit_reset(freezed_bit)
	end

	petrify
		do
			state := state.bit_set(freezed_bit)
			state := state.bit_set(petrified_bit)
		end

	is_freezed: BOOLEAN
		do
			Result := (state.bit_test(freezed_bit) or 
			state.bit_test(petrified_bit))
			-- Oh yeah it could have been written a-la C. 
		end

	is_petrified: BOOLEAN
		do
			Result := state.bit_test(petrified_bit)
		end

feature {} 
	state: INTEGER_8

	freezed_bit: INTEGER_8 is 0
	petrified_bit: INTEGER_8 is 1

end -- class FREEZABLE

