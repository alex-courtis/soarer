VERSION = 1.0.0

PREFIX = /usr/local

INCS =

CPPFLAGS = $(INCS) -DPATH_MAX=1024

COMPFLAGS =
CFLAGS = $(COMPFLAGS) -std=c99
CXXFLAGS = $(COMPFLAGS) -std=c++98

LDFLAGS = -rdynamic -lusb

CC = cc
CXX = c++

