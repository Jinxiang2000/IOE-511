clear,clc
big_question_Save = [];
for i =1:12
    if i == 1
        problem.name = "P1_quad_10_10";
        data_BFGS_LBFGS
        load('big_question_data.mat');
        big_question_Save = [big_question_Save;final_data];
        fprintf("problem: %d \n",i)
    elseif i == 2
        problem.name = "P2_quad_10_1000";
        data_BFGS_LBFGS
        load('big_question_data.mat');
        big_question_Save = [big_question_Save;final_data];
        fprintf("problem: %d \n",i)
    elseif i == 3
        problem.name = "P3_quad_1000_10";
        data_BFGS_LBFGS
        load('big_question_data.mat');
        big_question_Save = [big_question_Save;final_data];
        fprintf("problem: %d \n",i)
    elseif i == 4
        problem.name = "P4_quad_1000_1000";
        data_BFGS_LBFGS
        load('big_question_data.mat');
        big_question_Save = [big_question_Save;final_data];
        fprintf("problem: %d \n",i)
    elseif i == 5
        problem.name = "P5_quartic_1";
        data_BFGS_LBFGS
        load('big_question_data.mat');
        big_question_Save = [big_question_Save;final_data];
        fprintf("problem: %d \n",i)
    elseif i == 6
        problem.name = "P6_quartic_2";
        data_BFGS_LBFGS
        load('big_question_data.mat');
        big_question_Save = [big_question_Save;final_data];
        fprintf("problem: %d \n",i)
    elseif i == 7
        problem.name = "Rosenbrock_2";
        data_BFGS_LBFGS
        load('big_question_data.mat');
        big_question_Save = [big_question_Save;final_data];
        fprintf("problem: %d \n",i)
    elseif i == 8
        problem.name = "Rosenbrock_100";
        data_BFGS_LBFGS
        load('big_question_data.mat');
        big_question_Save = [big_question_Save;final_data];
        fprintf("problem: %d \n",i)
    elseif i == 9
        problem.name = "DataFit_2";
        data_BFGS_LBFGS
        load('big_question_data.mat');
        big_question_Save = [big_question_Save;final_data];
        fprintf("problem: %d \n",i)
    elseif i == 10
        problem.name = "Exponential_10";
        data_BFGS_LBFGS
        load('big_question_data.mat');
        big_question_Save = [big_question_Save;final_data];
        fprintf("problem: %d \n",i)
    elseif i == 11
        problem.name = "Exponential_1000";
        data_BFGS_LBFGS
        load('big_question_data.mat');
        big_question_Save = [big_question_Save;final_data];
        fprintf("problem: %d \n",i)
    elseif i == 12
        problem.name = "Genhumps_5";
        data_BFGS_LBFGS
        load('big_question_data.mat');
        big_question_Save = [big_question_Save;final_data];
        fprintf("problem: %d \n",i)
    end

    writematrix(big_question_Save, "big_question_data.xlsx");

end