/*
-- ------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2005: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- OpenGL plugin: Pierre-Nicolas CLAUSS
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

struct window_context
{
	void* window;
	void* context;
#ifdef WIN32
	void* instance;
	void* dc;
#endif
};

#ifdef WIN32
#include <windows.h>
#include <gl\glaux.h>
#else
#include <X11/Xlib.h>
#include <GL/glx.h>

extern Display* dpy;
#endif

extern void* se_malloc(size_t);
extern void* basic_window_create(int, int, int, int, void*, int);
extern void basic_window_map(void*);
extern void basic_window_set_geometry(void *, int, int, int, int);

void* basic_opengl_window_create(int x, int y, int w, int h, void* parent, int decorate)
{
	struct window_context* wx = (struct window_context*)se_malloc(sizeof(struct window_context));
#ifdef WIN32
	unsigned int PixelFormat;
	WNDCLASS wc;
	RECT rect;
	DWORD dwExStyle, dwStyle;
	static PIXELFORMATDESCRIPTOR pfd = {
		sizeof(PIXELFORMATDESCRIPTOR),
		1,
		PFD_DRAW_TO_WINDOW | PFD_SUPPORT_OPENGL | PFD_DOUBLEBUFFER,
		PFD_TYPE_RGBA,
		16,
		0, 0, 0, 0, 0, 0,
		0,
		0,
		0,
		0, 0, 0, 0,
		16,
		0,
		0,
		PFD_MAIN_PLANE,
		0,
		0, 0, 0
	};
	
	wx->instance = (void*)GetModuleHandle(NULL);
	rect.left = 0;
	rect.right = w;
	rect.top = 0;
	rect.bottom = h;
	wc.style = CS_HREDRAW | CS_VREDRAW | CS_OWNDC;
	wc.lpfnWndProc = NULL;
	wc.cbClsExtra = 0;
	wc.cbWndExtra = 0;
	wc.hInstance = (HINSTANCE)wx->instance;
	wc.hIcon = NULL;
	wc.hCursor = LoadCursor(NULL, IDC_ARROW);
	wc.hbrBackground = NULL;
	wc.lpszMenuName = NULL;
	wc.lpszClassName = "SmartGL";
	if(!RegisterClass(&wc))
	{
		free(wx);
		printf("Could not register window class\n");
		return NULL;
	}
	dwExStyle = WS_EX_APPWINDOW | WS_EX_WINDOWEDGE;
	dwStyle = WS_OVERLAPPEDWINDOW;
	AdjustWindowRectEx(&rect, dwStyle, FALSE, dwExStyle);
	wx->window = (void*)CreateWindowEx(dwExStyle, "SmartGL", NULL, dwStyle | WS_CLIPSIBLINGS | WS_CLIPCHILDREN, x, y, rect.right - rect.left, rect.bottom - rect.top, (HWND)parent, NULL, (HINSTANCE)wx->instance, NULL);
	if(!wx->window)
	{
		free(wx);
		printf("Could not create window\n");
		return NULL;
	}
	wx->dc = (void*)GetDC((HWND)wx->window);
	if(!wx->dc)
	{
		free(wx);
		printf("Could not get drawing context\n");
		return NULL;
	}
	PixelFormat = ChoosePixelFormat((HDC)wx->dc, &pfd);
	if(!PixelFormat)
	{
		free(wx);
		printf("Could not choose pixel format\n");
		return NULL;
	}
	if(!SetPixelFormat((HDC)wx->dc, PixelFormat, &pfd))
	{
		free(wx);
		printf("Could not set pixel format\n");
		return NULL;
	}
	wx->context = (void*)wglCreateContext((HDC)wx->dc);
	if(!wx->context)
	{
		free(wx);
		printf("Could not create rendering context\n");
		return NULL;
	}
	if(!wglMakeCurrent((HDC)wx->dc, (HGLRC)wx->context))
	{
		free(wx);
		printf("Could not activate rendering context\n");
		return NULL;
	}
	ShowWindow((HWND)wx->window, SW_SHOW);
	SetForegroundWindow((HWND)wx->window);
	SetFocus((HWND)wx->window);
#else
	int screen;
	XVisualInfo* vi;
	static int single_attributes[] = {GLX_RGBA, GLX_RED_SIZE, 4, GLX_GREEN_SIZE, 4, GLX_BLUE_SIZE, 4, GLX_DEPTH_SIZE, 16, None};
	static int double_attributes[] = {GLX_RGBA, GLX_DOUBLEBUFFER, GLX_RED_SIZE, 4, GLX_GREEN_SIZE, 4, GLX_BLUE_SIZE, 4, GLX_DEPTH_SIZE, 16, None};
	
	screen = DefaultScreen(dpy);
	vi = glXChooseVisual(dpy, screen, double_attributes);
	if(!vi)
	{
		vi = glXChooseVisual(dpy, screen, single_attributes);
		if(!vi)
			fprintf(stderr, "No visual found!\n");
	}
	wx->context = glXCreateContext(dpy, vi, 0, GL_TRUE);
	wx->window = basic_window_create(x, y, w, h, parent, decorate);
	basic_window_map(wx->window);
	glXMakeCurrent(dpy, (GLXDrawable)wx->window, (GLXContext)wx->context);
#endif
	return (void*)wx;
}

void basic_opengl_window_set_geometry(void* wx, int x, int y, int width, int height)
{
	basic_window_set_geometry(((struct window_context*)wx)->window, x, y, width, height);
}

int basic_opengl_select(void* wx)
{
#ifdef WIN32
	return wglMakeCurrent((HDC)((struct window_context*)wx)->dc, (HGLRC)((struct window_context*)wx)->context);
#else
	return glXMakeCurrent(dpy, (GLXDrawable)((struct window_context*)wx)->window, (GLXContext)((struct window_context*)wx)->context);
#endif
}

void basic_opengl_swap_buffers(void* wx)
{
#ifdef WIN32
	SwapBuffers((HDC)((struct window_context*)wx)->dc);
#else
	glXSwapBuffers(dpy, (GLXDrawable)((struct window_context*)wx)->window);
#endif
}

void basic_opengl_window_destroy(void* wx)
{
#ifdef WIN32
	if(((struct window_context*)wx)->context)
	{
		wglMakeCurrent(NULL, NULL);
		wglDeleteContext((HGLRC)((struct window_context*)wx)->context);
	}
	if(((struct window_context*)wx)->window)
	{
		if(((struct window_context*)wx)->dc)
			ReleaseDC((HWND)((struct window_context*)wx)->window, (HDC)((struct window_context*)wx)->dc);
		DestroyWindow((HWND)((struct window_context*)wx)->window);
	}
	UnregisterClass("SmartGL", (HINSTANCE)((struct window_context*)wx)->instance);
#else
	glXMakeCurrent(dpy, None, NULL);
	glXDestroyContext(dpy, (GLXContext)((struct window_context*)wx)->context);
#endif
	free(wx);
}
