note
	description: "The AVCodec structure and methods to operate on it"
	copyright: "[
					Copyright (C) 2006 Soluciones Informaticas Libres S.A. (Except)
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hopeOA that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

class AV_CODEC

inherit
	GLOBALLY_CACHED

insert
	C_STRUCT
		undefine
			from_external_pointer
		end
	
	AV_CODEC_EXTERNALS
	AV_CODEC_IDS

create {ANY}
	from_external_pointer

feature {ANY} -- Operations

	open (a_context: AV_CODEC_CONTEXT): BOOLEAN is
		require
			a_context /= Void
			a_context.is_not_null
		do
			Result := a_context.open (Current)
		end

feature {ANY} -- Access

	name: STRING is
		do
			create Result.from_external_copy (av_codec_get_name (handle))
		end


feature {ANY} -- Size

	struct_size: INTEGER is
		external "C inline use <avformat.h>"
		alias "sizeof(AVCodec)"
		end

end -- class AV_CODEC
