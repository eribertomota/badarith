LIBBADMATH_DIR = lib
PROG_DIR = src

override LDFLAGS += -L$(shell pwd)/$(LIBBADMATH_DIR)
override CFLAGS += -I$(shell pwd)/$(LIBBADMATH_DIR)
export LDFLAGS CFLAGS

all:
%:
	cd $(LIBBADMATH_DIR) && $(MAKE) $@
	cd $(PROG_DIR) && $(MAKE) $@
