module derivs
  IMPLICIT NONE
  
          integer, parameter :: DP = SELECTED_REAL_KIND(14)

CONTAINS

  subroutine deriv(y, f)
    real(kind=DP) :: q, B, gam, E, g, r
    real(kind=DP), dimension(*), intent(in) :: y
    real(kind=DP), dimension(*), intent(inout) :: f

    ! Define the variables relevant for the problem
    B = 10_DP ! Magnetic field in Teslas
    gam = 8_DP*10.0_DP**(-17) ! Gamma factor with units of kg s**-1
    E = 10_DP ! Electric field in Newtons per Coulombs
    q = 1.6_DP*10.0_DP**(-16) ! Charge of particle in Coulombs
    g = gam / (q * B)
    r = E / B

    f(1) = y(3)
    f(2) = y(4)
    f(3) = y(4) - g * y(3)
    f(4) = -y(3) - g * y(4) + r
    
  end subroutine deriv

end module derivs

