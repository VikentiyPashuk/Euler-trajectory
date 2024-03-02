Charged Particle Motion Simulation

This project implements numerical solutions to the equations of motion for a charged particle in magnetic and electric fields using Fortran. 

Purpose:
The purpose is to investigate the trajectory of a particle in a crossed electric and magnetic field with different numerical schemes and initial conditions..

Contents:
- derivs.f90: Contains a routine for computing derivatives required for the simulation.
- euler_step.f90: Contains the Euler stepper to calculate the next particle's position and velocity.
- euler-trajectory.f90: Simulate particle motion calling the euler method and the derivative modules.
- euler-adapt-trajectory.f90: Simulates particle motion using the adaptive euler method calling the same modules.

How to use:
1. Clone the repository to your local machine.
2. Ensure you have a Fortran compiler installed (e.g., GNU Fortran).
3. Compile the code by running the make command in the terminal.
4. Run the executable such as ./euler-trajectory or ./euler-adapt-trajectory.
5. Change the initial condtions and explore the results.
6. Have fun.

Support:
If you encounter any issues or have questions regarding the simulation setup or usage, please feel free to open an issue in the repository. Contributions and suggestions for improvements are also welcome.

Maintainers:
- Vikentiy Pashuk (https://github.com/VikentiyPashuk): Lead Developer

License:
This project is licensed under the MIT License. Feel free to use, modify, and distribute the code for academic and non-commercial purposes.

Thank you for using our charged particle motion simulation framework! We hope it proves to be a valuable tool for your research and educational endeavors.

