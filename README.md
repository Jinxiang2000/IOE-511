# IOE-511 Final Project

## Project Overview

This repository contains a comprehensive package developed for IOE 511/MATH 562 - Continuous Optimization Methods, focusing on the implementation and evaluation of various optimization algorithms for solving unconstrained problems in Matlab. Our team has explored and implemented a set of optimization methods, particularly focusing on the performance impact of memory in quasi-Newton methods.

## Implemented Algorithms

We have implemented the following algorithms with customizable options, allowing for flexible experimentation:

- Gradient Descent with Backtracking Line Search (`GradientDescent`)
- Gradient Descent with Wolfe Line Search (`GradientDescentW`)
- Modified Newton with Backtracking Line Search (`Newton`)
- Modified Newton with Wolfe Line Search (`NewtonW`)
- Trust Region Newton with CG Subproblem Solver (`TRNewtonCG`)
- SR1 Quasi-Newton with CG Subproblem Solver (`TRSR1CG`)
- BFGS Quasi-Newton with Backtracking Line Search (`BFGS`)
- BFGS Quasi-Newton with Wolfe Line Search (`BFGSW`)
- DFP Quasi-Newton with Backtracking Line Search (`DFP`)
- DFP Quasi-Newton with Wolfe Line Search (`DFPW`)



## Getting Started

To use our optimization package, ensure you have Matlab installed on your system. Clone this repository and navigate to the project directory. Use the following command to solve an optimization problem:

```
[x, f] = optSolver_JEKY(problem, method, options)
```

- `problem`: Specifies the starting point (`x0`) and the problem name.
- `method`: Defines the optimization method to use along with any specific parameters.
- `options`: Allows users to specify additional options for algorithm customization.

Refer to our comments for detailed information on each parameter and default values.

## Impact of Memory on Quasi-Newton Methods

Our project delves into the effect of memory management on the performance of quasi-Newton methods, answering critical questions about how historical data influences convergence and efficiency.
