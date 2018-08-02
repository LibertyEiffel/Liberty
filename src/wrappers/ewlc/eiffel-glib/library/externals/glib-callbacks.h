/* Eiffel callbacks for the Glib library 

 * Copyright (C) 2007-2018: , Paolo Redaelli, EWLC team
 
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 2 of
 * the License, or (at your option) any later version.
 
 * This library is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
 * 02111-1307, USA.
 */

#ifndef _GLIB_CALLBACKS_H
#define _GLIB_CALLBACKS_H

#include <glib.h>

struct GIOFuncClosure {
	void *target;
	gboolean (*callback)(void *, GIOChannel *, GIOCondition);
};

gboolean g_io_func_closure_invoke (GIOChannel *source, GIOCondition condition, gpointer data);

int EiffelGCompareDataFunc (void *a, void *b, void *user_data);

#endif
