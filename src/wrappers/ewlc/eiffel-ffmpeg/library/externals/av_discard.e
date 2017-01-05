note
	description: "Different valid options for discarding frames"
	copyright: "[
					Copyright (C) 2006-2017: Soluciones Informaticas Libres S.A. (Except)
					
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

deferred class AV_DISCARD

inherit
	ANY
		undefine copy, is_equal end

feature {}

	is_valid_av_discard (a_discard: INTEGER): BOOLEAN
		do
			Result := a_discard.in_range (av_discard_none, av_discard_all)
		end

	av_discard_none: INTEGER
			-- discard nothing
		external "C macro use <avcodec.h>"
		alias "AVDISCARD_"
		end

	av_discard_default: INTEGER
			-- discard useless packets like 0 size packets in avi
		external "C macro use <avcodec.h>"
		alias "AVDISCARD_DEFAULT"
		end

	av_discard_nonref: INTEGER
			-- discard all non reference
		external "C macro use <avcodec.h>"
		alias "AVDISCARD_NONREF"
		end

	av_discard_bidir: INTEGER
			-- discard all bidirectional frames
		external "C macro use <avcodec.h>"
		alias "AVDISCARD_BIDIR"
		end

	av_discard_nonkey: INTEGER
			-- discard all frames except keyframes
		external "C macro use <avcodec.h>"
		alias "AVDISCARD_NONKEY"
		end

	av_discard_all: INTEGER
			-- discard all
		external "C macro use <avcodec.h>"
		alias "AVDISCARD_ALL"
		end

end -- class AV_DISCARD
