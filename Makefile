TOPDIR     := $(PWD)

EBTREE_DIR ?= ../ebtree

CC         := gcc
OPT_CFLAGS := -O3
CPU_CFLAGS := -fomit-frame-pointer -DCONFIG_REGPARM=3
DEB_CFLAGS := -Wall -g
DEF_CFLAGS :=
USR_CFLAGS :=
INC_CFLAGS := -I$(TOPDIR)/include -I$(EBTREE_DIR)
CFLAGS     := $(OPT_CFLAGS) $(CPU_CFLAGS) $(DEB_CFLAGS) $(DEF_CFLAGS) $(USR_CFLAGS) $(INC_CFLAGS)

LD         := $(CC)
DEB_LFLAGS := -g
USR_LFLAGS :=
LIB_LFLAGS := -L$(EBTREE_DIR)
LDFLAGS    := $(DEB_LFLAGS) $(USR_LFLAGS) $(LIB_LFLAGS)

BINS       := exp-lm
OBJS       :=
OBJS       += $(patsubst %.c,%.o,$(wildcard src/*.c))
OBJS       += $(patsubst %.S,%.o,$(wildcard src/*.S))

all: $(BINS)

exp-lm: $(OBJS)
	$(LD) $(LDFLAGS) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $^

clean:
	-rm -f $(BINS) $(OBJS) *.[oa] *~ */*.[oa] */*~