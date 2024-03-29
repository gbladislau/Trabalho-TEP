NAME_PROGRAM = final.exe
CC = gcc
FLAGS = -pedantic -Wall -lm 
C_FILES = $(wildcard *.c)
O_FILES = $(patsubst %.c, %.o, $(C_FILES))

all: $(O_FILES) create_executable

main.o: main.c
	@ echo "\033[1;32m"
	@ echo "Compiling main.c ..."
	@ $(CC) -c $< $(FLAGS) -lm
	@ echo "\033[0m"

%.o: %.c %.h
	@ echo "\033[1;32m"
	@ echo "Compiling $< ..."
	@ $(CC) -c $< $(FLAGS) -lm
	@ echo "\033[0m"

create_executable: 
	@ echo "\033[1;32m"
	@ echo "Creating executable..."
	@ $(CC) -o $(NAME_PROGRAM) $(O_FILES) -lm
	@ echo "\033[0m"

run: 
	@ echo "\033[1;32m"
	@ echo "Running program ..."
	@ echo "\033[0m"
	@ ./$(NAME_PROGRAM)

test: clean all run

valgrind: 
	@ echo "\033[1;32m"
	@ echo "Running valgrind ..."
	@ echo "\033[0m"
	@ valgrind ./$(NAME_PROGRAM)

clean: 
	@ echo "\033[1;35m"
	@ echo "Removing temporary files ..."
	@ rm -rf $(NAME_PROGRAM) $(O_FILES)
	@ echo "\033[0m"
