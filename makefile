CC= gcc
OBJ=max.o min.o variance.o

ifeq (${DEBUG},yes)
	CC_OPTIONS=-g -Wall
	MODE= Mode Debug
else
	CC_OPTIONS=
	MODE= Mode Release
endif

max.o : max.c
	@echo "$(MODE)"
	${CC} ${CC_OPTIONS} -c $^
min.o : min.c
	@echo "$(MODE)"
	${CC} ${CC_OPTIONS} -c $^

variance.o : variance.c
	@echo "$(MODE)"
	${CC} ${CC_OPTIONS} -c $^

test.o : test.c
	@echo "$(MODE)"
	${CC} ${CC_OPTIONS} -c $^

test.exe : test.o ${OBJ}
	@echo "$(MODE)"
	${CC} ${CC_OPTIONS} -o $@ $< ${OBJ}

clean:
	@rm *.c

clean2: *.o
	@rm *.o
	
install :
	mv *.exe /home/bardiau
