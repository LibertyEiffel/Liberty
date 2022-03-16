note
	description: "External calls for using with AV_CODEC_FINDER"
	copyright: "[
					Copyright (C) 2006-2022: Soluciones Informaticas Libres S.A. (Except)
					
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

deferred class AV_CODEC_FINDER_EXTERNALS
	-- External calls for AV_CODEC_FINDER

feature {} -- External Calls

	avcodec_find_decoder (a_decoder_id: INTEGER): POINTER
		external "C use <avcodec.h>"
		end

	avcodec_find_encoder (a_decoder_id: INTEGER): POINTER
		external "C use <avcodec.h>"
		end

	avcodec_find_decoder_by_name (a_name: POINTER): POINTER
		external "C use <avcodec.h>"
		end

	avcodec_find_encoder_by_name (a_name: POINTER): POINTER
		external "C use <avcodec.h>"
		end

end -- class AV_CODEC_FINDER_EXTERNALS
