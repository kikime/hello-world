CC=g++
DEBUG = -Wall -pedantic -Wextra -Wshadow
CFLAGS = -c -std=c++14 -O2 $(DEBUG)
LDFLAGS = $(DEBUG)
SOURCES = main.cpp
OBJECTS = $(SOURCES:.cpp=.o)
RESULT = helloWorld.exe

all: DEBUG+=-DNDEBUG
all: $(SOURCES) link

debug: DEBUG+=-g
debug: all

clean:
	find . -name "*~" -type f -delete
	find . -name "*.o" -type f -delete

link: $(OBJECTS)
	$(CC) $(OBJECTS) -o $(RESULT) $(LDFLAGS)

.cpp.o:
	$(CC) $(CFLAGS) $< -o $@
