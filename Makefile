# Define the compiler to use
CC = g++

# Define any compile-time flags
CFLAGS = -Wall -g

# Define any directories containing header files other than /usr/include
INCLUDES = -I.

# Define library paths in addition to /usr/lib
LFLAGS = -lSDL2 -lSDL2main

# Define any libraries to link into executable
LIBS = 

# Define the C source files
SRCS = main.cc

# Define the C object files 
# This uses Suffix Replacement within a macro:
# $(name:string1=string2)
# For each word in 'name' replace 'string1' with 'string2'
OBJS = $(SRCS:.cc=.o)

# Define the executable file 
MAIN = fractals 

#
# The following part of the makefile is the rules.
#

all: $(MAIN)
	@echo  Simple compile complete

$(MAIN): $(OBJS) 
	$(CC) $(CFLAGS) $(INCLUDES) -o $(MAIN) $(OBJS) $(LFLAGS) $(LIBS)

# This is a suffix replacement rule for building .o's from .c's
# It uses automatic variables $<: the name of the prerequisite of 
# the rule (a .c file) and $@: the name of the target of the rule (a .o file)
.c.o:
	$(CC) $(CFLAGS) $(INCLUDES) -c $<  -o $@

clean:
	$(RM) *.o *~ $(MAIN)
