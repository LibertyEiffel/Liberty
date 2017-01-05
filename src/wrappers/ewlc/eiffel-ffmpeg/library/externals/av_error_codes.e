note
	description: "Several possible error codes"
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

deferred class AV_ERROR_CODES

inherit
	ANY
		undefine copy, is_equal end

feature {} -- Constants

	is_valid_av_error_code (a_error_code: INTEGER): BOOLEAN
		do
			Result := ((a_error_code = av_error_noerror) or else
					   (a_error_code = av_error_io) or else
					   (a_error_code = av_error_numexpected) or else
					   (a_error_code = av_error_invaliddata) or else
					   (a_error_code = av_error_nomem) or else
					   (a_error_code = av_error_nofmt) or else
					   (a_error_code = av_error_notsupp))
		end

	av_error_noerror: INTEGER is 0
			-- No error here.  Move along.

	av_error_unknown: INTEGER
			-- Unknown error
		external "C macro use <avformat.h>"
		alias "AVERROR_UNKNOWN"
		end

	av_error_io: INTEGER
			-- I/O error
		external "C macro use <avformat.h>"
		alias "AVERROR_IO"
		end

	av_error_numexpected: INTEGER
			-- Number syntax expected in filename
		external "C macro use <avformat.h>"
		alias "AVERROR_NUMEXPECTED"
		end

	av_error_invaliddata: INTEGER
			-- Invalid data found
		external "C macro use <avformat.h>"
		alias "AVERROR_INVALIDDATA"
		end

	av_error_nomem: INTEGER
			-- Not enough memory
		external "C macro use <avformat.h>"
		alias "AVERROR_NOMEM"
		end

	av_error_nofmt: INTEGER
			-- Unknown format
		external "C macro use <avformat.h>"
		alias "AVERROR_NOFMT"
		end

	av_error_notsupp: INTEGER
			-- Operation not supported
		external "C macro use <avformat.h>"
		alias "AVERROR_NOTSUPP"
		end

end -- class AV_ERROR_CODES
