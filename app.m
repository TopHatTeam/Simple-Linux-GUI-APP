#define __GNUSTEP_RUNTIME__
#import <GNUstep/Foundation/Foundation.h>
#import <GNUstep/GNUstepBase/GSVersionMacros.h>
#import <gtk-3.0/gtk/gtk.h>
#import <gtk-3.0/gtk/gtkapplication.h>
#import <gtk-3.0/gtk/gtkwindow.h>
#import <gtk-3.0/gtk/gtkbutton.h>
#import <gtk-3.0/gtk/gtklabel.h>
#import <gtk-3.0/gtk/gtkbox.h>
#import <gtk-3.0/gtk/gtkentry.h>
#import <gtk-3.0/gtk/gtktextview.h>
#import <GNUstep/GNUstepBase/GCObject.h>
#import <linux/stddef.h>
#import <glib-2.0/glib-object.h>
#import <glib-2.0/glib.h>

static void onBottonClicked(GtkWidget *widget, gpointer data)
{
    GtkLabel *label = GTK_LABEL(data);
    gtk_label_set_text(label, "Hello World");
}

int linuxGUI(int argc, char *argv[])
{
  
    // Declare the window variable
    GtkWidget *window;
    GtkWidget *button;
    GtkWidget *label;

    // Initialize GTK
    gtk_init(&argc, &argv);

    // Create a window
    window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    gtk_window_set_title(GTK_WINDOW(window), "Hello World");
    gtk_window_set_default_size(GTK_WINDOW(window), 720, 480);

    // Connect the destroy event of the window with gtk_main_quit
    g_signal_connect(window, "destroy", G_CALLBACK(gtk_main_quit), NULL);

    // Create the label
    label = gtk_label_new("Click the button");

    // Create the button
    button = gtk_button_new_with_label("Click me");

    // Connect the clicked event of the button with the callback function
    g_signal_connect(button, "clicked", G_CALLBACK(onBottonClicked), label);

    // Arrange the widgets in the window
    GtkWidget *vbox = gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    gtk_box_pack_start(GTK_BOX(vbox), label, TRUE, TRUE, 0);
    gtk_box_pack_start(GTK_BOX(vbox), button, TRUE, TRUE, 0);

    // Add the vbox to the window
    gtk_container_add(GTK_CONTAINER(window), vbox);

    // Show the window and all the widgets
    gtk_widget_show_all(window);

    // Start the main loop
    gtk_main();

    return 0;
}

int main(int argc, char *argv[])
{
    linuxGUI(argc, argv);
    return 0;
}