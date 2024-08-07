
% 📜 FATA Optimization source codes (version 1.0)
% 🌐 Website and codes of FATA: An Efficient Optimization Method Based on Geophysics:
 
% 🔗 http://www.aliasgharheidari.com/FATA.html

% 👥 Ailiang Qi, Dong Zhao, Ali Asghar Heidari, Lei Liu, Yi Chen, Huiling Chen

% 📅 Last update: 8 6 2024

% 📧 E-Mail: q17853118231@163.com, as_heidari@ut.ac.ir, aliasghar68@gmail.com, chenhuiling.jlu@gmail.com
  

% 📜 After use of code, please users cite to the main paper on FATA: An Efficient Optimization Method Based on Geophysics:
% Ailiang Qi, Dong Zhao, Ali Asghar Heidari, Lei Liu, Yi Chen, Huiling Chen
% FATA: An Efficient Optimization Method Based on Geophysics
% Neurocomputing - 2024, DOI: https://doi.org/10.1016/j.neucom.2024.128289

%----------------------------------------------------------------------------------------------------------------------------------------------------%

% 📊 You can use and compare with other optimization methods developed recently:
%     - (ECO) 2024: 🔗 http://www.aliasgharheidari.com/ECO.html
%     - (AO) 2024: 🔗 http://www.aliasgharheidari.com/AO.html
%     - (PO) 2024: 🔗 http://www.aliasgharheidari.com/PO.html
%     - (RIME) 2023: 🔗 http://www.aliasgharheidari.com/RIME.html
%     - (INFO) 2022: 🔗 http://www.aliasgharheidari.com/INFO.html
%     - (RUN) 2021: 🔗 http://www.aliasgharheidari.com/RUN.html
%     - (HGS) 2021: 🔗 http://www.aliasgharheidari.com/HGS.html
%     - (SMA) 2020: 🔗 http://www.aliasgharheidari.com/SMA.html
%     - (HHO) 2019: 🔗 http://www.aliasgharheidari.com/HHO.html

%____________________________________________________________________________________________________________________________________________________%


%%
% fobj = @YourCostFunction    
% dim = number of your variables   
% MaxFEs = Maximum numbef of fitness evaluations
% lb=[lb1,lb2,...,lbn] where lbn is the lower bound of variable n  
% ub=[ub1,ub2,...,ubn] where ubn is the upper bound of variable n  
% If all the variables have equal lower bound you can just
% define lb and ub as two single number numbers

%%
clear all 
clc
rng('default')
Function_name='F21'; % Name of the test function that can be from F1 to F23



% Load details of the selected benchmark function
[lb,ub,dim,fobj]=Get_Functions_details(Function_name);
MaxFEs=1000*dim;
N = 50; %popultaion size

[Best_pos,Best_score,Convergence_curve] = FATA(fobj,lb,ub,dim,N,MaxFEs);
figure('Position',[269   240   660   290])
%Draw search space
subplot(1,2,1);
func_plot(Function_name);
title('Parameter space')
xlabel('x_1');
ylabel('x_2');
zlabel([Function_name,'( x_1 , x_2 )'])

%Draw objective space
subplot(1,2,2);
plot(Convergence_curve,'Color','r')
title('Objective space')
xlabel('Iteration');
ylabel('Best score obtained so far');

axis tight
grid on
box on
legend('FATA')

display(['The best solution obtained by ,FATA is : ', num2str(Best_pos)]);
display(['The best optimal value of the objective funciton found by ,FATA is : ', num2str(Best_score)]);



