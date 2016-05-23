note
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class GLIB_TRASH_STACKS
	-- Prev 	Up 	Home 	GLib Reference Manual 	Next
-- Top  |  Description
-- Trash Stacks

-- Trash Stacks %GÅ‚Äî%@ maintain a stack of unused allocated memory chunks.
	
-- Synopsis

-- #include <glib.h>


--             GTrashStack;
-- void        g_trash_stack_push              (GTrashStack **stack_p,
--                                              gpointer data_p);
-- gpointer    g_trash_stack_pop               (GTrashStack **stack_p);
-- gpointer    g_trash_stack_peek              (GTrashStack **stack_p);
-- guint       g_trash_stack_height            (GTrashStack **stack_p);

-- Description

-- A GTrashStack is an efficient way to keep a stack of unused allocated memory chunks. Each memory chunk is required to be large enough to hold a gpointer. This allows the stack to be maintained without any space overhead, since the stack pointers can be stored inside the memory chunks.

-- There is no function to create a GTrashStack. A NULL GTrashStack* is a perfectly valid empty stack.
-- Details
-- GTrashStack

-- typedef struct {
--   GTrashStack *next;
-- } GTrashStack;

-- Each piece of memory that is pushed onto the stack is cast to a GTrashStack*.
-- GTrashStack *next; 	pointer to the previous element of the stack, gets stored in the first sizeof (gpointer) bytes of the element.
-- g_trash_stack_push ()

-- void        g_trash_stack_push              (GTrashStack **stack_p,
--                                              gpointer data_p);

-- Pushes a piece of memory onto a GTrashStack.
-- stack_p : 	a pointer to a GTrashStack.
-- data_p : 	the piece of memory to push on the stack.
-- g_trash_stack_pop ()

-- gpointer    g_trash_stack_pop               (GTrashStack **stack_p);

-- Pops a piece of memory off a GTrashStack.
-- stack_p : 	a pointer to a GTrashStack.
-- Returns : 	the element at the top of the stack.
-- g_trash_stack_peek ()

-- gpointer    g_trash_stack_peek              (GTrashStack **stack_p);

-- Returns the element at the top of a GTrashStack.
-- stack_p : 	a pointer to a GTrashStack.
-- Returns : 	the element at the top of the stack.
-- g_trash_stack_height ()

-- guint       g_trash_stack_height            (GTrashStack **stack_p);

-- Returns the height of a GTrashStack.
-- stack_p : 	a pointer to a GTrashStack.
-- Returns : 	the height of the stack.
end
	
