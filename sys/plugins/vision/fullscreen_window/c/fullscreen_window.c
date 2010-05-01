/*
-- ------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2005: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
-- documentation files (the "Software"), to deal in the Software without restriction, including without
-- limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
-- the Software, and to permit persons to whom the Software is furnished to do so, subject to the following
-- conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
-- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
-- AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
-- OR OTHER DEALINGS IN THE SOFTWARE.
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------
*/

#ifdef WIN32
#else
#include <X11/extensions/xf86vmode.h>

static XF86VidModeModeInfo normal_mode;
#endif


void* basic_fullscreen_window_create(int w, int h)
{
#ifdef WIN32
	return NULL;
#else
	int screen, count, best_mode = 0, i;
	void* win;
	XF86VidModeModeInfo** modes;

	screen = DefaultScreen(dpy);
	XF86VidModeGetAllModeLines(dpy, screen, &count, &modes);
	normal_mode = *modes[0];
	for(i = 0; i < count; i++)
		if((modes[i]->hdisplay == w) && (modes[i]->vdisplay == h))
		{
			best_mode = i;
			i = count;
		}
	XF86VidModeSwitchToMode(dpy, screen, modes[best_mode]);
	XF86VidModeSetViewPort(dpy, screen, 0, 0);
	XFree(modes);
	win = (void*)basic_window_create(0, 0, w, h, (void*)RootWindow(dpy, screen), False);
	basic_window_map(win); // Window need to be mapped for grabbing to work
	XGrabKeyboard(dpy, (Window)win, True, GrabModeAsync, GrabModeAsync, CurrentTime);
	XGrabPointer(dpy, (Window)win, True, ButtonPressMask, GrabModeAsync, GrabModeAsync, (Window)win, None, CurrentTime);
	return (void*)win;
#endif
}

void basic_fullscreen_window_destroy_proc()
{
#ifdef WIN32
#else
	XF86VidModeSwitchToMode(dpy, DefaultScreen(dpy), &normal_mode);
	XF86VidModeSetViewPort(dpy, DefaultScreen(dpy), 0, 0);
#endif
}
