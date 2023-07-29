prefix = /usr/local
exec_prefix = $(prefix)
bindir = $(exec_prefix)/bin
libdir = $(exec_prefix)/lib
includedir = $(prefix)/include
datarootdir = $(prefix)/share
mandir = $(datarootdir)/man

NAME = badmath
LIBRARY_NAME = lib$(NAME)
$(LIBRARY_NAME)_OBJS = add.o sub.o mul.o
LIBRARY_MAJOR = 2
LIBRARY_MINOR = 0
LIBRARY_PATCH = 0
LIBRARY_VERSION = $(LIBRARY_MAJOR).$(LIBRARY_MINOR).$(LIBRARY_PATCH)

INSTALL = install
INSTALL_DATA = ${INSTALL} -m 644
CHK_DIR_EXISTS = test -d
CHK_FILE_EXISTS = test -f
MKDIR = mkdir -p
RMDIR = rmdir -p
LN = ln -sf

# should I use oldincludedir?

.PHONY: $(LIBRARY_NAME) install installdirs install-strip uninstalldirs uninstallfiles uninstall clean

all: $(LIBRARY_NAME)

$(LIBRARY_NAME): $(LIBRARY_NAME).so

$(LIBRARY_NAME).so: ${$(LIBRARY_NAME)_OBJS}
	$(CC) -g -shared -Wl,-soname,$@.$(LIBRARY_MAJOR) -o $@.$(LIBRARY_VERSION) $^ $(LDFLAGS)
	$(LN) $(LIBRARY_NAME).so.$(LIBRARY_VERSION) $(LIBRARY_NAME).so.$(LIBRARY_MAJOR)
	$(LN) $(LIBRARY_NAME).so.$(LIBRARY_MAJOR) $(LIBRARY_NAME).so

installdirs:
	@$(CHK_DIR_EXISTS) $(DESTDIR) || $(MKDIR) $(DESTDIR)
	@$(CHK_DIR_EXISTS) $(DESTDIR)$(libdir) || $(MKDIR) $(DESTDIR)$(libdir)
	@$(CHK_DIR_EXISTS) $(DESTDIR)$(includedir)/$(NAME) || $(MKDIR) $(DESTDIR)$(includedir)/$(NAME)

install: installdirs
	$(INSTALL_DATA) $(INSTALL_FLAGS) $(LIBRARY_NAME).so.$(LIBRARY_VERSION) $(DESTDIR)$(libdir)/
	cd $(DESTDIR)$(libdir); $(LN) $(LIBRARY_NAME).so.$(LIBRARY_VERSION) $(LIBRARY_NAME).so.$(LIBRARY_MAJOR)
	$(INSTALL_DATA) $(NAME)/$(NAME).h $(DESTDIR)$(includedir)/$(NAME)/$(NAME).h

install-strip: INSTALL_FLAGS = -s
install-strip: install

uninstalldirs:
	-test -e $(DESTDIR)$(libdir) && $(RMDIR) $(DESTDIR)$(libdir)
	-test -e $(DESTDIR)$(includedir)/$(LIBRARY_NAME) && $(RMDIR) $(DESTDIR)$(includedir)/$(NAME)

uninstallfiles:
	$(RM) $(DESTDIR)$(libdir)/$(LIBRARY_NAME).so.$(LIBRARY_VERSION)
	$(RM) $(DESTDIR)$(libdir)/$(LIBRARY_NAME).so.$(LIBRARY_MAJOR)
	$(RM) $(DESTDIR)$(includedir)/$(NAME)/$(NAME).h

uninstall: uninstallfiles uninstalldirs

%.o: %.c $(LIBRARY_NAME).h
	$(CC) -g -c -fPIC -Wall $< $(CFLAGS)

clean:
	@rm -f ${$(LIBRARY_NAME)_OBJS}
	@rm -f $(LIBRARY_NAME).so*
