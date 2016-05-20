# Generalities

Concept: abstract user interface toolkit, with many backends (from
console to web server, planning gui too).

Each widget has an id and coded behaviour.

The actual user interface provides resources in specific files, that
codes the appearance of the widgets according to their id:

 * for the web back-end, html files are interpreted and ids are used
   to fill forms
 * for the readline back-end, (todo)
 * for the curses back-end, (todo)
 * for the gui backend, (todo)


# How to add a new UI class

Note: a UI object is a widget if it can be composed in the window
panel. It can also be a menu item if it can be composed in the window
menu. Otherwise, it may be a specific UI object (there are currently
no such objects, except the window itself).


For a UI object named `FOO`:

 * add the `UI_FOO` class in `widget/` -- if it is a widget, make it
   inherit from `UI_WIDGET`. In any case, it must at least insert
   `UI_ITEM`.
 * add the `UI_BRIDGE_FOO` class in `impl/bridge/`. It must at least
   insert `UI_BRIDGE_ITEM`.
 * add the `UI_TYPED_BRIDGE_FOO[J_ -> UI_JOB]` class in
   `impl/bridge/`. It must inherit from `UI_BRIDGE_FOO` and either
   `UI_TYPED_BRIDGE_ITEM[J_]` or `UI_TYPED_BRIDGE_WIDGET[J_]` (if it
   is a widget)
 * for each backend, add the relevant classes:
     - For the web backend:
         + in `impl/bridge/web`, add the class `WEB_FOO`, make it inherit
           `UI_TYPED_BRIDGE_FOO[WEB_JOB]` and either inherit from
           `WEB_WIDGET[UI_FOO]` or at least insert `WEB_ITEM[WEB_JOB]` (if
           it is not a widget)
         + it must implement `save(context)` if some data must be saved:
           in that case, the up-level `ui` object holds the object
           properties.
         + it must implement `run(context)` if some action must be
           performed (call an agent; think button clicks); the `ui` object
           holds the agents.
         + it must implement `retrieve_name(name, extension)` that is
           called by the template parser when the page is to be sent
           to the client. The name is the name of the property to
           retrieve; the extension is a list of possible filters to
           apply.
