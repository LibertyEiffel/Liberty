/*
	Author: Paolo Redaelli, Natalia B. Bidart
	Copyright (C) 2006-2017: Paolo Radaelli
	Copyright (C) 2006-2017: Soluciones Informaticas Libres S.A. (Except)
	
	This library is free software; you can redistribute it and/or
	modify it under the terms of the GNU Lesser General Public License
	as published by the Free Software Foundation; either version 2.1 of
	the License, or (at your option) any later version.
					
	This library is distributed in the hope that it will be useful, but
	WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
	Lesser General Public License for more details.

	You should have received a copy of the GNU Lesser General Public
	License along with this library; if not, write to the Free Software
	Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
	02110-1301 USA
*/
#include "callbacks.h"

#include <stdio.h>

CallbackClosure *new_curl_closure (void *C, void *f) {
    CallbackClosure *result;
    result = malloc (sizeof(CallbackClosure));
    result->Current = C;
    result->function = f;
    return result;
}

CallbackClosure *free_closure (CallbackClosure *c) {
	free (c);
	c = NULL;
	return c;
}

/* gboolean EiffelGtkTreeForeachFunc (GtkTreeModel *model, */
/* 				    GtkTreePath *path,  */
/* 				    GtkTreeIter *iter,  */
/* 				    gpointer data) { */
/*   return (0); */
/* }; */

int EiffelGtkTreeSelectionFunc (void *selection,
				void *model,
				void *path,
				int path_currently_selected,
				CallbackClosure *data) {
  void *current;
  int (*function)(void *, void *, void *, void *, int);
  /* printf ("EiffelGtkTreeSelectionFunc called\n"); */
  current = data->Current;
  /* casting data[0], a pointer to function into the function
     signature*/
  function = data->function; //((int)(void *, void *, void *, void *, int)) data[0];
  return function(current,
		  selection, model, path,
		  path_currently_selected));
};

