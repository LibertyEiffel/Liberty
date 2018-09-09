note
	description: "External calls for using with AV_CODEC_CONTEXT"
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

deferred class AV_CODEC_CONTEXT_EXTERNALS
	-- External calls for AV_CODEC_CONTEXT

inherit
	ANY
		undefine copy, is_equal end

feature {} -- External calls - getters

	av_codec_context_get_codec_type (a_context: POINTER): INTEGER
		external "C struct AVCodecContext get codec_type use <avcodec.h>"
		end

	av_codec_context_get_width (a_context: POINTER): INTEGER
		external "C struct AVCodecContext get width use <avcodec.h>"
		end

	av_codec_context_get_height (a_context: POINTER): INTEGER
		external "C struct AVCodecContext get height use <avcodec.h>"
		end

	av_codec_context_get_sample_rate (a_context: POINTER): INTEGER
		external "C struct AVCodecContext get sample_rate use <avcodec.h>"
		end

	av_codec_context_get_channels (a_context: POINTER): INTEGER
		external "C struct AVCodecContext get channels use <avcodec.h>"
		end

	av_codec_context_get_frame_size (a_context: POINTER): INTEGER
		external "C struct AVCodecContext get frame_size use <avcodec.h>"
		end

	av_codec_context_get_frame_number (a_context: POINTER): INTEGER
		external "C struct AVCodecContext get frame_number use <avcodec.h>"
		end

	av_codec_context_get_real_pict_num (a_context: POINTER): INTEGER
		external "C struct AVCodecContext get real_pict_num use <avcodec.h>"
		end

	av_codec_context_get_qcompress (a_context: POINTER): INTEGER
		external "C struct AVCodecContext get delay use <avcodec.h>"
		end

	av_codec_context_get_qblur (a_context: POINTER): REAL
		external "C struct AVCodecContext get qblur use <avcodec.h>"
		end

	av_codec_context_get_skip_idct (a_context: POINTER): INTEGER
		external "C struct AVCodecContext get skip_idct use <avcodec.h>"
		end

	av_codec_context_get_skip_frame (a_context: POINTER): INTEGER
		external "C struct AVCodecContext get skip_frame use <avcodec.h>"
		end

	av_codec_context_get_skip_loop_filter (a_context: POINTER): INTEGER
		external "C struct AVCodecContext get skip_loop_filter use <avcodec.h>"
		end

	av_codec_context_get_thread_count (a_context: POINTER): INTEGER
		external "C struct AVCodecContext get thread_count use <avcodec.h>"
		end

	av_codec_context_get_bits_per_sample (a_context: POINTER): INTEGER
		external "C struct AVCodecContext get bits_per_sample use <avcodec.h>"
		end

	av_codec_context_get_codec (a_context: POINTER): POINTER
		external "C struct AVCodecContext get codec use <avcodec.h>"
		end

	av_codec_context_get_pix_fmt (a_context: POINTER): INTEGER
		external "C struct AVCodecContext get pix_fmt use <avcodec.h>"
		end

	av_codec_context_get_codec_id (a_context: POINTER): INTEGER
		external "C struct AVCodecContext get codec_id use <avcodec.h>"
		end

feature {} -- External calls - Setters

	av_codec_context_set_thread_count (a_context: POINTER; a_thread_count: INTEGER)
		external "C struct AVCodecContext set thread_count use <avcodec.h>"
		end

	av_codec_context_set_skip_idct (a_context: POINTER; a_discard: INTEGER)
		external "C struct AVCodecContext set skip_idct use <avcodec.h>"
		end

	av_codec_context_set_skip_frame (a_context: POINTER; a_discard: INTEGER)
		external "C struct AVCodecContext set skip_frame use <avcodec.h>"
		end

	av_codec_context_set_skip_loop_filter (a_context: POINTER; a_discard: INTEGER)
		external "C struct AVCodecContext set skip_loop_filter use <avcodec.h>"
		end

	av_codec_context_set_bits_per_sample (a_context: POINTER; a_bps: INTEGER)
		external "C struct AVCodecContext set bits_per_sample use <avcodec.h>"
		end

feature {} -- Operations
	avcodec_alloc_context: POINTER
		external "C use <avcodec.h>"
		end

	avcodec_open (a_context, a_codec: POINTER): INTEGER
		external "C use <avcodec.h>"
		end

	avcodec_close (a_context: POINTER): INTEGER
		external "C use <avcodec.h>"
		end

	avcodec_decode_video (handle, a_picture, a_got_picture_ptr, a_data_ptr: POINTER; a_size: INTEGER): INTEGER
		external "C use <avcodec.h>"
		end

end -- class AV_CODEC_CONTEXT_EXTERNALS
