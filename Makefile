CFLAGS = -O2

LIBS = # -lsent

SRCS = main.c readGIF.c writeGIF.c
OBJS = main.o readGIF.o writeGIF.o

PROG = giftool

$(PROG): $(OBJS)
	$(CC) $(CFLAGS) -o $(PROG) $(OBJS) $(LIBS)

clean:
	rm -f $(OBJS) $(PROG) core

tar:
	tar cf - README COPYRIGHT $(SRCS) gif.h Makefile | compress > giftool.tar.Z

t: $(PROG)
	$(PROG) -i WWYP.gif > xx.gif
	$(PROG) -i mark.gif > yy.gif
	$(PROG) -i hr.gif > zz.gif
#	giftopnm WWYP.gif | ppmtogif | giftool -i > xx.gif
#	giftopnm mark.gif | ppmtogif | giftool -i > yy.gif
#	giftopnm hr.gif | ppmtogif | giftool -i > yy.gif
	cp xx.gif /www/htdoc/yellow/pages/images/foo.gif
	cp yy.gif /www/htdoc/yellow/pages/images/bar.gif
	cp zz.gif /www/htdoc/yellow/pages/images/baz.gif
