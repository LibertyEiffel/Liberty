-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class POSIX_TYPES


insert ANY undefine is_equal, copy end

	STANDARD_C_LIBRARY_TYPES

feature {ANY} -- C type definitions (typedefs)
       tcp_seq: NATURAL
               -- typedef tcp_seq
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       in_port_t: like uint16_t
               -- typedef in_port_t
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       in_addr_t: like uint32_t
               -- typedef in_addr_t
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

end
