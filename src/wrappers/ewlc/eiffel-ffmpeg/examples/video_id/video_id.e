class VIDEO_ID

insert
	FFMPEG_COMMON
	AV_CODEC_TYPES
	ARGUMENTS

create {ANY}
	make

feature {ANY}

	make
		local
			video: AV_FORMAT_CONTEXT
			stream: ITERATOR [AV_STREAM]
			video_stream: INTEGER
			minutes: INTEGER_64
			seconds: REAL
			time_base: AV_RATIONAL
		do
			-- Do initialization
			ffmpeg_init

			if argument_count < 1 then
				print("Usage: video_id <infile>%N")
			else
				-- Open video and read header and stream information
				create video.from_file (argument (1))
				if video.is_valid then
					video.find_stream_info
					minutes := video.duration // (av_time_base * 60)
					seconds := (video.duration / av_time_base) - (minutes * 60).to_real_32
					print ("minutes: " + minutes.out + "%Nseconds: " +
					       seconds.to_string_format (3) + "%Nformat: " +
					       video.input_format.name + "%N")
					from
						stream := video.streams.get_new_iterator
						video_stream := -1
					until
						stream.is_off or video_stream > -1
					loop
						if stream.item.codec.type = codec_type_video then
							video_stream := stream.item.index
							time_base := stream.item.time_base
							print ("width: " + stream.item.codec.width.out +
							       "%Nheight: " + stream.item.codec.height.out +
							       "%Nduration: " + stream.item.duration.out +
							       "%Ntime base: " + time_base.numerator.out +
							       " / " + time_base.denominator.out)
							if stream.item.codec.find_and_open_decoder then
								print ("%Ncodec: " + stream.item.codec.codec.name + "%N")
							else
								die_with_code (exit_failure_code)
							end
						end
						stream.next
					end
					if video_stream = -1 then
						die_with_code (exit_failure_code)
					end
				else
					die_with_code (exit_failure_code)
				end
			end
		end

end -- class VIDEO_ID
