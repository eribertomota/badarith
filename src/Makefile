prefix = /usr/local
exec_prefix = $(prefix)
bindir = $(exec_prefix)/bin
libdir = $(exec_prefix)/lib
includedir = $(prefix)/include
datarootdir = $(prefix)/share
mandir = $(datarootdir)/man
man1dir = $(mandir)/man1

PROGRAM_NAME = badarith

INSTALL = install
INSTALL_DATA = ${INSTALL} -m 644
CHK_DIR_EXISTS = test -d
CHK_FILE_EXISTS = test -f
MKDIR = mkdir -p

override LDFLAGS += -lbadmath

# should I use oldincludedir?

.PHONY: installdirs installfiles install-strip install uninstalldirs uninstallfiles uninstall clean

all: $(PROGRAM_NAME)

$(PROGRAM_NAME): main.c
	$(CC) -g -Wall -o $@ main.c $(LDFLAGS) $(CFLAGS) $(CPPFLAGS)

installdirs:
	@$(CHK_DIR_EXISTS) $(DESTDIR) || $(MKDIR) $(DESTDIR)
	@$(CHK_DIR_EXISTS) $(DESTDIR)$(bindir) || $(MKDIR) $(DESTDIR)$(bindir)
	@$(CHK_DIR_EXISTS) $(DESTDIR)$(man1dir) || $(MKDIR) $(DESTDIR)$(man1dir)

installfiles:
	$(INSTALL) $(INSTALL_FLAGS) $(PROGRAM_NAME) $(DESTDIR)$(bindir)/$(PROGRAM_NAME)
	$(INSTALL_DATA) ../man/$(PROGRAM_NAME).1 $(DESTDIR)$(man1dir)/$(PROGRAM_NAME).1

install: installdirs installfiles

install-strip: INSTALL_FLAGS += -s
install-strip: install

uninstalldirs:
	-test -e $(DESTDIR)$(bindir) && $(RMDIR) $(DESTDIR)$(bindir)
	-test -e $(DESTDIR)$(man1dir) && $(RMDIR) $(DESTDIR)$(man1dir)

uninstallfiles:
	$(RM) $(DESTDIR)$(bindir)/$(PROGRAM_NAME)
	$(RM) $(DESTDIR)$(man1dir)/$(PROGRAM_NAME).1

uninstall: uninstallfiles uninstalldirs

clean:
	@rm -f *.o
	@rm -f $(PROGRAM_NAME)
