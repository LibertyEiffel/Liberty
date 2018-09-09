note
	description: "Different methods to retrieve a codec"
	copyright: "[
					Copyright (C) 2006-2018: Soluciones Informaticas Libres S.A. (Except)
					
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

deferred class AV_CODEC_FINDER

insert
	AV_CODEC_FINDER_EXTERNALS
	AV_CODEC_IDS
	GLOBAL_CACHE
	WRAPPER_FACTORY [AV_CODEC]

feature {} -- Private access

	get_decoder (a_codec_id: INTEGER): AV_CODEC
		require
			is_valid_av_codec_id (a_codec_id)
		local
			codec_ptr: POINTER
		do
			codec_ptr := avcodec_find_decoder (a_codec_id)
			if codec_ptr.is_not_null then
				Result:=wrapper(codec_ptr)
			end
		end

	get_encoder (a_codec_id: INTEGER): AV_CODEC
		require
			is_valid_av_codec_id (a_codec_id)
		local
			codec_ptr: POINTER
		do
			codec_ptr := avcodec_find_encoder (a_codec_id)
			if codec_ptr.is_not_null then
				Result:=wrapper(codec_ptr)
			end
		end

	get_decoder_by_name (a_name: STRING): AV_CODEC
		require
			a_name /= Void
		local
			codec_ptr: POINTER
		do
			codec_ptr := avcodec_find_decoder_by_name (a_name.to_external)
			if codec_ptr.is_not_null then
				Result:=wrapper(codec_ptr)
			end
		end

	get_encoder_by_name (a_name: STRING): AV_CODEC
		require
			a_name /= Void
		local
			codec_ptr: POINTER
		do
			codec_ptr := avcodec_find_encoder_by_name (a_name.to_external)
			if codec_ptr.is_not_null then
				Result := wrapper(codec_ptr)
			end
		end

	wrapper (a_ptr: POINTER): AV_CODEC
		do
			Result ?= wrappers.reference_at(a_ptr)
			if Result = Void then 
				create Result.from_external_pointer(a_ptr)
			end
		end
end -- class AV_CODEC_FINDER
