-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class FILE_STRUCT

inherit ANY undefine is_equal, copy end

insert STANDARD_C_LIBRARY_TYPES
feature {} -- Low-level setters

feature {} -- Low-level queries

	-- Unwrappable field _flags.
	-- Unwrappable field _IO_read_ptr.
	-- Unwrappable field _IO_read_end.
	-- Unwrappable field _IO_read_base.
	-- Unwrappable field _IO_write_base.
	-- Unwrappable field _IO_write_ptr.
	-- Unwrappable field _IO_write_end.
	-- Unwrappable field _IO_buf_base.
	-- Unwrappable field _IO_buf_end.
	-- Unwrappable field _IO_save_base.
	-- Unwrappable field _IO_backup_base.
	-- Unwrappable field _IO_save_end.
	-- Unwrappable field _markers.
	-- Unwrappable field _chain.
	-- Unwrappable field _fileno.
	-- Unwrappable field _flags2.
	-- Unwrappable field _old_offset.
	-- Unwrappable field _cur_column.
	-- Unwrappable field _vtable_offset.
	-- Unwrappable field _shortbuf.
	-- Unwrappable field _lock.
	-- Unwrappable field _offset.
	-- Unwrappable field __pad1.
	-- Unwrappable field __pad2.
	-- Unwrappable field __pad3.
	-- Unwrappable field __pad4.
	-- Unwrappable field __pad5.
	-- Unwrappable field _mode.
	-- Unwrappable field _unused2.
feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__IO_FILE"
		}"
		end

end -- class FILE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

