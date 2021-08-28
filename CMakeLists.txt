cmake_minimum_required(VERSION 3.17)
project(setjmp C)
ENABLE_LANGUAGE(ASM)
set(CMAKE_C_STANDARD 11)

set(CMAKE_VERBOSE_MAKEFILEON ON)
add_executable(setjmp setjmp.s main.c)