program EulerTrajectory

use derivs
use euler_step

IMPLICIT NONE

integer, parameter :: nvars = 4

real(kind=DP), dimension(nvars) :: f, y, yf, yh
real(kind=DP) :: vy_initial, vx_initial, x_initial, y_initial, step, t, t_final, tolerance, exact, error 

! define initial conditions
vy_initial = 10_DP ! initial velocity in y direction m s**-1
vx_initial = 0 ! initial velocity in x direction m s**-1
x_initial = 0 ! initial position of x direction m
y_initial = 0 ! initial position of y direction m

! y1 = position in x
y(1) = x_initial
! y2 = position in y
y(2) = y_initial
! y3 = velocity in x
y(3) = vx_initial
! y4 = velocity in y
y(4) = vy_initial

! f(1) is velocity in the x direction 
! f(2) is veloctiy in the y direction
! f(3) is acceleration in the x direction
! f(4) is acceleration in the y direction

step = 0.001_DP ! time step specified by the problem
t_final = 120 ! microseconds that the simulation needs to run for
t = 0 ! initialize the loop
tolerance = 1.0E-7_DP

! a loop that calls the euler algorithm that updates all the derivatives and then
! computes the euler method for the new values using the derivatives

open(unit=11, file='euler-adapt-trajectory.dat', status='replace')
 
do while (t < t_final)

call deriv(y,f)
yf = y
yh = y
call euler(yf,f,step)
call euler(yh,f,step/2)
call deriv(yh,f)
call euler(yh,f,step/2)

    if (abs(yh(1) - yf(1)) < tolerance) then
        ! Increase time step
        y = yh
        t = t + step
        step = 2.0_DP * step
        if (t + step > t_final) then
        step = t_final - t
        endif
    else
        ! Decrease time step
        step = step / 2.0_DP
    end if

write(11,*) t, y(1), y(2), y(3), y(4) 

enddo

close(unit=11)

exact = 129.554231971262952559848_DP
error = abs(exact-y(1))/exact 
print*,"The error is ", error

end program 
