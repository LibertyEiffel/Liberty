-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class READLINE_TYPES


insert ANY undefine is_equal, copy end

	STANDARD_C_LIBRARY_TYPES

feature {WRAPPER_HANDLER} -- C type definitions (typedefs)
       histdata_t: POINTER
               -- typedef histdata_t from /usr/include/readline/history.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       keymap: POINTER
               -- typedef Keymap from /usr/include/readline/keymaps.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

end
