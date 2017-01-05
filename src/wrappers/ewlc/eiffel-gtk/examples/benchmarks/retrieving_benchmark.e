note
	description: "Benchmark for boosted property setter"
	copyright: "[
					Copyright (C) 2006-2017: Paolo Redaelli
					
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

class RETRIEVING_BENCHMARK

inherit WRAPPER_HANDLER

insert
	SHARED_WRAPPERS_DICTIONARY
	GTK
	ARGUMENTS
	MEMORY
	
create {ANY} make

feature {ANY} -- objects and 
	timer: G_TIMER
	label: GTK_LABEL
	labels: FAST_ARRAY [GTK_LABEL]
	pointer: POINTER

	random: STD_RAND
	
feature {ANY}
	iterations_number: INTEGER_32
	
	make
		local i: INTEGER
		do
			if (argument_count>0 and then argument(1).is_integer)
			 then iterations_number := argument(1).to_integer
			else iterations_number := 10000
			end
			print ("Iterations:%TWrappers%TRetriever%TMemory usage%N")
			print (iterations_number.out) print ("%T")

			gtk.initialize
			create timer
			create random.make
			-- Create labels
			from create labels.make (iterations_number); i:=iterations_number-1
			until i < 0
			loop
				create label.with_label("Label n. "+i.out)
				labels.put(label, i)
				wrappers.add (label, label.handle)
				i := i-1
			end

			wrapper_benchmark
			retriever_benchmark

			print (allocated_bytes.out) print ("%N")
		ensure iterations_number /= 0
		end

	wrapper_benchmark
		local counter: INTEGER; l: GTK_LABEL
		do	
			from counter := iterations_number; timer.start
			until counter = 0
			loop
				random.next
				label := labels.item(random.last_integer(iterations_number-1))
				pointer := label.handle
				l ::= wrappers.at(pointer)
				check l_is_label: l = label end
				counter := counter - 1
			end
			timer.stop
			print (timer.elapsed.out) print ("%T")
		end

	retriever_benchmark
		local counter: INTEGER; l: GTK_LABEL; r: G_RETRIEVER[GTK_LABEL]
		do	
			from counter := iterations_number; timer.start
			until counter = 0
			loop
				random.next
				label := labels.item(random.last_integer(iterations_number-1))
				pointer := label.handle
				l := r.wrapper(pointer)
				check l_is_label: l = label end
				counter := counter - 1
			end
			timer.stop
			print (timer.elapsed.out)  print ("%T")
		end 
end
