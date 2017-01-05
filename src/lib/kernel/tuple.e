-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--

class TUPLE -- Empty TUPLE definition.

inherit
   ANY
      redefine out_in_tagged_out_memory, is_equal
      end

create {ANY}
   default_create

feature {ANY}
   count: INTEGER
      do
         Result := 0
      end

   out_in_tagged_out_memory
      do
         tagged_out_memory.append(once "[]")
      end

   is_equal (other: like Current): BOOLEAN
      do
         Result := count = other.count
      end

end -- TUPLE



class TUPLE [A_] -- One field TUPLE definition.

inherit
   TUPLE
      redefine count, out_in_tagged_out_memory, is_equal
      end

create {ANY}
   make_1, default_create

feature {ANY}
   count: INTEGER
      do
         Result := 1
      end

   item_1: A_

   set_item_1, set_first (i1: like item_1)
      do
         item_1 := i1
      ensure
         item_1 = i1
      end

   first: like item_1
         -- A well-known alias for `item_1'
      do
         Result := item_1
      end

   make_1 (i1: like item_1)
      do
         item_1 := i1
      ensure
         item_1 = i1
      end

   out_in_tagged_out_memory
      do
         tagged_out_memory.extend('[')
         if item_1 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_1.out_in_tagged_out_memory
         end
         tagged_out_memory.extend(']')
      end

   is_equal (other: like Current): BOOLEAN
      do
         Result := count = other.count
            and then (item_1 = other.item_1
                      or else (item_1 /= Void and then other.item_1 /= Void
                               and then item_1.is_equal(other.item_1)))
      end

end -- TUPLE 1



class TUPLE [A_, B_] -- Two fields TUPLE definition.

inherit
   TUPLE [A_]
      redefine count, out_in_tagged_out_memory, is_equal
      end

create {ANY}
   make_2, default_create

feature {ANY}
   count: INTEGER
      do
         Result := 2
      end

   item_2: B_

   set_item_2, set_second (i2: like item_2)
      do
         item_2 := i2
      ensure
         item_2 = i2
      end

   second: like item_2
         -- A well-known alias for `item_2'
      do
         Result := item_2
      end

   make_2 (i1: like item_1; i2: like item_2)
      do
         item_1 := i1
         item_2 := i2
      ensure
         item_1 = i1
         item_2 = i2
      end

   out_in_tagged_out_memory
      do
         tagged_out_memory.extend('[')
         if item_1 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_1.out_in_tagged_out_memory
         end
         tagged_out_memory.append(once ", ")
         if item_2 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_2.out_in_tagged_out_memory
         end
         tagged_out_memory.extend(']')
      end

   is_equal (other: like Current): BOOLEAN
      do
         Result := count = other.count
            and then (item_1 = other.item_1
                      or else (item_1 /= Void and then other.item_1 /= Void
                               and then item_1.is_equal(other.item_1)))
            and then (item_2 = other.item_2
                      or else (item_2 /= Void and then other.item_2 /= Void
                               and then item_2.is_equal(other.item_2)))
      end

end -- TUPLE 2



class TUPLE [A_, B_, C_] -- Three fields TUPLE definition.

inherit
   TUPLE [A_, B_]
      redefine count, out_in_tagged_out_memory, is_equal
      end

create {ANY}
   make_3, default_create

feature {ANY}
   count: INTEGER
      do
         Result := 3
      end

   item_3: C_

   set_item_3, set_third (i3: like item_3)
      do
         item_3 := i3
      ensure
         item_3 = i3
      end

   third: like item_3
         -- A well-known alias for `item_3'
      do
         Result := item_3
      end

   make_3 (i1: like item_1; i2: like item_2; i3: like item_3)
      do
         item_1 := i1
         item_2 := i2
         item_3 := i3
      ensure
         item_1 = i1
         item_2 = i2
         item_3 = i3
      end

   out_in_tagged_out_memory
      do
         tagged_out_memory.extend('[')
         if item_1 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_1.out_in_tagged_out_memory
         end
         tagged_out_memory.append(once ", ")
         if item_2 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_2.out_in_tagged_out_memory
         end
         tagged_out_memory.append(once ", ")
         if item_3 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_3.out_in_tagged_out_memory
         end
         tagged_out_memory.extend(']')
      end

   is_equal (other: like Current): BOOLEAN
      do
         Result := count = other.count
            and then (item_1 = other.item_1
                      or else (item_1 /= Void and then other.item_1 /= Void
                               and then item_1.is_equal(other.item_1)))
            and then (item_2 = other.item_2
                      or else (item_2 /= Void and then other.item_2 /= Void
                               and then item_2.is_equal(other.item_2)))
            and then (item_3 = other.item_3
                      or else (item_3 /= Void and then other.item_3 /= Void
                               and then item_3.is_equal(other.item_3)))
      end

end -- TUPLE 3



class TUPLE [A_, B_, C_, D_] -- Four fields TUPLE definition.

inherit
   TUPLE [A_, B_, C_]
      redefine count, out_in_tagged_out_memory, is_equal
      end

create {ANY}
   make_4, default_create

feature {ANY}
   count: INTEGER
      do
         Result := 4
      end

   item_4: D_

   set_item_4, set_fourth (i4: like item_4)
      do
         item_4 := i4
      ensure
         item_4 = i4
      end

   fourth: like item_4
         -- A well-known alias for `item_4'
      do
         Result := item_4
      end

   make_4 (i1: like item_1; i2: like item_2; i3: like item_3; i4: like item_4)
      do
         item_1 := i1
         item_2 := i2
         item_3 := i3
         item_4 := i4
      ensure
         item_1 = i1
         item_2 = i2
         item_3 = i3
         item_4 = i4
      end

   out_in_tagged_out_memory
      do
         tagged_out_memory.extend('[')
         if item_1 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_1.out_in_tagged_out_memory
         end
         tagged_out_memory.append(once ", ")
         if item_2 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_2.out_in_tagged_out_memory
         end
         tagged_out_memory.append(once ", ")
         if item_3 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_3.out_in_tagged_out_memory
         end
         tagged_out_memory.append(once ", ")
         if item_4 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_4.out_in_tagged_out_memory
         end
         tagged_out_memory.extend(']')
      end

   is_equal (other: like Current): BOOLEAN
      do
         Result := count = other.count
            and then (item_1 = other.item_1
                      or else (item_1 /= Void and then other.item_1 /= Void
                               and then item_1.is_equal(other.item_1)))
            and then (item_2 = other.item_2
                      or else (item_2 /= Void and then other.item_2 /= Void
                               and then item_2.is_equal(other.item_2)))
            and then (item_3 = other.item_3
                      or else (item_3 /= Void and then other.item_3 /= Void
                               and then item_3.is_equal(other.item_3)))
            and then (item_4 = other.item_4
                      or else (item_4 /= Void and then other.item_4 /= Void
                               and then item_4.is_equal(other.item_4)))
      end

end -- TUPLE 4



class TUPLE [A_, B_, C_, D_, E_] -- Five fields TUPLE definition.

inherit
   TUPLE [A_, B_, C_, D_]
      redefine count, out_in_tagged_out_memory, is_equal
      end

create {ANY}
   make_5, default_create

feature {ANY}
   count: INTEGER
      do
         Result := 5
      end

   item_5: E_

   set_item_5, set_fifth (i5: like item_5)
      do
         item_5 := i5
      ensure
         item_5 = i5
      end

   fifth: like item_5
         -- A well-known alias for `item_5'
      do
         Result := item_5
      end

   make_5 (i1: like item_1; i2: like item_2; i3: like item_3; i4: like item_4; i5: like item_5)
      do
         item_1 := i1
         item_2 := i2
         item_3 := i3
         item_4 := i4
         item_5 := i5
      ensure
         item_1 = i1
         item_2 = i2
         item_3 = i3
         item_4 = i4
         item_5 = i5
      end

   out_in_tagged_out_memory
      do
         tagged_out_memory.extend('[')
         if item_1 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_1.out_in_tagged_out_memory
         end
         tagged_out_memory.append(once ", ")
         if item_2 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_2.out_in_tagged_out_memory
         end
         tagged_out_memory.append(once ", ")
         if item_3 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_3.out_in_tagged_out_memory
         end
         tagged_out_memory.append(once ", ")
         if item_4 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_4.out_in_tagged_out_memory
         end
         tagged_out_memory.append(once ", ")
         if item_5 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_5.out_in_tagged_out_memory
         end
         tagged_out_memory.extend(']')
      end

   is_equal (other: like Current): BOOLEAN
      do
         Result := count = other.count
            and then (item_1 = other.item_1
                      or else (item_1 /= Void and then other.item_1 /= Void
                               and then item_1.is_equal(other.item_1)))
            and then (item_2 = other.item_2
                      or else (item_2 /= Void and then other.item_2 /= Void
                               and then item_2.is_equal(other.item_2)))
            and then (item_3 = other.item_3
                      or else (item_3 /= Void and then other.item_3 /= Void
                               and then item_3.is_equal(other.item_3)))
            and then (item_4 = other.item_4
                      or else (item_4 /= Void and then other.item_4 /= Void
                               and then item_4.is_equal(other.item_4)))
            and then (item_5 = other.item_5
                      or else (item_5 /= Void and then other.item_5 /= Void
                               and then item_5.is_equal(other.item_5)))
      end

end -- TUPLE 5



class TUPLE [A_, B_, C_, D_, E_, F_] -- Six fields TUPLE definition.

inherit
   TUPLE [A_, B_, C_, D_, E_]
      redefine count, out_in_tagged_out_memory, is_equal
      end

create {ANY}
   make_6, default_create

feature {ANY}
   count: INTEGER
      do
         Result := 6
      end

   item_6: F_

   set_item_6 (i6: like item_6)
      do
         item_6 := i6
      ensure
         item_6 = i6
      end

   make_6 (i1: like item_1; i2: like item_2; i3: like item_3; i4: like item_4; i5: like item_5; i6: like item_6)
      do
         item_1 := i1
         item_2 := i2
         item_3 := i3
         item_4 := i4
         item_5 := i5
         item_6 := i6
      ensure
         item_1 = i1
         item_2 = i2
         item_3 = i3
         item_4 = i4
         item_5 = i5
         item_6 = i6
      end

   out_in_tagged_out_memory
      do
         tagged_out_memory.extend('[')
         if item_1 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_1.out_in_tagged_out_memory
         end
         tagged_out_memory.append(once ", ")
         if item_2 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_2.out_in_tagged_out_memory
         end
         tagged_out_memory.append(once ", ")
         if item_3 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_3.out_in_tagged_out_memory
         end
         tagged_out_memory.append(once ", ")
         if item_4 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_4.out_in_tagged_out_memory
         end
         tagged_out_memory.append(once ", ")
         if item_5 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_5.out_in_tagged_out_memory
         end
         tagged_out_memory.append(once ", ")
         if item_6 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_6.out_in_tagged_out_memory
         end
         tagged_out_memory.extend(']')
      end

   is_equal (other: like Current): BOOLEAN
      do
         Result := count = other.count
            and then (item_1 = other.item_1
                      or else (item_1 /= Void and then other.item_1 /= Void
                               and then item_1.is_equal(other.item_1)))
            and then (item_2 = other.item_2
                      or else (item_2 /= Void and then other.item_2 /= Void
                               and then item_2.is_equal(other.item_2)))
            and then (item_3 = other.item_3
                      or else (item_3 /= Void and then other.item_3 /= Void
                               and then item_3.is_equal(other.item_3)))
            and then (item_4 = other.item_4
                      or else (item_4 /= Void and then other.item_4 /= Void
                               and then item_4.is_equal(other.item_4)))
            and then (item_5 = other.item_5
                      or else (item_5 /= Void and then other.item_5 /= Void
                               and then item_5.is_equal(other.item_5)))
            and then (item_6 = other.item_6
                      or else (item_6 /= Void and then other.item_6 /= Void
                               and then item_6.is_equal(other.item_6)))
      end

end -- TUPLE 6



class TUPLE [A_, B_, C_, D_, E_, F_, G_] -- Seven fields TUPLE definition.

inherit
   TUPLE [A_, B_, C_, D_, E_, F_]
      redefine count, out_in_tagged_out_memory, is_equal
      end

create {ANY}
   make_7, default_create

feature {ANY}
   count: INTEGER
      do
         Result := 7
      end

   item_7: G_

   set_item_7 (i7: like item_7)
      do
         item_7 := i7
      ensure
         item_7 = i7
      end

   make_7 (i1: like item_1; i2: like item_2; i3: like item_3;
           i4: like item_4;i5: like item_5; i6: like item_6; i7: like item_7)
      do
         item_1 := i1
         item_2 := i2
         item_3 := i3
         item_4 := i4
         item_5 := i5
         item_6 := i6
         item_7 := i7
      ensure
         item_1 = i1
         item_2 = i2
         item_3 = i3
         item_4 = i4
         item_5 = i5
         item_6 = i6
         item_7 = i7
      end

   out_in_tagged_out_memory
      do
         tagged_out_memory.extend('[')
         if item_1 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_1.out_in_tagged_out_memory
         end
         tagged_out_memory.append(once ", ")
         if item_2 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_2.out_in_tagged_out_memory
         end
         tagged_out_memory.append(once ", ")
         if item_3 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_3.out_in_tagged_out_memory
         end
         tagged_out_memory.append(once ", ")
         if item_4 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_4.out_in_tagged_out_memory
         end
         tagged_out_memory.append(once ", ")
         if item_5 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_5.out_in_tagged_out_memory
         end
         tagged_out_memory.append(once ", ")
         if item_6 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_6.out_in_tagged_out_memory
         end
         tagged_out_memory.append(once ", ")
         if item_7 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_7.out_in_tagged_out_memory
         end
         tagged_out_memory.extend(']')
      end

   is_equal (other: like Current): BOOLEAN
      do
         Result := count = other.count
            and then (item_1 = other.item_1
                      or else (item_1 /= Void and then other.item_1 /= Void
                               and then item_1.is_equal(other.item_1)))
            and then (item_2 = other.item_2
                      or else (item_2 /= Void and then other.item_2 /= Void
                               and then item_2.is_equal(other.item_2)))
            and then (item_3 = other.item_3
                      or else (item_3 /= Void and then other.item_3 /= Void
                               and then item_3.is_equal(other.item_3)))
            and then (item_4 = other.item_4
                      or else (item_4 /= Void and then other.item_4 /= Void
                               and then item_4.is_equal(other.item_4)))
            and then (item_5 = other.item_5
                      or else (item_5 /= Void and then other.item_5 /= Void
                               and then item_5.is_equal(other.item_5)))
            and then (item_6 = other.item_6
                      or else (item_6 /= Void and then other.item_6 /= Void
                               and then item_6.is_equal(other.item_6)))
            and then (item_7 = other.item_7
                      or else (item_7 /= Void and then other.item_7 /= Void
                               and then item_7.is_equal(other.item_7)))
      end

end -- TUPLE 7



class TUPLE [A_, B_, C_, D_, E_, F_, G_, H_] -- Eight fields TUPLE definition.

inherit
   TUPLE [A_, B_, C_, D_, E_, F_, G_]
      redefine count, out_in_tagged_out_memory, is_equal
      end

create {ANY}
   make_8, default_create

feature {ANY}
   count: INTEGER
      do
         Result := 8
      end

   item_8: H_

   set_item_8 (i8: like item_8)
      do
         item_8 := i8
      ensure
         item_8 = i8
      end

   make_8 (i1: like item_1; i2: like item_2; i3: like item_3; i4: like item_4;
           i5: like item_5; i6: like item_6; i7: like item_7; i8: like item_8)
      do
         item_1 := i1
         item_2 := i2
         item_3 := i3
         item_4 := i4
         item_5 := i5
         item_6 := i6
         item_7 := i7
         item_8 := i8
      ensure
         item_1 = i1
         item_2 = i2
         item_3 = i3
         item_4 = i4
         item_5 = i5
         item_6 = i6
         item_7 = i7
         item_8 = i8
      end

   out_in_tagged_out_memory
      do
         tagged_out_memory.extend('[')
         if item_1 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_1.out_in_tagged_out_memory
         end
         tagged_out_memory.append(once ", ")
         if item_2 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_2.out_in_tagged_out_memory
         end
         tagged_out_memory.append(once ", ")
         if item_3 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_3.out_in_tagged_out_memory
         end
         tagged_out_memory.append(once ", ")
         if item_4 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_4.out_in_tagged_out_memory
         end
         tagged_out_memory.append(once ", ")
         if item_5 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_5.out_in_tagged_out_memory
         end
         tagged_out_memory.append(once ", ")
         if item_6 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_6.out_in_tagged_out_memory
         end
         tagged_out_memory.append(once ", ")
         if item_7 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_7.out_in_tagged_out_memory
         end
         tagged_out_memory.append(once ", ")
         if item_8 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_8.out_in_tagged_out_memory
         end
         tagged_out_memory.extend(']')
      end

   is_equal (other: like Current): BOOLEAN
      do
         Result := count = other.count
            and then (item_1 = other.item_1
                      or else (item_1 /= Void and then other.item_1 /= Void
                               and then item_1.is_equal(other.item_1)))
            and then (item_2 = other.item_2
                      or else (item_2 /= Void and then other.item_2 /= Void
                               and then item_2.is_equal(other.item_2)))
            and then (item_3 = other.item_3
                      or else (item_3 /= Void and then other.item_3 /= Void
                               and then item_3.is_equal(other.item_3)))
            and then (item_4 = other.item_4
                      or else (item_4 /= Void and then other.item_4 /= Void
                               and then item_4.is_equal(other.item_4)))
            and then (item_5 = other.item_5
                      or else (item_5 /= Void and then other.item_5 /= Void
                               and then item_5.is_equal(other.item_5)))
            and then (item_6 = other.item_6
                      or else (item_6 /= Void and then other.item_6 /= Void
                               and then item_6.is_equal(other.item_6)))
            and then (item_7 = other.item_7
                      or else (item_7 /= Void and then other.item_7 /= Void
                               and then item_7.is_equal(other.item_7)))
            and then (item_8 = other.item_8
                      or else (item_8 /= Void and then other.item_8 /= Void
                               and then item_8.is_equal(other.item_8)))
      end

end -- TUPLE 8



class TUPLE [A_, B_, C_, D_, E_, F_, G_, H_, I_] -- Nine fields TUPLE definition.

inherit
   TUPLE [A_, B_, C_, D_, E_, F_, G_, H_]
      redefine count, out_in_tagged_out_memory, is_equal
      end

create {ANY}
   make_9, default_create

feature {ANY}
   count: INTEGER
      do
         Result := 9
      end

   item_9: I_

   set_item_9 (i9: like item_9)
      do
         item_9 := i9
      ensure
         item_9 = i9
      end

   make_9 (i1: like item_1; i2: like item_2; i3: like item_3; i4: like item_4;
           i5: like item_5; i6: like item_6; i7: like item_7; i8: like item_8; i9: like item_9)
      do
         item_1 := i1
         item_2 := i2
         item_3 := i3
         item_4 := i4
         item_5 := i5
         item_6 := i6
         item_7 := i7
         item_8 := i8
         item_9 := i9
      ensure
         item_1 = i1
         item_2 = i2
         item_3 = i3
         item_4 = i4
         item_5 = i5
         item_6 = i6
         item_7 = i7
         item_8 = i8
         item_9 = i9
      end

   out_in_tagged_out_memory
      do
         tagged_out_memory.extend('[')
         if item_1 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_1.out_in_tagged_out_memory
         end
         tagged_out_memory.append(once ", ")
         if item_2 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_2.out_in_tagged_out_memory
         end
         tagged_out_memory.append(once ", ")
         if item_3 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_3.out_in_tagged_out_memory
         end
         tagged_out_memory.append(once ", ")
         if item_4 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_4.out_in_tagged_out_memory
         end
         tagged_out_memory.append(once ", ")
         if item_5 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_5.out_in_tagged_out_memory
         end
         tagged_out_memory.append(once ", ")
         if item_6 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_6.out_in_tagged_out_memory
         end
         tagged_out_memory.append(once ", ")
         if item_7 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_7.out_in_tagged_out_memory
         end
         tagged_out_memory.append(once ", ")
         if item_8 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_8.out_in_tagged_out_memory
         end
         tagged_out_memory.append(once ", ")
         if item_9 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_9.out_in_tagged_out_memory
         end
         tagged_out_memory.extend(']')
      end

   is_equal (other: like Current): BOOLEAN
      do
         Result := count = other.count
            and then (item_1 = other.item_1
                      or else (item_1 /= Void and then other.item_1 /= Void
                               and then item_1.is_equal(other.item_1)))
            and then (item_2 = other.item_2
                      or else (item_2 /= Void and then other.item_2 /= Void
                               and then item_2.is_equal(other.item_2)))
            and then (item_3 = other.item_3
                      or else (item_3 /= Void and then other.item_3 /= Void
                               and then item_3.is_equal(other.item_3)))
            and then (item_4 = other.item_4
                      or else (item_4 /= Void and then other.item_4 /= Void
                               and then item_4.is_equal(other.item_4)))
            and then (item_5 = other.item_5
                      or else (item_5 /= Void and then other.item_5 /= Void
                               and then item_5.is_equal(other.item_5)))
            and then (item_6 = other.item_6
                      or else (item_6 /= Void and then other.item_6 /= Void
                               and then item_6.is_equal(other.item_6)))
            and then (item_7 = other.item_7
                      or else (item_7 /= Void and then other.item_7 /= Void
                               and then item_7.is_equal(other.item_7)))
            and then (item_8 = other.item_8
                      or else (item_8 /= Void and then other.item_8 /= Void
                               and then item_8.is_equal(other.item_8)))
            and then (item_9 = other.item_9
                      or else (item_9 /= Void and then other.item_9 /= Void
                               and then item_9.is_equal(other.item_9)))
      end

end -- TUPLE 9



class TUPLE [A_, B_, C_, D_, E_, F_, G_, H_, I_, J_] -- Ten fields TUPLE definition.
   --
   -- Note: If your application really needs more than 10 fields in some TUPLE object, you should
   -- probably consider to use an ordinary hand-written class !
   -- If you _really_ want more than 10 fields for TUPLE, you may also consider to use your own
   -- definition of the tuple.e class file.
   --
inherit
   TUPLE [A_, B_, C_, D_, E_, F_, G_, H_, I_]
      redefine count, out_in_tagged_out_memory, is_equal
      end

create {ANY}
   make_10, default_create

feature {ANY}
   count: INTEGER
      do
         Result := 10
      end

   item_10: J_

   set_item_10 (i10: like item_10)
      do
         item_10 := i10
      ensure
         item_10 = i10
      end

   make_10 (i1: like item_1; i2: like item_2; i3: like item_3; i4: like item_4; i5: like item_5;
            i6: like item_6; i7: like item_7; i8: like item_8; i9: like item_9; i10: like item_10)
      do
         item_1 := i1
         item_2 := i2
         item_3 := i3
         item_4 := i4
         item_5 := i5
         item_6 := i6
         item_7 := i7
         item_8 := i8
         item_9 := i9
         item_10 := i10
      ensure
         item_1 = i1
         item_2 = i2
         item_3 = i3
         item_4 = i4
         item_5 = i5
         item_6 = i6
         item_7 = i7
         item_8 = i8
         item_9 = i9
         item_10 = i10
      end

   out_in_tagged_out_memory
      do
         tagged_out_memory.extend('[')
         if item_1 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_1.out_in_tagged_out_memory
         end
         tagged_out_memory.append(once ", ")
         if item_2 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_2.out_in_tagged_out_memory
         end
         tagged_out_memory.append(once ", ")
         if item_3 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_3.out_in_tagged_out_memory
         end
         tagged_out_memory.append(once ", ")
         if item_4 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_4.out_in_tagged_out_memory
         end
         tagged_out_memory.append(once ", ")
         if item_5 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_5.out_in_tagged_out_memory
         end
         tagged_out_memory.append(once ", ")
         if item_6 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_6.out_in_tagged_out_memory
         end
         tagged_out_memory.append(once ", ")
         if item_7 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_7.out_in_tagged_out_memory
         end
         tagged_out_memory.append(once ", ")
         if item_8 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_8.out_in_tagged_out_memory
         end
         tagged_out_memory.append(once ", ")
         if item_9 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_9.out_in_tagged_out_memory
         end
         tagged_out_memory.append(once ", ")
         if item_10 = Void then
            tagged_out_memory.append(once "Void")
         else
            item_10.out_in_tagged_out_memory
         end
         tagged_out_memory.extend(']')
      end

   is_equal (other: like Current): BOOLEAN
      do
         Result := count = other.count
            and then (item_1 = other.item_1
                      or else (item_1 /= Void and then other.item_1 /= Void
                               and then item_1.is_equal(other.item_1)))
            and then (item_2 = other.item_2
                      or else (item_2 /= Void and then other.item_2 /= Void
                               and then item_2.is_equal(other.item_2)))
            and then (item_3 = other.item_3
                      or else (item_3 /= Void and then other.item_3 /= Void
                               and then item_3.is_equal(other.item_3)))
            and then (item_4 = other.item_4
                      or else (item_4 /= Void and then other.item_4 /= Void
                               and then item_4.is_equal(other.item_4)))
            and then (item_5 = other.item_5
                      or else (item_5 /= Void and then other.item_5 /= Void
                               and then item_5.is_equal(other.item_5)))
            and then (item_6 = other.item_6
                      or else (item_6 /= Void and then other.item_6 /= Void
                               and then item_6.is_equal(other.item_6)))
            and then (item_7 = other.item_7
                      or else (item_7 /= Void and then other.item_7 /= Void
                               and then item_7.is_equal(other.item_7)))
            and then (item_8 = other.item_8
                      or else (item_8 /= Void and then other.item_8 /= Void
                               and then item_8.is_equal(other.item_8)))
            and then (item_9 = other.item_9
                      or else (item_9 /= Void and then other.item_9 /= Void
                               and then item_9.is_equal(other.item_9)))
            and then (item_10 = other.item_10
                      or else (item_10 /= Void and then other.item_10 /= Void
                               and then item_10.is_equal(other.item_10)))
      end

end -- TUPLE 10
--
-- Copyright (C) 2009-2017: by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
