note
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class GLIB_ATOMIC_OPERATIONS
-- Prev 	Up 	Home 	GLib Reference Manual 	Next
-- Top  |  Description
-- Atomic Operations

-- Atomic Operations %GÅ‚Äî%@ basic atomic integer and pointer operations
	
-- Synopsis

-- #include <glib.h>


-- gint        g_atomic_int_get                (gint *atomic);
-- void        g_atomic_int_add                (gint *atomic,
--                                              gint val);
-- gint        g_atomic_int_exchange_and_add   (gint *atomic,
--                                              gint val);
-- gboolean    g_atomic_int_compare_and_exchange
--                                             (gint *atomic,
--                                              gint oldval,
--                                              gint newval);
-- gpointer    g_atomic_pointer_get            (gpointer *atomic);
-- gboolean    g_atomic_pointer_compare_and_exchange
--                                             (gpointer *atomic,
--                                              gpointer oldval,
--                                              gpointer newval);
-- void        g_atomic_int_inc                (gint *atomic);
-- gboolean    g_atomic_int_dec_and_test       (gint *atomic);

-- Description

-- The following functions can be used to atomically access integers and pointers. They are implemented as inline assembler function on most platforms and use slower fall-backs otherwise. Using them can sometimes save you from using a performance-expensive GMutex to protect the integer or pointer.

-- The most important usage is reference counting. Using g_atomic_int_inc() and g_atomic_int_dec_and_test() makes reference counting a very fast operation.
-- Note

-- You must not directly read integers or pointers concurrently accessed by other threads with with the following functions directly. Always use g_atomic_int_get() and g_atomic_pointer_get() respectively. They are acting as a memory barrier.
-- Note

-- If you are using those functions for anything apart from simple reference counting, you should really be aware of the implications of doing that. There are literally thousands of ways to shoot yourself in the foot. So if in doubt, use a GMutex. If you don't know, what memory barriers are, do not use anything but g_atomic_int_inc() and g_atomic_int_dec_and_test().
-- Note

-- It is not safe to set an integer or pointer just by assigning to it, when it is concurrently accessed by other threads with the following functions. Use g_atomic_int_compare_and_exchange() or g_atomic_pointer_compare_and_exchange() respectively.
-- Details
-- g_atomic_int_get ()

-- gint        g_atomic_int_get                (gint *atomic);

-- Reads the value of the integer pointed to by atomic. Also acts as a memory barrier.
-- atomic : 	a pointer to an integer.
-- Returns : 	the value of *atomic.

-- Since 2.4
-- g_atomic_int_add ()

-- void        g_atomic_int_add                (gint *atomic,
--                                              gint val);

-- Atomically adds val to the integer pointed to by atomic. Also acts as a memory barrier.
-- atomic : 	a pointer to an integer.
-- val : 	the value to add to *atomic.

-- Since 2.4
-- g_atomic_int_exchange_and_add ()

-- gint        g_atomic_int_exchange_and_add   (gint *atomic,
--                                              gint val);

-- Atomically adds val to the integer pointed to by atomic. It returns the value of *atomic just before the addition took place. Also acts as a memory barrier.
-- atomic : 	a pointer to an integer.
-- val : 	the value to add to *atomic.
-- Returns : 	the value of *atomic before the addition.

-- Since 2.4
-- g_atomic_int_compare_and_exchange ()

-- gboolean    g_atomic_int_compare_and_exchange
--                                             (gint *atomic,
--                                              gint oldval,
--                                              gint newval);

-- Compares oldval with the integer pointed to by atomic and if they are equal, atomically exchanges *atomic with newval. Also acts as a memory barrier.
-- atomic : 	a pointer to an integer.
-- oldval : 	the assumed old value of *atomic.
-- newval : 	the new value of *atomic.
-- Returns : 	TRUE, if *atomic was equal oldval. FALSE otherwise.

-- Since 2.4
-- g_atomic_pointer_get ()

-- gpointer    g_atomic_pointer_get            (gpointer *atomic);

-- Reads the value of the pointer pointed to by atomic. Also acts as a memory barrier.
-- atomic : 	a pointer to a gpointer.
-- Returns : 	the value to add to *atomic.

-- Since 2.4
-- g_atomic_pointer_compare_and_exchange ()

-- gboolean    g_atomic_pointer_compare_and_exchange
--                                             (gpointer *atomic,
--                                              gpointer oldval,
--                                              gpointer newval);

-- Compares oldval with the pointer pointed to by atomic and if they are equal, atomically exchanges *atomic with newval. Also acts as a memory barrier.
-- atomic : 	a pointer to a gpointer.
-- oldval : 	the assumed old value of *atomic.
-- newval : 	the new value of *atomic.
-- Returns : 	TRUE, if *atomic was equal oldval. FALSE otherwise.

-- Since 2.4
-- g_atomic_int_inc ()

-- void        g_atomic_int_inc                (gint *atomic);

-- Atomically increments the integer pointed to by atomic by 1.
-- atomic : 	a pointer to an integer.

-- Since 2.4
-- g_atomic_int_dec_and_test ()

-- gboolean    g_atomic_int_dec_and_test       (gint *atomic);

-- Atomically decrements the integer pointed to by atomic by 1.
-- atomic : 	a pointer to an integer.
-- Returns : 	TRUE, if the integer pointed to by atomic is 0 after decrementing it.

-- Since 2.4
-- See Also

-- GMutex 	

-- GLib mutual exclusions.

end
