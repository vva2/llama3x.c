# Compiler and flags
CC = gcc
CFLAGS = -D_LLAMA_3_2_1B -Ofast -fopenmp -march=native -std=c11

# Target executable
TARGET = llama3x

# Source files
SRCS = main.c win.c

# Object files
OBJS = $(SRCS:.c=.o)

# Default target
all: $(TARGET)

# Linking
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJS)

# Compilation
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Clean up
clean:
	rm -f $(TARGET) $(OBJS)

# Phony targets
.PHONY: all clean
