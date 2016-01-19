-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GCC_4_9_PLUGIN_TYPES


insert ANY undefine is_equal, copy end

feature {ANY} -- C type definitions (typedefs)
feature {ANY} -- variable-size types
       long: INTEGER_64
               -- a query with the same type of c 'long int'. useful when dealing with
               -- code that uses long int variable: just insert th class and mark
               -- the type as 'like long'
       do
               -- empty by design
       end

   long_unsigned: NATURAL_64
               -- a query with the same type of c 'long unsigned int'. useful when dealing with
               -- code that uses long int variable: just insert th class and mark
               -- the type as 'like long_unsigned'
       do
               -- empty by design
       end

feature {ANY} -- C type definitions (typedefs)
       addr_space_t: CHARACTER
               -- typedef addr_space_t
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       gimple: POINTER
               -- typedef gimple
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       const_tree: POINTER
               -- typedef const_tree
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       plugin_callback_func: POINTER
               -- typedef plugin_callback_func
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       const_rtvec: POINTER
               -- typedef const_rtvec
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       sbitmap: POINTER
               -- typedef sbitmap
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       htab_alloc: POINTER
               -- typedef htab_alloc
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       htab_eq: POINTER
               -- typedef htab_eq
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       const_edge: POINTER
               -- typedef const_edge
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       edge: POINTER
               -- typedef edge
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       htab_free_with_arg: POINTER
               -- typedef htab_free_with_arg
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       const_sbitmap: POINTER
               -- typedef const_sbitmap
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       const_bitmap: POINTER
               -- typedef const_bitmap
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       gcov_type: like long
               -- typedef gcov_type
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       const_rtx: POINTER
               -- typedef const_rtx
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       gcov_type_unsigned: like long_unsigned
               -- typedef gcov_type_unsigned
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       reg_class_t: INTEGER
               -- typedef reg_class_t
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       gt_pointer_operator: POINTER
               -- typedef gt_pointer_operator
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       tree: POINTER
               -- typedef tree
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       rtvec: POINTER
               -- typedef rtvec
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       plugin_init_func: POINTER
               -- typedef plugin_init_func
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       htab_alloc_with_arg: POINTER
               -- typedef htab_alloc_with_arg
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       htab_trav: POINTER
               -- typedef htab_trav
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       htab_del: POINTER
               -- typedef htab_del
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       const_basic_block: POINTER
               -- typedef const_basic_block
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       htab_hash: POINTER
               -- typedef htab_hash
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       uchar: CHARACTER
               -- typedef uchar
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       rtx: POINTER
               -- typedef rtx
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       const_gimple: POINTER
               -- typedef const_gimple
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       gimple_seq: POINTER
               -- typedef gimple_seq
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       htab_free: POINTER
               -- typedef htab_free
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       basic_block: POINTER
               -- typedef basic_block
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       bitmap: POINTER
               -- typedef bitmap
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       hashval_t: NATURAL
               -- typedef hashval_t
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       htab_t: POINTER
               -- typedef htab_t
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

end
