cmake_minimum_required(VERSION 3.27)

# Project name
project(Llama3x C)

# Specify the C standard (optional)
set(CMAKE_C_STANDARD 11)

# Add the compiler flags
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D_LLAMA_3_1_8B -fopenmp -Ofast -march=native")

# Add the executable target with both source files
add_executable(llama3x main.c win.c)