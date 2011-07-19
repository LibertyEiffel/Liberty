This tutorial help starting with vision, the official SmartEiffel
graphic library. After reading and testing examples given in this tutorial,
you should use this graphic library with the right philosophy. When you look
for more functionnality, simply use short command.

You really should begin with chapters 1) 2) and 3). Reading order is free for
the next ones.

The last part of this document list most common problems.

It is useless to just compile programs and run them. You need to read the code
to discover what you can do with it (buttons used, wheel action...)
Most programs are really very short.

NOTE: windows need 'map' to appear on the screen.
(0,0) is the upper left corner.

1) The famous "hello_world": basic framework.
   Read the file tutorial/vision/hello_world/hello.e

   Now you should really read 'short widget.e'.

2) Basic examples.
   In tutorial/vision/basic_examples you'll learn more about events,
   layout, unicode...

3) Layouts and widgets size.
   In tutorial/vision/layout you'll find:
   fixed_widgets.e: show how layouts handle fixed size widgets,
   shrink_expand.e: show how layouts handle shrink_allowed and
		     expand_allowed parameters,
   align.e: how to put widgets on the left and right side from his container.
	    alignment_constants.e for more information.

   Shrink need to enable shrink for the containers. Shrink is limited to
   to min size (min_width, min_height).
   Drawing (next chapter) give an example where you create your own layout.

4) Free style drawing.
   tutorial/vision/drawing/free_drawing*.e
   Note: the good way for free style drawing is to write a new layout
	 (DON'T write new sub_window)

5) Modal and non modal windows
   Modal windows are created using the following sequence:
   vision.new_loop/create window/vision.start
   For non modal windows use create window as usual.
   tutorial/vision/modal/modal.e

6) Images.
   Not yet ready (work in progress).

7) Standard widgets
   Directory tutorial/vision/widget is here to show how to use some standard
   widgets like text_input fields, menus, combo boxes...

8) Cooperative multi-tasking.
   You should first look tutorial/sequencer/example*.e
   In tutorial/vision/multi_tasking, read clock.e (compile exemple1.e)
   Your graphic program may wait data from multiple source (files) 
   and wait for user requests (from the user interface) at the same time and
   do some periodic work. Just add jobs to vision.loop_stack.


Some common problems. I expect to list more common errors. If you lost time
to find something relatives to SmartVision who is not here,
please let us know.

- When/howto draw?
Only in function called by expose_event signal.
Never call expose_event.
Never paint when you receive events other than expose_event (ex: button_down)
When you want to change informations on the screen, you should update drawing informations and use clear area. Thus area will be updated with latest contents because expose_event signal is emitted.

- Some part is never displayed.
May be some container is a window and you need to call 'map'.

- Shrink or expand failed to work.
Check parent's containers mode. If you chose shrink for some label but it's
parent is not shrinkable, then shrink won't happen as the label is protected
by it's container. If you set a widget as expandable, it's parent often need
to be expandable.
