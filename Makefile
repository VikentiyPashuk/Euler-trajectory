CC=gfortran
TARGET1=euler-trajectory
TARGET2=euler-adapt-trajectory
OBJECTS1= euler-trajectory.o derivs.o euler_step.o
OBJECTS2= euler-adapt-trajectory.o derivs.o euler_step.o

all:	${TARGET1} ${TARGET2}

${TARGET1}:	derivs.mod euler_step.mod ${OBJECTS1}
	${CC} ${OBJECTS1} -o ${TARGET1}
	@echo Compiled ${TARGET1}

${TARGET2}:	derivs.mod euler_step.mod ${OBJECTS2}
	${CC} ${OBJECTS2} -o ${TARGET2}
	@echo Compiled ${TARGET2}

%.o:	%.f90
	${CC} -c $<
	
derivs.mod:	derivs.f90
	${CC} -c $<

euler_step.mod:	euler_step.f90
	${CC} -c $<

clean:
	rm -f ${TARGET1} ${TARGET2}
	rm -f *~
	rm -f *.o
	rm -f *.mod

