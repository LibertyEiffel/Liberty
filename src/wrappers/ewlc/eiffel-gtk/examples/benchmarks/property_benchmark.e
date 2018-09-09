note
	description: "Benchmark for boosted property setter"
	copyright: "[
					Copyright (C) 2006-2018: Paolo Redaelli
					
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

class PROPERTY_BENCHMARK

insert
	GTK
	ARGUMENTS

	PANGO_CONSTANTS
	PANGO_SCALES
	PANGO_WEIGHT
	PANGO_STYLE
	
create {ANY} make

feature {ANY} -- Widgets
	buffer: GTK_TEXT_BUFFER

	timer: G_TIMER
	
feature {ANY}
	iterations_number: INTEGER_32
	
	make
		do
			if (argument_count > 0 and then 
				 argument(1).is_integer) then 
					iterations_number := argument(1).to_integer
			else 
				iterations_number := 10000
			end
			print ("Doing ") print (iterations_number.out) 
			print ("	iterations%N")

			gtk.initialize
			create buffer.make
			create timer

			create bold_value.from_integer(pango_weight_bold)
			create size_value.from_integer(15 * 1024)
			create style_value.from_integer(pango_style_italic)
			weight_value := bold_value
			
			smart_setter_benchmark
			normal_setter_benchmark
		ensure 
			iterations_number /= 0
		end

	weight_p, size_p, style_p: G_PARAM_SPEC
	bold_value, size_value, style_value, weight_value: G_VALUE
	
	smart_setter_benchmark
		require
			bold_value/=Void
			size_value/=Void
			style_value/=Void
			weight_value/=Void
			iterations_number > 100
		local counter: INTEGER
		do	
			weight_p := heading.find_property (once "weight")
			size_p := heading.find_property (once "size")
			from counter := iterations_number; timer.start
			until counter = 0
			loop
				heading.smart_set_property (weight_p, bold_value)
				heading.smart_set_property (size_p, size_value)
				
				--italic.smart_set_property (once "style",style_value)
				
				bold.smart_set_property (weight_p, bold_value)

				counter := counter - 1
			end
			timer.stop
			print ("Using Eiffel implementation of property set took ")
			print (timer.elapsed.out) print (" seconds.%N")
		end

	normal_setter_benchmark
		require
			bold_value/=Void
			size_value/=Void
			style_value/=Void
			weight_value/=Void
			iterations_number > 100
		local counter: INTEGER
		do	
			from counter := iterations_number; timer.start
			until counter = 0
			loop
				heading.set_property (once "weight", bold_value)
				heading.set_property (once "size", size_value)
				
				--italic.set_property (once "style", style_value)
				
				bold.set_property (once "weight", bold_value)

				counter := counter - 1
			end
			timer.stop
			print ("Using original implementation of property set took ")
			print (timer.elapsed.out) print (" seconds.%N")
		end 

feature {ANY} -- tags	
	heading: GTK_TEXT_TAG
		once
			create Result.with_name("heading")
		end

	italic: GTK_TEXT_TAG
		once
			create Result.with_name("italic")
			-- Result.set_style (pango_style_italic)
		end

	bold: GTK_TEXT_TAG
		once
			create Result.with_name("bold")
			-- Result.set_weight ( pango_weight_bold )
		end
	
	tags: GTK_TEXT_TAG_TABLE
		once
			create Result.make
			Result.add (heading)
			Result.add (italic)
			Result.add (bold)
		end
	
end
