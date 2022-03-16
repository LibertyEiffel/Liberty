/*
	Author: Natalia B. Bidart
	Copyright (C) 2006-2022: Soluciones Informaticas Libres S.A. (Except)
	
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

#ifndef CULR_CALLBACL_H
#define CULR_CALLBACL_H
#ifdef __WIN32
#include <sys/types.h>
#endif /* __WIN32 */

typedef struct _CallbackClosure *CallbackClosure;

CallbackClosure new_curl_closure (void *C, void *f);

CallbackClosure free_curl_closure (CallbackClosure c);

size_t WriteCallback (void *ptr, size_t size, size_t nmemb, CallbackClosure data);

size_t ReadCallback (void *ptr, size_t size, size_t nmemb, CallbackClosure data);

typedef struct _ProgressCallbackClosure *ProgressCallbackClosure;

ProgressCallbackClosure new_curl_progress_closure (void *C, void *f);

ProgressCallbackClosure free_curl_progress_closure (CallbackClosure c);

int ProgressCallback (void *ptr, double dltotal, double dlnow, double ultotal, double ulnow, ProgressCallbackClosure data);

#endif
