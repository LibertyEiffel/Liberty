/* (C) 2006 Paolo Redaelli 
   Released under Lesser General Public License v2 or later
 */
#include "callbacks.h"

#include <stdio.h>

/* gboolean  EiffelGtkTreeForeachFunc (GtkTreeModel *model, */
/* 				    GtkTreePath *path,  */
/* 				    GtkTreeIter *iter,  */
/* 				    gpointer data) { */
/*   return (0); */
/* }; */

int EiffelGtkTreeSelectionFunc (void *selection,
				void *model,
				void *path,
				int path_currently_selected,
				void *data[]) {
	/* Assumes that data is an array of pointers; the first item is the
	** address of the Eiffel callback to call, the secondo is the
	** address of Eiffel's Current
	*/
  /* printf ("EiffelGtkTreeSelectionFunc called\n"); */
	return ((/*function signature*/
	         (int (*)(void *current, void *selection,
	          void *model, void *path,
	          int path_currently_selected))
	          /* pointer to function */ data[0])
	        (/* actual arguments */
	         /* Eiffel's Current */ data[1],
	         selection, model, path,
	         path_currently_selected));
};

