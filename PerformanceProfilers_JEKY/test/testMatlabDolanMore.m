function testMatlabDolanMore

% testMatlabDolanMore
%
% Author      : Frank E. Curtis
% Description : Tests Matlab implementation of Dolan and Mor� profiler.
% Note        : This file provides the following inputs:
%
% files       ~ names of input files containing performance measure data
% algorithms  ~ names of algorithms corresponding to the input files
% file_format ~ string indicating format of each line of input files
% column      ~ column containing performance measure data of interest
% options     ~ struct of (optional) options
%               see profilerDolanMore for more information about options
%
% Example : Suppose that there are two input files:
%
% algorithm_1.txt, with contents:
% problem_1  1  2.0
% problem_2  3  4.0
%
% algorithm_2.txt, with contents:
% problem_1  5  6.0
% problem_2 -1 -1.0
%
% where the first column in each line indicates a problem name, the second
% column indicates the number of iterations required, and the third column
% indicates the final value of the objective function.  To generate a
% performance profile for the number of iterations required, the inputs
% could be given as follows:
%
% >> files = {'algorithm_1.txt','algorithm_2.txt'};
% >> algorithms = {'Algorithm 1','Algorithm 2'};
% >> file_format = '%s %d %f';
% >> column = 2;
% >> options.log_scale = true;
% >> options.max_ratio = inf;
%
% Notes :
% - Use a negative value to indicate failure to solve a problem
% - All other performance measure values should be strictly positive (not zero)
% - All lines of the input files must have the same format
% - All input files must have the same number of lines

% Files containing data
files = {
  'GradientDescent.txt'
  'GradientDescentW.txt'
  'Newton.txt'
  'NewtonW.txt'
  'TRNewtonCG.txt'
  'TRSR1CG.txt'
  'BFGS.txt'
  'BFGSW.txt'
  'DFP.txt'
  'DFPW.txt'
  % 'BFGS.txt'
  % 'LBFGS(m = 3).txt'
  % 'LBFGS(m = 7).txt'
  % 'LBFGS(m = 11).txt'
  % 'LBFGS(m = 15).txt'
  % 'LBFGS(m = 20).txt'
  % 'LBFGS(m = 50).txt'
};

% Algorithms associated with files
algorithms = {
  'GradientDecent'
  'GradientDecentW'
  'Newton'
  'NewtonW'
  'TRNewtonCG'
  'TRSR1CG'
  'BFGS'
  % 'LBFGS(m = 3)'
  % 'LBFGS(m = 7)'
  % 'LBFGS(m = 11)'
  % 'LBFGS(m = 15)'
  % 'LBFGS(m = 20)'
  % 'LBFGS(m = 50)'
  'BFGSW'
  'DFP'
  'DFPW'
};

% File format per line
file_format = '%s %d %f %f %d %d';
%file_format = '%s\t %s\t %d\t %f';

% Column to consider
%2: Interation
%3: Function value
%4: Execution Time
%5:number of function evaluations
%6: number of gradient evaluations
column = 6;

% Log scale?
options.log_scale = false;

% Maximum ratio?
options.tau_max = 100;

% Add location of profiler to path
addpath('../src/Matlab/');

% Call profiler
profilerDolanMore(files,algorithms,file_format,column,options);