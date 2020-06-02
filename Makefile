include config.mk

HDR = \
	src/common/global.h \
	src/common/hid_tokens.h \
	src/common/macro_tokens.h \
	src/common/rawhid.h \
	src/common/rawhid_defs.h

CSRC = \
	src/scboot/scboot.c \
	src/scinfo/scinfo.c \
	src/scrd/scrd.c \
	src/scwr/scwr.c \
	src/common/hid_LINUX.c

CXXSRC = \
	src/scas/scas.cpp \
	src/scdis/scdis.cpp \
	src/common/hid_tokens.cpp \
	src/common/macro_tokens.cpp

OBJ = $(CSRC:.c=.o) $(CXXSRC:.cpp=.o)

BIN = \
	bin/scas \
	bin/scboot\
	bin/scdis \
	bin/scinfo \
	bin/scrd \
	bin/scwr

all: $(BIN)

$(OBJ): config.mk $(HDR)

bin/scas: src/scas/scas.o src/common/macro_tokens.o src/common/hid_tokens.o
	${CXX} -o $@ ${LDFLAGS} $^

bin/scboot: src/scboot/scboot.o src/common/hid_LINUX.o
	${CC} -o $@ ${LDFLAGS} $^

bin/scdis: src/scdis/scdis.o src/common/macro_tokens.o src/common/hid_tokens.o
	${CXX} -o $@ ${LDFLAGS} $^

bin/scinfo: src/scinfo/scinfo.o src/common/hid_LINUX.o
	${CC} -o $@ ${LDFLAGS} $^

bin/scrd: src/scrd/scrd.o src/common/hid_LINUX.o
	${CC} -o $@ ${LDFLAGS} $^

bin/scwr: src/scwr/scwr.o src/common/hid_LINUX.o
	${CC} -o $@ ${LDFLAGS} $^

clean:
	rm -f $(OBJ) $(BIN)

.PHONY: all clean

