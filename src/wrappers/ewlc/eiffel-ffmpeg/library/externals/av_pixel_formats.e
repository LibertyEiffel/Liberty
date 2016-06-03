note
	description: "Different valid pixel formats"
	copyright: "[
					Copyright (C) 2006 Soluciones Informaticas Libres S.A. (Except)
					
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

deferred class AV_PIXEL_FORMATS
	-- Valid pixel formats

inherit
	ANY
		undefine copy, is_equal end

feature {} -- Enumeration

	is_valid_av_pixel_format (a_pix_fmt: INTEGER): BOOLEAN is
		do
			Result := ((a_pix_fmt = pix_fmt_none) or else
					   (a_pix_fmt = pix_fmt_yuv420p) or else
					   (a_pix_fmt = pix_fmt_yuv422) or else
					   (a_pix_fmt = pix_fmt_rgb24) or else
					   (a_pix_fmt = pix_fmt_bgr24) or else
					   (a_pix_fmt = pix_fmt_yuv422p) or else
					   (a_pix_fmt = pix_fmt_yuv444p) or else
					   (a_pix_fmt = pix_fmt_rgba32) or else
					   (a_pix_fmt = pix_fmt_yuv410p) or else
					   (a_pix_fmt = pix_fmt_yuv411p) or else
					   (a_pix_fmt = pix_fmt_rgb565) or else
					   (a_pix_fmt = pix_fmt_rgb555) or else
					   (a_pix_fmt = pix_fmt_gray8) or else
					   (a_pix_fmt = pix_fmt_monowhite) or else
					   (a_pix_fmt = pix_fmt_monoblack) or else
					   (a_pix_fmt = pix_fmt_pal8) or else
					   (a_pix_fmt = pix_fmt_yuvj420p) or else
					   (a_pix_fmt = pix_fmt_yuvj422p) or else
					   (a_pix_fmt = pix_fmt_yuvj444p) or else
					   (a_pix_fmt = pix_fmt_xvmc_mpeg2_mc) or else
					   (a_pix_fmt = pix_fmt_xvmc_mpeg2_idct) or else
					   (a_pix_fmt = pix_fmt_uyvy422) or else
					   (a_pix_fmt = pix_fmt_uyvy411) or else
					   (a_pix_fmt = pix_fmt_nb))
		end

	pix_fmt_none: INTEGER is
		external "C macro use <avutil.h>"
		alias "PIX_FMT_NONE"
		end

	pix_fmt_yuv420p: INTEGER is
			-- Planar YUV 4:2:0 (1 Cr & Cb sample per 2x2 Y samples).
		external "C macro use <avutil.h>"
		alias "PIX_FMT_YUV420P"
		end

	pix_fmt_yuv422: INTEGER is
			-- Packed pixel, Y0 Cb Y1 Cr.
		external "C macro use <avutil.h>"
		alias "PIX_FMT_YUV422"
		end

	pix_fmt_rgb24: INTEGER is
			-- Packed pixel, 3 bytes per pixel, RGBRGB...
		external "C macro use <avutil.h>"
		alias "PIX_FMT_RGB24"
		end

	pix_fmt_bgr24: INTEGER is
			-- Packed pixel, 3 bytes per pixel, BGRBGR...
		external "C macro use <avutil.h>"
		alias "PIX_FMT_BGR24"
		end

	pix_fmt_yuv422p: INTEGER is
			-- Planar YUV 4:2:2 (1 Cr & Cb sample per 2x1 Y samples).
		external "C macro use <avutil.h>"
		alias "PIX_FMT_YUV422P"
		end

	pix_fmt_yuv444p: INTEGER is
			-- Planar YUV 4:4:4 (1 Cr & Cb sample per 1x1 Y samples).
		external "C macro use <avutil.h>"
		alias "PIX_FMT_YUV444P"
		end

	pix_fmt_rgba32: INTEGER is
			-- Packed pixel, 4 bytes per pixel, BGRABGRA..., stored in cpu endianness.
		external "C macro use <avutil.h>"
		alias "PIX_FMT_RGBA32"
		end

	pix_fmt_yuv410p: INTEGER is
			-- Planar YUV 4:1:0 (1 Cr & Cb sample per 4x4 Y samples).
		external "C macro use <avutil.h>"
		alias "PIX_FMT_YUV410P"
		end

	pix_fmt_yuv411p: INTEGER is
			-- Planar YUV 4:1:1 (1 Cr & Cb sample per 4x1 Y samples).
		external "C macro use <avutil.h>"
		alias "PIX_FMT_YUV411P"
		end

	pix_fmt_rgb565: INTEGER is
			-- always stored in cpu endianness
		external "C macro use <avutil.h>"
		alias "PIX_FMT_RGB565"
		end

	pix_fmt_rgb555: INTEGER is
			-- always stored in cpu endianness, most significant bit to 1
		external "C macro use <avutil.h>"
		alias "PIX_FMT_RGB555"
		end

	pix_fmt_gray8: INTEGER is
		external "C macro use <avutil.h>"
		alias "PIX_FMT_GRAY8"
		end

	pix_fmt_monowhite: INTEGER is
			-- 0 is white
		external "C macro use <avutil.h>"
		alias "PIX_FMT_MONOWHITE"
		end

	pix_fmt_monoblack: INTEGER is
			-- 0 is black
		external "C macro use <avutil.h>"
		alias "PIX_FMT_MONOBLACK"
		end

	pix_fmt_pal8: INTEGER is
			-- 8 bit with RGBA palette
		external "C macro use <avutil.h>"
		alias "PIX_FMT_PAL8"
		end

	pix_fmt_yuvj420p: INTEGER is
			-- Planar YUV 4:2:0 full scale (jpeg).
		external "C macro use <avutil.h>"
		alias "PIX_FMT_YUVJ420P"
		end

	pix_fmt_yuvj422p: INTEGER is
			-- Planar YUV 4:2:2 full scale (jpeg).
		external "C macro use <avutil.h>"
		alias "PIX_FMT_YUVJ422P"
		end

	pix_fmt_yuvj444p: INTEGER is
			-- Planar YUV 4:4:4 full scale (jpeg).
		external "C macro use <avutil.h>"
		alias "PIX_FMT_YUVJ444P"
		end

	pix_fmt_xvmc_mpeg2_mc: INTEGER is
			-- XVideo Motion Acceleration via common packet passing(xvmc_render.h).
		external "C macro use <avutil.h>"
		alias "PIX_FMT_XVMC_MPEG2_MC"
		end

	pix_fmt_xvmc_mpeg2_idct: INTEGER is
		external "C macro use <avutil.h>"
		alias "PIX_FMT_XVMC_MPEG2_IDCT"
		end

	pix_fmt_uyvy422: INTEGER is
			-- Packed pixel, Cb Y0 Cr Y1.
		external "C macro use <avutil.h>"
		alias "PIX_FMT_UYVY422"
		end

	pix_fmt_uyvy411: INTEGER is
			-- Packed pixel, Cb Y0 Y1 Cr Y2 Y3.
		external "C macro use <avutil.h>"
		alias "PIX_FMT_UYVY411"
		end

	pix_fmt_nb: INTEGER is
		external "C macro use <avutil.h>"
		alias "PIX_FMT_NB"
		end

end -- class AV_PIXEL_FORMATS
