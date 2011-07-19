int mini_gtk_init( int   argc,
          char *argv[] )
{
    /* This is called in all GTK applications. Arguments are parsed
     * from the command line and are returned to the application. */
    gtk_init (&argc, &argv);

    return argc;
}

void callback_agent(GtkObject *object, gpointer user_data) {
  mini_gtk_launch_routine(mini_gtk_agent_launcher(), user_data);
}
