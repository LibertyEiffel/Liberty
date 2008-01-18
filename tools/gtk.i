%module example
 %{
 /* Includes the header in the wrapper code */
#include <gtk/gtk.h>
 %}
 
 /* Parse the header file to generate wrappers */

GtkWidget*          gtk_about_dialog_new                (void);
const gchar*        gtk_about_dialog_get_name           (GtkAboutDialog *about);
void                gtk_about_dialog_set_name           (GtkAboutDialog *about,
                                                         const gchar *name);
const gchar*        gtk_about_dialog_get_program_name   (GtkAboutDialog *about);
void                gtk_about_dialog_set_program_name   (GtkAboutDialog *about,
                                                         const gchar *name);
const gchar*        gtk_about_dialog_get_version        (GtkAboutDialog *about);
void                gtk_about_dialog_set_version        (GtkAboutDialog *about,
                                                         const gchar *version);
const gchar*        gtk_about_dialog_get_copyright      (GtkAboutDialog *about);
void                gtk_about_dialog_set_copyright      (GtkAboutDialog *about,
                                                         const gchar *copyright);
const gchar*        gtk_about_dialog_get_comments       (GtkAboutDialog *about);
void                gtk_about_dialog_set_comments       (GtkAboutDialog *about,
                                                         const gchar *comments);
const gchar*        gtk_about_dialog_get_license        (GtkAboutDialog *about);
void                gtk_about_dialog_set_license        (GtkAboutDialog *about,
                                                         const gchar *license);
gboolean            gtk_about_dialog_get_wrap_license   (GtkAboutDialog *about);
void                gtk_about_dialog_set_wrap_license   (GtkAboutDialog *about,
                                                         gboolean wrap_license);
const gchar*        gtk_about_dialog_get_website        (GtkAboutDialog *about);
void                gtk_about_dialog_set_website        (GtkAboutDialog *about,
                                                         const gchar *website);
const gchar*        gtk_about_dialog_get_website_label  (GtkAboutDialog *about);
void                gtk_about_dialog_set_website_label  (GtkAboutDialog *about,
                                                         const gchar *website_label);
const gchar* const * gtk_about_dialog_get_authors       (GtkAboutDialog *about);
void                gtk_about_dialog_set_authors        (GtkAboutDialog *about,
                                                         const gchar **authors);
const gchar* const * gtk_about_dialog_get_artists       (GtkAboutDialog *about);
void                gtk_about_dialog_set_artists        (GtkAboutDialog *about,
                                                         const gchar **artists);
const gchar* const * gtk_about_dialog_get_documenters   (GtkAboutDialog *about);
void                gtk_about_dialog_set_documenters    (GtkAboutDialog *about,
                                                         const gchar **documenters);
const gchar*        gtk_about_dialog_get_translator_credits
                                                        (GtkAboutDialog *about);
void                gtk_about_dialog_set_translator_credits
                                                        (GtkAboutDialog *about,
                                                         const gchar *translator_credits);
GdkPixbuf*          gtk_about_dialog_get_logo           (GtkAboutDialog *about);
void                gtk_about_dialog_set_logo           (GtkAboutDialog *about,
                                                         GdkPixbuf *logo);
const gchar*        gtk_about_dialog_get_logo_icon_name (GtkAboutDialog *about);
void                gtk_about_dialog_set_logo_icon_name (GtkAboutDialog *about,
                                                         const gchar *icon_name);
void                (*GtkAboutDialogActivateLinkFunc)   (GtkAboutDialog *about,
                                                         const gchar *link_,
                                                         gpointer data);
GtkAboutDialogActivateLinkFunc gtk_about_dialog_set_email_hook
                                                        (GtkAboutDialogActivateLinkFunc func,
                                                         gpointer data,
                                                         GDestroyNotify destroy);
GtkAboutDialogActivateLinkFunc gtk_about_dialog_set_url_hook
                                                        (GtkAboutDialogActivateLinkFunc func,
                                                         gpointer data,
                                                         GDestroyNotify destroy);
void                gtk_show_about_dialog               (GtkWindow *parent,
                                                         const gchar *first_property_name,
                                                         ...);
