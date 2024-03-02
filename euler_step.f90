MODULE euler_step
  IMPLICIT NONE

CONTAINS

  SUBROUTINE euler(y, f, step)
    integer, parameter :: DP = SELECTED_REAL_KIND(14)
	real(kind=DP), dimension(*), intent(inout) :: y
	real(kind=DP), dimension(*), intent(inout) :: f
	real(kind=DP), intent(in) :: step

    integer :: i, nvars
    nvars = 4

    do i = 1, nvars
      y(i) = y(i) + f(i) * step
    enddo
  end subroutine euler

end module euler_step

