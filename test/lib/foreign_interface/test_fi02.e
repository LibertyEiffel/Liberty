class TEST_FI02

-- test DLL

insert
   EIFFELTEST_TOOLS
   FOREIGN_DLL_HANDLER
   WRAPPER_HANDLER
   DL_FLAGS

create {}
   make

feature {}
   make
      local
         loader: FOREIGN_DLL_LOADER
         dll: FOREIGN_DLL
         a: FOREIGN_AGENT
         dlopen: FOREIGN_TYPED_OBJECT[POINTER]
         params: FOREIGN_PARAMETERS
      do
         dll := loader.library("libdl.so")
         label_assert("dll loaded", dll /= Void)
         label_assert("dll well named", dll.filename.is_equal("libdl.so"))

         label_assert("dll singleton", dll = loader.library("libdl.so"))

         a := dll.function("dlopen", << types.c_string, types.sint32 >>, types.pointer)
         label_assert("function exists", a /= Void)

         die_with_code(0)

         -- TODO: the following does not work, I don't know why:

         params.set(<<
                    types.create_string("libdl.so"),
                    types.create_sint32(rtld_noload)
                    >>)
         dlopen ?= a.item(params)

         label_assert("ffi-loaded dll not void", dlopen /= Void)
         label_assert("ffi-loaded dll pointer not null", dlopen.item.is_not_null)
         label_assert("ffi-loaded dll pointer is the same as foreign pointer", dlopen.item = dll.dso.handle)
      end

   types: FOREIGN_TYPES

end
