note
	description: "Open a video file, extract file frames and create GTKImages with them"
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

class VIDEO_TEST

insert
	GTK
	GDK_INTERP_TYPE
	FFMPEG_COMMON
	AV_CODEC_TYPES
	AV_PIXEL_FORMATS
	AV_SEEK_FLAGS
	ARGUMENTS

create {ANY}
	make

feature {ANY}

	make
		local
			video: AV_FORMAT_CONTEXT
			stream: ITERATOR [AV_STREAM]
			video_stream: INTEGER
			packet: AV_PACKET
			codec_context: AV_CODEC_CONTEXT
			frame, frame2: AV_FRAME
			video_frame_found, something_went_wrong: BOOLEAN
			offset, read_size: INTEGER
			error, got_picture: BOOLEAN
			pixbuf: GDK_PIXBUF
			window: GTK_WINDOW
			box: GTK_HBOX
			timestamp: INTEGER_64
			progress: REAL
		do

			if argument_count /= 1 then
				print ("Usage: " + command_name + " <video file>%N")
			elseif not (create {FILE_TOOLS}).is_readable (argument (1)) then
				print (command_name + ": Couldn't open " + argument (1) + "%N")
			else
				-- Do initialization
				ffmpeg_init
				-- Create a window...
				gtk.initialize
				create window.make
				window.set_border_width (6)
				window.set_title ("Thumbnails!")
				window.connect_agent_to_destroy_signal (agent gtk.quit)
				create box.make (True, 10)
				window.add (box)

				-- Open video and read header and stream information
				create video.from_file (argument (1))
				video.find_stream_info
				if video.is_valid then
					print ("Filename: " + video.filename + "%N")
					print ("Author: " + video.author + "%N")
					print ("Title: " + video.title + "%N")
					print ("Comment: " + video.comment + "%N")
					print ("Default stream: " + video.default_stream_index.out + "%N")
					print ("Stream count: " + video.streams.count.out + "%N")
					print ("Start time: " + (video.start_time // av_time_base).out + " seconds%N")
					print ("Duration: " + video.duration.out + " (" + (video.duration // av_time_base // 60).out + " minutes " + ((video.duration // av_time_base) \\ 60).out + " seconds)%N")
					print ("File size: " + video.file_size.out + "%N")
					print ("Bit rate: " + video.bit_rate.out + "%N")
					from
						stream := video.streams.get_new_iterator
						video_stream := -1
					until
						stream.is_off
					loop
						print ("Stream number " + stream.item.index.out + ":%N  Quality: "
								 + stream.item.quality.out + "%N  Language: "
								 + stream.item.language + "%N  Codec type: "
								 + stream.item.codec.type.out + " (" +
								(codec_types @ stream.item.codec.type) + ")%N  Width: "
								 + stream.item.codec.width.out + "%N  Height: "
								 + stream.item.codec.height.out + "%N")
						if stream.item.codec.type = codec_type_video then
							if not stream.item.codec.find_and_open_decoder then
								print ("  Failed to open decoder :-(%N")
							else
								print ("  Successfully opened decoder :-)%N")
								if video_stream = -1 then
									video_stream := stream.item.index
									print ("  * Choosing this video stream to decode some frames... *%N")
								end
							end
						end
						stream.next
					end

					if video_stream > -1 then
						-- Create 5 thumbnails
						from
							progress := 0.1
						until
							progress > 1.0
						loop

							print ("%N%N")
							-- Seek
							timestamp := (video.start_time.to_real_64 + progress * video.duration.to_real_64).force_to_integer_64
							something_went_wrong := not video.seek_frame (-1, timestamp, av_seek_flag_backward)
							if something_went_wrong then
								print ("Error seeking to " + timestamp.out + " :-/%N")
							else
								print ("Successfully seeked to " + timestamp.out + " :-)%N")
							end
							-- Decode a video frame
							create packet.make
							create frame.make
							codec_context := video.streams.item (video_stream).codec
							from
								got_picture := False
							until
								got_picture or something_went_wrong
							loop
								from
									video_frame_found := False
								until
									video_frame_found or something_went_wrong
								loop
									something_went_wrong := video.read_frame (packet) < 0
									video_frame_found := not something_went_wrong and then packet.stream_index = video_stream
								end
								if video_frame_found then
									print ("Found a video frame! :-D%N")
									read_size := codec_context.decode_video (frame, packet, 0)
									got_picture := codec_context.got_picture
									something_went_wrong := read_size < 0
									offset := offset + read_size
									print ("Got picture = " + codec_context.got_picture.out + ".  Read " + read_size.out + " bytes...%N")
								else
									print ("No more video frames found :'(%N")
								end
							end

							-- Convert to GDK_PIXBUF
							if codec_context.got_picture then
								-- An image should have been correctly decoded here...
								create frame2.make
								if not frame2.allocate (pix_fmt_rgb24, codec_context.width, codec_context.height) then
									print ("Couldn't allocate picture! :-( %N")
								else
									print ("Allocated " + frame2.size (pix_fmt_rgb24, codec_context.width, codec_context.height).out + " bytes...%N")

									print ("Frame's line size: " + frame.linesize (1).out + " bytes...%N")

									error := not frame.convert (frame2, pix_fmt_rgb24, codec_context.pix_fmt, codec_context.width, codec_context.height)
									if error then
										print ("Something went wrong while converting to RGB24 :-/%N")
									else
										print ("Converted to RGB24...%N")
									end
									create pixbuf.from_data (frame2.data (1), False, 8, codec_context.width, codec_context.height, frame2.linesize (1))
								end
							end
							if pixbuf /= Void and then pixbuf.is_valid then
								box.pack_start (create {GTK_IMAGE}.from_pixbuf (
									pixbuf.scale_simple (100, (100 * codec_context.height)
									 // codec_context.width, gdk_interp_bilinear)), False, False, 0)
							end
							progress := progress + 0.2
						end
					else
						print ("No video stream found!%N")
						box.pack_start (create {GTK_LABEL}.with_label ("No video stream found.  Was that an audio file?"), False, False, 0)
					end
				else
					print ("Error: " + video.error_code.out + "%N")
					something_went_wrong := True
				end

				if something_went_wrong then
					box.pack_start (create {GTK_LABEL}.with_label ("Something went wrong :-("), False, False, 0)
				end
				window.show_all
				gtk.run_main_loop
			end
		end

	codec_types: ARRAY [STRING]
		once
			Result := <<"Unknown", "Video", "Audio", "Data", "Subtitle">>
			Result.reindex (-1)
		end

end -- class VIDEO_TEST
