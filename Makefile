# Compiler and flags
CC = gcc
CFLAGS = -Ofast -fopenmp -march=native -lm -std=c99

# Targets
TARGETS = run1b run3b run8b

# Default target
all: $(TARGETS)

# Build run1b
run1b: main.c
	$(CC) $(CFLAGS) -D_LLAMA_3_2_1B main.c -o run1b

# Build run3b
run3b: main.c
	$(CC) $(CFLAGS) -D_LLAMA_3_2_3B main.c -o run3b

# Build run8b
run8b: main.c
	$(CC) $(CFLAGS) -D_LLAMA_3_1_8B main.c -o run8b

# Clean up
clean:
	rm -f $(TARGETS)

# Phony targets
.PHONY: all clean
