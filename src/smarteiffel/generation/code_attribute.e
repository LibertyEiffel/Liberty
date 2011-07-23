-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class CODE_ATTRIBUTE
   --
   -- Unique Global Object in charge of a Code_attribute as
   -- describe in the JVM specification.
   -- Obviously, the same object is recycled for all code part.
   --

insert
   GLOBALS

feature {ANY}
   stack_level: INTEGER
         -- Used to compute `max_stack'

   item (index: INTEGER): INTEGER is
         -- Mostly to write assertion (equivalent to `code.item(index)').
      do
         Result := code.item(index)
      end

feature {METHOD_INFO}
   clear is
      do
         code.clear_count
         exception_table.clear
         line_number_table.clear_count
         max_stack := 0
         stack_level := 0
         max_locals := jvm.max_locals
      end

   store_in (storage: STRING) is
      local
         i: INTEGER
      do
         append_u2(storage, constant_pool.idx_constant_utf8)
         check
            program_counter > 0
         end
         append_u4(storage, 12 + program_counter + exception_table.length + line_number_table.length)
         append_u2(storage, max_stack)
         append_u2(storage, max_locals)
         append_u4(storage, program_counter)
         from
            i := 0
         until
            i > code.upper
         loop
            append_u1(storage, code.item(i))
            i := i + 1
         end
         exception_table.store_in(storage)
         -- attribute_count :
         line_number_table.store_in(storage)
      end

feature {ANY}
   program_counter: INTEGER is
      do
         Result := code.count
      end

   extra_local (local_type: TYPE_MARK): INTEGER is
      require
         local_type.is_static
      do
         Result := max_locals
         max_locals := max_locals + local_type.jvm_stack_space
      end

   extra_local_size1: INTEGER is
      do
         Result := max_locals
         max_locals := max_locals + 1
      end

feature {ANY} -- opcode feature list :
   opcode_nop is
      do
         opcode(0, 0)
      end

   opcode_aconst_null is
      do
         opcode(1, 1)
      end

   opcode_iconst_m1 is
      do
         opcode(2, 1)
      end

   opcode_iconst_0 is
      do
         opcode(3, 1)
      end

   opcode_iconst_1 is
      do
         opcode(4, 1)
      end

   opcode_iconst_i (n: INTEGER) is
      require
         n.in_range(-1, 5)
      do
         opcode(3 + n, 1)
      end

   opcode_lconst_0 is
      do
         opcode(9, 2)
      end

   opcode_lconst_1 is
      do
         opcode(10, 2)
      end

   opcode_lconst_i (n: INTEGER) is
      require
         0 <= n
         n <= 1
      do
         opcode(9 + n, 2)
      end

   opcode_fconst_0 is
      do
         opcode(11, 1)
      end

   opcode_dconst_0 is
      do
         opcode(14, 2)
      end

   opcode_bipush (byte: INTEGER) is
         -- Sign-extended value.
      require
         -128 <= byte and then byte <= 127
      do
         opcode(16, 1)
         if byte < 0 then
            add_u1(256 + byte)
         else
            add_u1(byte)
         end
      end

   opcode_sipush (u2: INTEGER) is
      require
         -32768 < u2 and then u2 <= 32767
      do
         opcode(17, 1)
         if u2 < 0 then
            add_u2(32768 + u2)
         else
            add_u2(u2)
         end
      end

   opcode_ldc (idx: INTEGER) is
         -- For both ldc and ldc_w.
      require
         constant_pool.valid_index(idx)
      do
         if idx < 255 then
            opcode(18, 1)
            add_u1(idx)
         else
            opcode(19, 1)
            add_u2(idx)
         end
      end

   opcode_fload (index: INTEGER) is
      require
         index.in_range(0, 65535)
      do
         if index <= 3 then
            opcode(34 + index, 1)
         else
            if index > 255 then
               opcode_wide
               opcode(23, 1)
               add_u2(index)
            else
               opcode(23, 1)
               add_u1(index)
            end
         end
      end

   opcode_dload_0 is
      do
         opcode(38, 2)
      end

   opcode_dload (index: INTEGER) is
      require
         index.in_range(0, 65535)
      do
         if index <= 3 then
            opcode(38 + index, 2)
         else
            if index > 255 then
               opcode_wide
               opcode(24, 1)
               add_u2(index)
            else
               opcode(24, 1)
               add_u1(index)
            end
         end
      end

   opcode_aload (index: INTEGER) is
      require
         index.in_range(0, 65535)
      do
         if index <= 3 then
            opcode(42 + index, 1)
         else
            if index > 255 then
               opcode_wide
               opcode(25, 1)
               add_u2(index)
            else
               opcode(25, 1)
               add_u1(index)
            end
         end
      end

   opcode_iload_0 is
      do
         opcode(26, 1)
      end

   opcode_iload_1 is
      do
         opcode(27, 1)
      end

   opcode_iload_2 is
      do
         opcode(28, 1)
      end

   opcode_iload_3 is
      do
         opcode(29, 1)
      end

   opcode_iload (index: INTEGER) is
      require
         index.in_range(0, 65535)
      do
         if index <= 3 then
            opcode(26 + index, 1)
         else
            if index > 255 then
               opcode_wide
               opcode(21, 1)
               add_u2(index)
            else
               opcode(21, 1)
               add_u1(index)
            end
         end
      end

   opcode_lload_0 is
      do
         opcode(30, 2)
      end

   opcode_lload_1 is
      do
         opcode(31, 2)
      end

   opcode_lload_2 is
      do
         opcode(32, 2)
      end

   opcode_lload_3 is
      do
         opcode(33, 2)
      end

   opcode_lload (index: INTEGER) is
      require
         index.in_range(0, 65535)
      do
         if index <= 3 then
            opcode(30 + index, 2)
         else
            if index > 255 then
               opcode_wide
               opcode(22, 1)
               add_u2(index)
            else
               opcode(22, 1)
               add_u1(index)
            end
         end
      end

   opcode_aload_0 is
      do
         opcode(42, 1)
      end

   opcode_aload_1 is
      do
         opcode(43, 1)
      end

   opcode_aload_2 is
      do
         opcode(44, 1)
      end

   opcode_aload_3 is
      do
         opcode(45, 1)
      end

   opcode_iaload is
      do
         opcode(46, -1)
      end

   opcode_laload is
      do
         opcode(47, 0)
      end

   opcode_faload is
      do
         opcode(48, -1)
      end

   opcode_daload is
      do
         opcode(49, 0)
      end

   opcode_aaload is
      do
         opcode(50, -1)
      end

   opcode_baload is
      do
         opcode(51, -1)
      end

   opcode_caload is
      do
         opcode(52, -1)
      end

   opcode_saload is
      do
         opcode(53, -1)
      end

   opcode_istore_3 is
      do
         opcode(62, -1)
      end

   opcode_istore (offset: INTEGER) is
      require
         offset.in_range(0, 65535)
      do
         if offset <= 3 then
            opcode(59 + offset, -1)
         else
            if offset > 255 then
               opcode_wide
               opcode(54, -1)
               add_u2(offset)
            else
               opcode(54, -1)
               add_u1(offset)
            end
         end
      end

   opcode_lstore (offset: INTEGER) is
      require
         offset.in_range(0, 65535)
      do
         if offset <= 3 then
            opcode(63 + offset, -1)
         else
            if offset > 255 then
               opcode_wide
               opcode(55, -1)
               add_u2(offset)
            else
               opcode(55, -1)
               add_u1(offset)
            end
         end
      end

   opcode_fstore (offset: INTEGER) is
      require
         offset.in_range(0, 65535)
      do
         if offset <= 3 then
            opcode(67 + offset, -1)
         else
            if offset > 255 then
               opcode_wide
               opcode(56, -1)
               add_u2(offset)
            else
               opcode(56, -1)
               add_u1(offset)
            end
         end
      end

   opcode_dstore (offset: INTEGER) is
      require
         offset.in_range(0, 65535)
      do
         if offset <= 3 then
            opcode(71 + offset, -1)
         else
            if offset > 255 then
               opcode_wide
               opcode(57, -1)
               add_u2(offset)
            else
               opcode(57, -1)
               add_u1(offset)
            end
         end
      end

   opcode_astore_0 is
      do
         opcode(75, -1)
      end

   opcode_astore_1 is
      do
         opcode(76, -1)
      end

   opcode_astore_2 is
      do
         opcode(77, -1)
      end

   opcode_astore_3 is
      do
         opcode(78, -1)
      end

   opcode_astore (offset: INTEGER) is
      require
         offset.in_range(0, 65535)
      do
         if offset <= 3 then
            opcode(75 + offset, -1)
         else
            if offset > 255 then
               opcode_wide
               opcode(58, -1)
               add_u2(offset)
            else
               opcode(58, -1)
               add_u1(offset)
            end
         end
      end

   opcode_iastore is
      do
         opcode(79, -3)
      end

   opcode_lastore is
      do
         opcode(80, -4)
      end

   opcode_fastore is
      do
         opcode(81, -3)
      end

   opcode_dastore is
      do
         opcode(82, -4)
      end

   opcode_aastore is
      do
         opcode(83, -3)
      end

   opcode_bastore is
      do
         opcode(84, -3)
      end

   opcode_castore is
      do
         opcode(85, -3)
      end

   opcode_sastore is
      do
         opcode(86, -3)
      end

   opcode_pop is
      do
         opcode(87, -1)
      end

   opcode_pop2 is
      do
         opcode(88, -2)
      end

   opcode_dup is
      do
         opcode(89, 1)
      end

   opcode_dup_x1 is
      do
         opcode(90, 1)
      end

   opcode_dup_x2 is
      do
         opcode(91, 1)
      end

   opcode_dup2 is
      do
         opcode(92, 2)
      end

   opcode_dup2_x1 is
      do
         opcode(93, 2)
      end

   opcode_swap is
      do
         opcode(95, 0)
      end

   opcode_iadd is
      do
         opcode(96, -1)
      end

   opcode_ladd is
      do
         opcode(97, -2)
      end

   opcode_fadd is
      do
         opcode(98, -1)
      end

   opcode_dadd is
      do
         opcode(99, -2)
      end

   opcode_isub is
      do
         opcode(100, -1)
      end

   opcode_lsub is
      do
         opcode(101, -2)
      end

   opcode_fsub is
      do
         opcode(102, -1)
      end

   opcode_dsub is
      do
         opcode(103, -2)
      end

   opcode_imul is
      do
         opcode(104, -1)
      end

   opcode_lmul is
      do
         opcode(105, -2)
      end

   opcode_fmul is
      do
         opcode(106, -1)
      end

   opcode_dmul is
      do
         opcode(107, -2)
      end

   opcode_idiv is
      do
         opcode(108, -1)
      end

   opcode_ldiv is
      do
         opcode(109, -2)
      end

   opcode_fdiv is
      do
         opcode(110, -1)
      end

   opcode_ddiv is
      do
         opcode(111, -2)
      end

   opcode_irem is
      do
         opcode(112, -1)
      end

   opcode_lrem is
      do
         opcode(113, -2)
      end

   opcode_ineg is
      do
         opcode(116, 0)
      end

   opcode_lneg is
      do
         opcode(117, 0)
      end

   opcode_fneg is
      do
         opcode(118, 0)
      end

   opcode_dneg is
      do
         opcode(119, 0)
      end

   opcode_ishl is
      do
         opcode(120, -1)
      end

   opcode_lshl is
      do
         opcode(121, -2)
      end

   opcode_ishr is
      do
         opcode(122, -1)
      end

   opcode_lshr is
      do
         opcode(123, -2)
      end

   opcode_iushr is
      do
         opcode(124, -1)
      end

   opcode_lushr is
      do
         opcode(125, -2)
      end

   opcode_iand is
      do
         opcode(126, -1)
      end

   opcode_land is
      do
         opcode(127, -2)
      end

   opcode_ior is
      do
         opcode(128, -1)
      end

   opcode_lor is
      do
         opcode(129, -2)
      end

   opcode_ixor is
      do
         opcode(130, -1)
      end

   opcode_lxor is
      do
         opcode(131, -2)
      end

   opcode_iinc (loc_idx, u1_increment: INTEGER) is
      do
         opcode(132, 0)
         add_u1(loc_idx)
         add_u1(u1_increment)
      end

   opcode_i2l is
      do
         opcode(133, 1)
      end

   opcode_i2f is
      do
         opcode(134, 0)
      end

   opcode_i2d is
      do
         opcode(135, 1)
      end

   opcode_l2i is
      do
         opcode(136, -1)
      end

   opcode_l2f is
      do
         opcode(137, -1)
      end

   opcode_l2d is
      do
         opcode(138, 0)
      end

   opcode_f2i is
      do
         opcode(139, 0)
      end

   opcode_f2l is
      do
         opcode(140, 1)
      end

   opcode_f2d is
      do
         opcode(141, 1)
      end

   opcode_d2i is
      do
         opcode(142, -1)
      end

   opcode_d2l is
      do
         opcode(143, 0)
      end

   opcode_d2f is
      do
         opcode(144, -1)
      end

   opcode_i2b is
      do
         opcode(145, 0)
      end

   opcode_i2c is
      do
         opcode(146, 0)
      end

   opcode_i2s is
      do
         opcode(147, 0)
      end

   opcode_lcmp is
      do
         opcode(148, -3)
      end

   opcode_fcmpg is
      do
         opcode(150, -1)
      end

   opcode_fcmpl is
      do
         opcode(149, -1)
      end

   opcode_dcmpl is
      do
         opcode(151, -3)
      end

   opcode_dcmpg is
      do
         opcode(152, -3)
      end

   opcode_ifeq: INTEGER is
      do
         opcode(153, -1)
         Result := skip_2_bytes
      end

   opcode_ifne: INTEGER is
      do
         opcode(154, -1)
         Result := skip_2_bytes
      end

   opcode_iflt: INTEGER is
      do
         opcode(155, -1)
         Result := skip_2_bytes
      end

   opcode_ifge: INTEGER is
      do
         opcode(156, -1)
         Result := skip_2_bytes
      end

   opcode_ifgt: INTEGER is
      do
         opcode(157, -1)
         Result := skip_2_bytes
      end

   opcode_ifle: INTEGER is
      do
         opcode(158, -1)
         Result := skip_2_bytes
      end

   opcode_if_icmpeq: INTEGER is
      do
         opcode(159, -2)
         Result := skip_2_bytes
      end

   opcode_if_icmpne: INTEGER is
      do
         opcode(160, -2)
         Result := skip_2_bytes
      end

   opcode_if_icmplt: INTEGER is
      do
         opcode(161, -2)
         Result := skip_2_bytes
      end

   opcode_if_icmpge: INTEGER is
      do
         opcode(162, -2)
         Result := skip_2_bytes
      end

   opcode_if_icmpgt: INTEGER is
      do
         opcode(163, -2)
         Result := skip_2_bytes
      end

   opcode_if_icmple: INTEGER is
      do
         opcode(164, -2)
         Result := skip_2_bytes
      end

   opcode_if_acmpeq: INTEGER is
      do
         opcode(165, -2)
         Result := skip_2_bytes
      end

   opcode_if_acmpne: INTEGER is
      do
         opcode(166, -2)
         Result := skip_2_bytes
      end

   opcode_goto: INTEGER is
      do
         opcode(167, 0)
         Result := skip_2_bytes
      end

   opcode_goto_backward (back_point: INTEGER) is
         -- Produce a goto opcode to go back at `back_point'.
      require
         back_point < program_counter
      local
         r, q, offset: INTEGER
      do
         offset := program_counter - back_point
         opcode(167, 0)
         r := offset \\ 256
         q := offset // 256
         if r = 0 then
            add_u1(256 - q)
            add_u1(0)
         else
            add_u1(255 - q)
            add_u1(256 - r)
         end
      end

   opcode_ireturn is
      do
         add_u1(172)
      end

   opcode_lreturn is
      do
         add_u1(173)
      end

   opcode_freturn is
      do
         add_u1(174)
      end

   opcode_dreturn is
      do
         add_u1(175)
      end

   opcode_areturn is
      do
         add_u1(176)
      end

   opcode_return is
      do
         add_u1(177)
      end

   opcode_getstatic (fieldref_idx, stack_inc: INTEGER) is
      require
         constant_pool.valid_index(fieldref_idx)
      do
         opcode(178, stack_inc)
         add_u2(fieldref_idx)
      end

   opcode_putstatic (fieldref_idx, stack_inc: INTEGER) is
      require
         constant_pool.valid_index(fieldref_idx)
      do
         opcode(179, stack_inc)
         add_u2(fieldref_idx)
      end

   opcode_getfield (fieldref_idx, stack_inc: INTEGER) is
      require
         constant_pool.valid_index(fieldref_idx)
      do
         opcode(180, stack_inc)
         add_u2(fieldref_idx)
      end

   opcode_putfield (fieldref_idx, stack_inc: INTEGER) is
      require
         constant_pool.valid_index(fieldref_idx)
      do
         opcode(181, stack_inc)
         add_u2(fieldref_idx)
      end

   opcode_invokevirtual (methodref_idx, stack_inc: INTEGER) is
      require
         constant_pool.is_methodref(methodref_idx)
      do
         opcode(182, stack_inc)
         add_u2(methodref_idx)
      end

   opcode_invokespecial (methodref_idx, stack_inc: INTEGER) is
      require
         constant_pool.is_methodref(methodref_idx)
      do
         opcode(183, stack_inc)
         add_u2(methodref_idx)
      end

   opcode_invokestatic (methodref_idx, stack_inc: INTEGER) is
      require
         constant_pool.is_methodref(methodref_idx)
      do
         opcode(184, stack_inc)
         add_u2(methodref_idx)
      end

   opcode_invokeinterface (methodref_idx, stack_inc, stack_words: INTEGER) is
      require
         constant_pool.is_interface_methodref(methodref_idx)
      do
         opcode(185, stack_inc)
         add_u2(methodref_idx)
         add_u1(stack_words)
         opcode_nop
      end

   opcode_new (class_idx: INTEGER) is
      require
         constant_pool.is_class(class_idx)
      do
         opcode(187, 1)
         add_u2(class_idx)
      end

   opcode_newarray (u1: INTEGER) is
      require
         4 <= u1
         u1 <= 11
      do
         opcode(188, 0)
         add_u1(u1)
      end

   opcode_anewarray (idx: INTEGER) is
      require
         constant_pool.valid_index(idx)
      do
         opcode(189, 0)
         add_u2(idx)
      end

   opcode_arraylength is
      do
         opcode(190, 0)
      end

   opcode_athrow is
      do
         opcode(191, 0)
      end

   opcode_checkcast (class_idx: INTEGER) is
      require
         constant_pool.is_class(class_idx)
      do
         opcode(192, 0)
         add_u2(class_idx)
      end

feature {}
   opcode_wide is
         -- Extends some JVM opcodes ; should never be used alone !
      do
         opcode(196, 0)
      end

feature {MANIFEST_STRING_INSPECTOR}
   opcode_tableswitch (lower, upper: INTEGER; points: FAST_ARRAY[INTEGER]): INTEGER is
      require
         points /= Void
         upper > lower
      local
         i: INTEGER
      do
         points.make(upper - lower + 1)
         opcode(170, -1)
         pad_4
         Result := skip_4_bytes
         add_u4(lower)
         add_u4(upper)
         from
            i := lower
         until
            i > upper
         loop
            points.put(skip_4_bytes, i - lower)
            i := i + 1
         end
      end

   opcode_lookupswitch (values: FAST_ARRAY[INTEGER]; points: FAST_ARRAY[INTEGER]): INTEGER is
         -- THE `values' ARRAY WILL BE SORTED!
      require
         points /= Void
         values.count > 0
      local
         i: INTEGER; cs: COLLECTION_SORTER[INTEGER]
      do
         points.make(values.count)
         cs.sort(values)
         opcode(171, -1)
         pad_4
         Result := skip_4_bytes
         add_u4(values.count)
         from
            i := values.lower
         until
            i > values.upper
         loop
            add_u4(values.item(i))
            points.put(skip_4_bytes, i)
            i := i + 1
         end
      ensure
      --values_sorted: (create {COLLECTION_SORTER[INTEGER]}).is_sorted(values)
      end

   resolve_tableswitch_branch (opcode_pc: INTEGER; points: FAST_ARRAY[INTEGER]; index: INTEGER) is
      require
         points.valid_index(index)
         item(opcode_pc) = 170
         opcode_pc < program_counter -- `points' has been set by `opcode_tableswitch'
      do
         resolve_u4_branch(points.item(index), opcode_pc)
      end

   resolve_lookupswitch_branch (opcode_pc: INTEGER; points: FAST_ARRAY[INTEGER]; index: INTEGER) is
      require
         points.valid_index(index)
         item(opcode_pc) = 171
         opcode_pc < program_counter -- `points' has been set by `opcode_lookupswitch'
      do
         resolve_u4_branch(points.item(index), opcode_pc)
      end

   resolve_tableswitch_default_branch (opcode_pc, start_point: INTEGER) is
      require
         opcode_pc < program_counter
         item(opcode_pc) = 170 -- `start_point' is the point returned by `opcode_tableswitch'
      do
         resolve_u4_branch(start_point, opcode_pc)
      end

   resolve_lookupswitch_default_branch (opcode_pc, start_point: INTEGER) is
      require
         item(opcode_pc) = 171
         opcode_pc < program_counter -- `start_point' is the point returned by `opcode_lookupswitch'
      do
         resolve_u4_branch(start_point, opcode_pc)
      end

feature {}
   resolve_u4_branch (branch_point, from_pc: INTEGER) is
      local
         offset: INTEGER
      do
         offset := program_counter - from_pc
         put_code(offset |>>> 24 & 0x000000FF, branch_point)
         put_code(offset |>>> 16 & 0x000000FF, branch_point + 1)
         put_code(offset |>>> 8 & 0x000000FF, branch_point + 2)
         put_code(offset & 0x000000FF, branch_point + 3)
      end

feature {LIVE_TYPE, NATIVE}
   opcode_instanceof (class_idx: INTEGER) is
      require
         constant_pool.is_class(class_idx)
      do
         opcode(193, 0)
         add_u2(class_idx)
      end

feature {NATIVE}
   opcode_monitorenter is
      do
         opcode(194, 0)
      end

   opcode_monitorexit is
      do
         opcode(195, 0)
      end

feature {ANY}
   opcode_multianewarray (idx: INTEGER; dims: INTEGER) is
      require
         constant_pool.valid_index(idx)
         dims > 0 and dims < 256
      do
         opcode(197, 0)
         add_u2(idx)
         add_u1(dims)
      end

feature {ANY}
   opcode_ifnull: INTEGER is
      do
         opcode(198, -1)
         Result := skip_2_bytes
      end

   opcode_ifnonnull: INTEGER is
      do
         opcode(199, -1)
         Result := skip_2_bytes
      end

feature {ANY} -- High level opcode calls:
   opcode_push_integer (i: INTEGER) is
         -- Push `i' on the stack by using one word on the Java Virtual Machine stack.
      do
         if i < -32768 then
            push_large_integer_using_ldc(i)
         elseif i < -128 then
            opcode_sipush(i)
         elseif i < -1 then
            opcode_bipush(256 + i)
         elseif i <= 5 then
            opcode_iconst_i(i)
         elseif i <= 127 then
            opcode_bipush(i)
         elseif i <= 32767 then
            opcode_sipush(i)
         else
            push_large_integer_using_ldc(i)
         end
      end

   opcode_push_integer_value (i: INTEGER_64; dest_bit_count: INTEGER) is
         -- Push `i' on the stack by respecting the given needed space.
      do
          inspect dest_bit_count
          when 8 then
             opcode_bipush(i.to_integer_32)
          when 16 then
             opcode_sipush(i.to_integer_32)
          when 32 then
             inspect i
             when -1, 0, 1, 2, 3, 4, 5 then
                opcode_iconst_i(i.to_integer_32)
             else
                push_large_integer_using_ldc(i.to_integer_32)
             end
          when 64 then
             push_strange_long(i)
          end
      end

   opcode_push_long (i: INTEGER_64) is
      do
         if i < 0 then
            push_strange_long(i)
         elseif i <= 1 then
            opcode_lconst_i(i.to_integer_32)
         else
            push_strange_long(i)
         end
      end

   opcode_push_as_float (str: STRING) is
      require
         str.count >= 1
      do
         inspect
            str.item(1)
         when '0' then
            if str.count = 1 then
               opcode(11, 1)
            else
               inspect
                  str.item(2)
               when '.' then
                  if str.count = 2 then
                     opcode(11, 1)
                  elseif str.count = 3 and then str.item(3) = '0' then
                     opcode(11, 1)
                  else
                     opcode_string2float(str)
                  end
               else
                  opcode_string2float(str)
               end
            end
         when '1' then
            if str.count = 1 then
               opcode(12, 1)
            else
               inspect
                  str.item(2)
               when '.' then
                  if str.count = 2 then
                     opcode(12, 1)
                  elseif str.count = 3 and then str.item(3) = '0' then
                     opcode(12, 1)
                  else
                     opcode_string2float(str)
                  end
               else
                  opcode_string2float(str)
               end
            end
         when '2' then
            if str.count = 1 then
               opcode(13, 1)
            else
               inspect
                  str.item(2)
               when '.' then
                  if str.count = 2 then
                     opcode(13, 1)
                  elseif str.count = 3 and then str.item(3) = '0' then
                     opcode(13, 1)
                  else
                     opcode_string2float(str)
                  end
               else
                  opcode_string2float(str)
               end
            end
         else
            opcode_string2float(str)
         end
      end

   opcode_push_as_double (str: STRING) is
      require
         str.count >= 1
      do
         inspect
            str.item(1)
         when '0' then
            if str.count = 1 then
               opcode(14, 2)
            else
               inspect
                  str.item(2)
               when '.' then
                  if str.count = 2 then
                     opcode(14, 2)
                  elseif str.count = 3 and then str.item(3) = '0' then
                     opcode(14, 2)
                  else
                     opcode_string2double(str)
                  end
               else
                  opcode_string2double(str)
               end
            end
         when '1' then
            if str.count = 1 then
               opcode(15, 2)
            else
               inspect
                  str.item(2)
               when '.' then
                  if str.count = 2 then
                     opcode(15, 2)
                  elseif str.count = 3 and then str.item(3) = '0' then
                     opcode(15, 2)
                  else
                     opcode_string2double(str)
                  end
               else
                  opcode_string2double(str)
               end
            end
         else
            opcode_string2double(str)
         end
      end

   opcode_push_manifest_string (ms: STRING) is
         -- Produces code to push the corresponding Eiffel STRING.
      local
         ms_idx: INTEGER
      do
         ms_idx := constant_pool.idx_string2(ms)
         opcode_ldc(ms_idx)
         opcode_java_string2eiffel_string
      end

   opcode_java_string2bytes_array is
         -- Used the pushed Java String to create the bytes array.
      local
         idx: INTEGER
      do
         idx := constant_pool.idx_methodref3(once "java/lang/String", once "getBytes", once "()[B")
         opcode_invokevirtual(idx, 0)
      end

   opcode_java_string2eiffel_string is
         -- Used the pushed Java String to create a new Eiffel STRING.
      do
         opcode_java_string2bytes_array
         opcode_bytes_array2eiffel_string
      end

   opcode_bytes_array2eiffel_string is
         -- Used the pushed Bytes array to create a new Eiffel STRING.
      local
         cp: like constant_pool; loc: INTEGER; rc_string: LIVE_TYPE
      do
         cp := constant_pool
         rc_string := smart_eiffel.type_string.live_type
         loc := extra_local_size1
         opcode_astore(loc)
         -- The new STRING :
         rc_string.jvm_basic_new
         -- Set count :
         opcode_dup
         opcode_aload(loc)
         opcode_arraylength
         opcode_putfield(cp.idx_eiffel_string_count_fieldref, -2)
         -- Set capacity :
         opcode_dup
         opcode_aload(loc)
         opcode_arraylength
         opcode_putfield(cp.idx_eiffel_string_capacity_fieldref, -2)
         -- Set storage :
         opcode_dup
         opcode_aload(loc)
         opcode_putfield(cp.idx_eiffel_string_storage_fieldref, -2)
      end

feature {ANY} -- Easy access to some Java basics:
   opcode_println (string_idx: INTEGER) is
      require
         constant_pool.valid_index(string_idx)
      local
         idx: INTEGER
      do
         opcode_ldc(string_idx)
         idx := constant_pool.idx_methodref3(once "java/io/PrintStream", once "println", once "(Ljava/lang/String;)V")
         opcode_invokevirtual(idx, -2)
      end

feature {}
   opcode (opcode_value, max_stack_increment: INTEGER) is
      require
         stack_level >= 0
         opcode_value.in_range(0, 255)
      local
         cs: INTEGER
      do
         add_u1(opcode_value)
         cs := stack_level + max_stack_increment
         if cs >= 0 then
            stack_level := cs
         else
            -- ????
         end
         if stack_level > max_stack then
            max_stack := stack_level
         end
      ensure
         stack_level >= 0
      end

   add_u1 (u1: INTEGER) is
         -- Add 1 unsigned byte in the `code' area.
      require
         u1.in_range(0, 255)
      do
         code.add_last(u1.to_integer_16)
      ensure
         program_counter = 1 + old program_counter
         code.count = old code.count + 1
         code.last = u1
      end

   add_u2 (u2: INTEGER) is
         -- Add 2 bytes in the `code' area.
      require
         u2.in_range(0, 65355)
      local
         u: INTEGER_16
      do
         u := u2.low_16
         code.add_last(u.high_8)
         code.add_last(u.low_8)
      end

   skip_2_bytes: INTEGER is
         -- Return the `programm_counter' before the skip.
      do
         Result := program_counter
         add_u1(0)
         add_u1(0)
      end

   add_u4 (u4: INTEGER_64) is
         -- Add 4 bytes in the `code' area.
      local
         i32: INTEGER_32
      do
         i32 := u4.low_32
         add_u2(i32.high_16)
         add_u2(i32.low_16)
      ensure
         program_counter = 4 + old program_counter
      end

   skip_4_bytes: INTEGER is
         -- Return the `programm_counter' before the skip.
         -- Used by tableswitch and lookupswitch
      do
         Result := program_counter
         add_u1(0)
         add_u1(0)
         add_u1(0)
         add_u1(0)
      end

   pad_4 is
      do
         from
         until
            program_counter \\ 4 = 0
         loop
            add_u1(0)
         end
      ensure
         program_counter \\ 4 = 0
      end

feature {ANY}
   resolve_u2_branch (start_point: INTEGER) is
      require
         start_point < program_counter
         start_point > 0
      local
         offset: INTEGER
      do
         offset := program_counter - start_point + 1
         put_code(offset // 256, start_point)
         put_code(offset \\ 256, start_point + 1)
      end

feature {ANY}
   next_branch_array_index: INTEGER

   get_branch_array_index: INTEGER is
      require
         next_branch_array_index >= 0
      local
         fai: FAST_ARRAY[INTEGER]
      do
         branch_array.item(next_branch_array_index).clear_count
         Result := next_branch_array_index
         next_branch_array_index := next_branch_array_index + 1
         if not branch_array.valid_index(next_branch_array_index) then
            create fai.with_capacity(16)
            branch_array.force(fai, next_branch_array_index)
         end
      end

   release_branch_array_index is
      do
         next_branch_array_index := next_branch_array_index - 1
      ensure
         next_branch_array_index >= 0
      end

   add_branch (point: INTEGER; index: INTEGER) is
      require
         branch_array.valid_index(index)
      do
         branch_array.item(index).add_last(point)
      ensure
         branch_array.item(index).has(point)
      end

   branch_array: FAST_ARRAY[FAST_ARRAY[INTEGER]] is
      local
         fai: FAST_ARRAY[INTEGER]
      once
         create Result.with_capacity(4)
         create fai.with_capacity(16)
         branch_array.force(fai, 0)
         create fai.with_capacity(16)
         branch_array.force(fai, 1)
         create fai.with_capacity(16)
         branch_array.force(fai, 2)
         create fai.with_capacity(16)
         branch_array.force(fai, 3)
      end

   resolve_branches (index: INTEGER) is
      do
         resolve_with(branch_array.item(index))
      end

   resolve_with (points: FAST_ARRAY[INTEGER]) is
      local
         i: INTEGER
      do
         from
            i := points.upper
         until
            i < 0
         loop
            resolve_u2_branch(points.item(i))
            i := i - 1
         end
      end

feature {}
   check_flag_idx, skip_check: INTEGER

feature {ASSERTION_LIST}
   check_opening is
      local
         cp: like constant_pool
      do
         cp := constant_pool
         opcode_iconst_1
         check_flag_idx := cp.idx_fieldref3(jvm_root_class, once "check_flag", once "B")
         opcode_getstatic(check_flag_idx, 1)
         skip_check := opcode_ifne
         opcode_putstatic(check_flag_idx, -1)
      end

   check_closing is
      do
         opcode_iconst_0
         opcode_putstatic(check_flag_idx, -1)
         resolve_u2_branch(skip_check)
      end

feature {}
   opcode_string2double (str: STRING) is
      local
         idx: INTEGER
      do
         idx := constant_pool.idx_string(str)
         opcode_ldc(idx)
         idx := constant_pool.idx_methodref3(once "java/lang/Double", once "parseDouble", once "(Ljava/lang/String;)D")
         opcode_invokestatic(idx, 1)
      end

   opcode_string2float (str: STRING) is
      do
         opcode_string2double(str)
         opcode_d2f
      end

feature {}
   push_large_integer_using_ldc (i: INTEGER_64) is
      local
         idx: INTEGER; view: STRING
      do
         view := once "..................................."
         view.clear_count
         i.append_in(view)
         idx := constant_pool.idx_string(view)
         opcode_ldc(idx)
         idx := constant_pool.idx_methodref3(once "java/lang/Integer", once "parseInt", once "(Ljava/lang/String;)I")
         opcode_invokestatic(idx, 0)
      end

feature {INTEGER_CONSTANT}
   push_strange_long (i: INTEGER_64) is
      local
         idx: INTEGER; cp: like constant_pool
      do
         cp := constant_pool
         tmp_string.clear_count
         i.append_in(tmp_string)
         idx := cp.idx_string(tmp_string)
         opcode_ldc(idx)
         idx := cp.idx_methodref3(once "java/lang/Long", once "parseLong", once "(Ljava/lang/String;)J")
         opcode_invokestatic(idx, 0)
      end

feature {}
   tmp_string: STRING is
      once
         create Result.make(32)
      end

feature {}
   exception_table: EXCEPTION_TABLE is
      once
         create Result.make
      end

feature {ANY}
   add_exception (f, t, h, idx: INTEGER) is
      do
         exception_table.add(f, t, h, idx)
      end

feature {ANY} -- Calls to SmartEiffelRuntime.java :
   runtime_die_with_code is
         -- Assume the status code is already pushed.
      local
         cp: like constant_pool; idx: INTEGER
      do
         cp := constant_pool
         idx := cp.idx_methodref3(fz_se_runtime, as_die_with_code, once "(I)V")
         opcode_invokestatic(idx, -1)
      end

   runtime_internal_exception_number is
      local
         cp: like constant_pool; idx: INTEGER
      do
         cp := constant_pool
         idx := cp.idx_fieldref3(fz_se_runtime, once "internal_exception_number", once "I")
         opcode_getstatic(idx, 1)
      end

   runtime_error (p: POSITION; t: TYPE_MARK; message: STRING) is
      local
         cp: like constant_pool; idx: INTEGER
      do
         cp := constant_pool
         push_position(p)
         if t = Void then
            opcode_aconst_null
         else
            opcode_ldc(cp.idx_string(t.written_mark))
         end
         opcode_ldc(cp.idx_string(message))
         idx := cp.idx_methodref3(fz_se_runtime, once "runtime_error", once "(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V")
         opcode_invokestatic(idx, -5)
      end

   runtime_error_bad_target (p: POSITION; t: TYPE; message: STRING) is
         -- Assume the bad target is pushed.
         -- The expected type, if any is `t'.
      local
         cp: like constant_pool; idx: INTEGER
      do
         cp := constant_pool
         push_position(p)
         opcode_ldc(cp.idx_string(t.name.to_string))
         if message = Void then
            opcode_aconst_null
         else
            opcode_ldc(cp.idx_string(message))
         end
         idx := cp.idx_methodref3(fz_se_runtime, "runtime_error_bad_target", "(Ljava/lang/Object;IILjava/lang/String;Ljava/lang/String;%
         %Ljava/lang/String;)V")
         opcode_invokestatic(idx, -6)
      end

feature {LOOP_INSTRUCTION}
   runtime_check_loop_variant (type: TYPE; expression: EXPRESSION) is
         -- Assume the loop counter and the previous variant value
         -- is already pushed.
         -- Returns the next variant value.
      require
         expression /= Void
      local
         cp: like constant_pool; idx: INTEGER
      do
         cp := constant_pool
         expression.compile_to_jvm(type)
         push_position(expression.start_position)
         idx := cp.idx_methodref3(fz_se_runtime, "runtime_check_loop_variant", "(IIIIILjava/lang/String;)I")
         opcode_invokestatic(idx, -5)
      end

feature {INSPECT_STATEMENT, MANIFEST_STRING_INSPECTOR}
   runtime_error_inspect (type: TYPE; expression: EXPRESSION) is
         -- Assume the not selected inspect value of `expression' is
         -- already pushed.
      local
         cp: like constant_pool; rt: TYPE; idx: INTEGER
      do
         cp := constant_pool
         rt := expression.resolve_in(type)
         if rt.is_character then
            --|*** Convert byte 2 int ??
         end
         push_position(expression.start_position)
         idx := cp.idx_methodref3(fz_se_runtime, "runtime_error_inspect", "(IIILjava/lang/String;)I")
         opcode_invokestatic(idx, -3)
      end

feature {COMPOUND}
   se_trace (ct: TYPE_MARK; p: POSITION) is
         -- Assume the Current target of type `ct' is pushed.
      require
         p.sedb_trace
      local
         cp: like constant_pool; idx: INTEGER
      do
         if p.is_unknown then
            opcode_pop
         else
            cp := constant_pool
            ct.jvm_push_local(0)
            push_position(p)
            tmp_string.clear_count
            tmp_string.extend('(')
            if ct.is_kernel_expanded then
               ct.jvm_descriptor_in(tmp_string)
            else
               tmp_string.append("Ljava/lang/Object;")
            end
            tmp_string.append("IILjava/lang/String;)V")
            idx := cp.idx_methodref3(fz_se_runtime, "se_trace", tmp_string)
            opcode_invokestatic(idx, - ct.jvm_stack_space - 3)
         end
      end

feature {}
   put_code (c, i: INTEGER) is
         -- Puts the code `c' at index `i'
      require
         c.in_range(0, 255)
         code.valid_index(i)
      do
         code.put(c.to_integer_16, i)
      ensure
         item(i) = c
      end

   push_position (p: POSITION) is
      do
         opcode_push_integer(p.line)
         opcode_push_integer(p.column)
         if p.is_unknown then
            opcode_aconst_null
         else
            opcode_ldc(constant_pool.idx_string(p.path))
         end
      end

feature {}
   code: FAST_ARRAY[INTEGER_16] is
      once
         create Result.with_capacity(1024)
      end

   max_stack: INTEGER
         -- To compute the maximum size of the operand stack.

   max_locals: INTEGER

invariant
   stack_level >= 0

   stack_level <= max_stack

end -- class CODE_ATTRIBUTE
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- SmartEiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- SmartEiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with SmartEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2004: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
