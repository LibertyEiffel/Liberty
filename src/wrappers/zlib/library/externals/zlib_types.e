-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class ZLIB_TYPES


insert ANY undefine is_equal, copy end

	STANDARD_C_LIBRARY_TYPES

feature {ANY} -- C type definitions (typedefs)
       gz_file: POINTER
               -- typedef gzFile
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       out_func: POINTER
               -- typedef out_func
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       in_func: POINTER
               -- typedef in_func
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       gz_headerp: POINTER
               -- typedef gz_headerp
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       z_streamp: POINTER
               -- typedef z_streamp
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       free_func: POINTER
               -- typedef free_func
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       alloc_func: POINTER
               -- typedef alloc_func
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

end
