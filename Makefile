# if you love goth girls titties you will love this makefile

CC = clang
CFLAGS = -Wall -I/usr/include/x86_64-linux-gnu/GNUstep -I/usr/include/GNUstep/GNUstepBase \
-I/usr/include/gtk-3.0 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include \
-I/usr/include/pango-1.0 -I/usr/include/harfbuzz -I/usr/include/cairo -I/usr/include/gdk-pixbuf-2.0 \
-I/usr/include/atk-1.0
LDFLAGS = -lobjc -lgnustep-base -lgnustep-gui -lgtk-3 -lgobject-2.0 -lglib-2.0 -lpango-1.0 -lharfbuzz -lcairo -lgdk_pixbuf-2.0 -latk-1.0
SRC = app.m
OUT = app_gui

all: $(OUT)

$(OUT): $(SRC)
	$(CC) $(CFLAGS) $(LDFLAGS) $(SRC) -o $(OUT) 

clean:
	rm -f $(OUT)

run: $(OUT)
	./$(OUT)

