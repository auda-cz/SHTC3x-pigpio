# Compiler settings
CC = g++
CFLAGS = -Wall -I./lib 
LDFLAGS = -lpigpio -lrt -pthread
LIBRARY_FLAGS = -fPIC -shared

# Directory for binaries (keep it separate from source files)
BINDIR = ./bin

# Target executable and sources
EXEC = $(BINDIR)/sensorRead
SOURCES = src/main.cpp
LIBRARY_SRC = lib/SHTC3.cpp
LIBRARY_OUT = lib/libSHTC3.so

# Default target
all: $(EXEC)

# Rule for creating the shared library
$(LIBRARY_OUT): $(LIBRARY_SRC)
	$(CC) $(CFLAGS) $(LIBRARY_FLAGS) $(LIBRARY_SRC) -o $@ $(LDFLAGS)

# Rule for creating the executable
$(EXEC): $(LIBRARY_OUT) $(SOURCES)
	mkdir -p $(BINDIR)
	$(CC) $(CFLAGS) $(SOURCES) -o $@ -L./lib -lSHTC3 $(LDFLAGS) -Wl,-rpath,$(PWD)/lib


# Clean rule
clean:
	rm -f $(BINDIR)/sensorRead $(LIBRARY_OUT)

# Phony targets
.PHONY: all clean
