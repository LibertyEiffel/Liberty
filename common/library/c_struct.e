indexing
	description: "Wrapper for a generic C structure"
	copyright: "(C) 2005 Paolo Redaelli, Raphael Mack <mail@raphael-mack.de>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$Revision:$"

deferred class C_STRUCT
	-- Wrapper for a data structure implemented in C programming language.

	-- No assumption is made on memory handling; to create a proper wrapper for
	-- it the developer shall inherit both from this class and from classes
	-- providing memory handling behaviour, depending on how structure's memory
	-- shall be handled. This is decided  case-by-case by C library. 

	-- Currently available memory handling classes are:

	-- C_OWNED: memory is always handled by the underlying C library.

	-- EIFFEL_OWNED: once created memory is fully handled by Eiffel runtime,
	-- usually with the Garbage Collector.

	-- GLOBALLY_CACHED: Until disposed by Eiffel the wrapper registered in
	-- wrappers dictionary will be the unique wrapper used on the Eiffel side.

	-- MIXED_MEMORY_HANDLING: whose memory can either by handled by the Eiffel
	-- library or by the underlying C code. Who handles memory is decided on a
	-- per-object based on the value of the flag `is_shared': handle will not
	-- be freed on dispose of the Eiffel wrapper object, when `is_shared' is
	-- true.

	-- REFERENCE_COUNTED: memory is handled throught reference counting, i.e.
	-- GObject

	-- Previous design was a black-or-white design either Eiffel-owned or not:
	-- C_STRUCT's are "owned" by the Eiffel code, and the Eiffel side should
	-- keep then longest lived reference to this struct.  This allows us to
	-- forget about wrapping for this objects.  If you have to share this
	-- struct and/or will have pointers to it around that will outlive the
	-- wrapper, please use SHARED_C_STRUCT

inherit
	WRAPPER

feature {} -- Initialization

	from_external_copy (other: POINTER) is
		do
			dispose
			if other.is_not_null then
				allocate
				handle := memcpy (handle, other, struct_size)
			else
				handle := default_pointer
			end
		end

	allocate is
			-- Allocate an initialized structure
		do
			handle := calloc (1, struct_size)
			if handle.is_null then raise_exception (No_more_memory) end
		ensure memory_allocated: handle.is_not_null
		end

feature -- Copying

	copy (other: like Current) is
		do
			dispose
			if other.handle.is_not_null then
				allocate
				handle := memcpy (handle, other.handle, struct_size)
			else
				handle := default_pointer
			end
		end

	is_equal (another: like Current): BOOLEAN is
		do
			Result:= Current.handle = another.handle
		end

feature {} -- Access to C features

	-- struct_size should be exported to WRAPPER, to be able to check size 
	-- before copying
	struct_size: INTEGER is
			-- sizeof (wrapped_structure), speaking in C. TODO: shall be a NATURAL
		deferred
		ensure positive: Result > 0 -- TODO: having NATURAL it is plainly useless
		end

feature {WRAPPER_HANDLER} -- Destroying
	free_handle is
			-- release the external memory
		do
			free (handle)
			-- Note free(NULL) is a harmless non-operation.
		end

end -- class C_STRUCT
