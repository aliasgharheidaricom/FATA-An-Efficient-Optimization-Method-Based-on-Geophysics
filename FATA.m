
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



%% Fata morgana algorithm .Qi A
function [bestPos,gBestScore,cg_curve]=FATA(fobj,lb,ub,dim,N,MaxFEs)
% initialize position
 worstInte=0; %Parameters of Eq.(4)
 bestInte=Inf;%Parameters of Eq.(4)
noP=N;
arf=0.2;%Eq. (15) reflectance=0.2
gBest=zeros(1,dim);
cg_curve=[];
gBestScore=inf;%change this to -inf for maximization problems
Flight=initialization(noP,dim,ub,lb);%Initialize the set of random solutions
fitness=zeros(noP,1)+inf;
% it=1;%Number of iterations
it=1;    
FEs=0;
lb=ones(1,dim).*lb; % lower boundary 
ub=ones(1,dim).*ub; % upper boundary
% Main
while  FEs < MaxFEs 
    for i=1:size(Flight,1)     
        Flag4ub=Flight(i,:)>ub;
        Flag4lb=Flight(i,:)<lb;
        Flight(i,:)=(Flight(i,:).*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb;
        FEs=FEs+1;    
        fitness(i)=fobj(Flight(i,:));
         %Make greedy selections
        if(gBestScore>fitness(i))
            gBestScore=fitness(i);
            gBest=Flight(i,:);
        end
    end
    [Order,Index] = sort(fitness);  
    worstFitness = Order(N); 
    bestFitness = Order(1);
 %% The mirage light filtering principle 
 Integral=cumtrapz(Order);
 if Integral(N)>worstInte
     worstInte=Integral(N);
 end
  if Integral(N)<bestInte 
     bestInte =Integral(N);
 end
IP=(Integral(N)-worstInte)/(bestInte-worstInte+eps);% Eq.(4) population quality factor
 %% Calculation Para1 and Para2
    a = tan(-(FEs/MaxFEs)+1);
    b = 1/tan(-(FEs/MaxFEs)+1);
    %% 
     for i=1:size(Flight,1) 
         Para1=a*rand(1,dim)-a*rand(1,dim); %Parameters of Eq.(10)
         Para2=b*rand(1,dim)-b*rand(1,dim);%Parameters of Eq.(13)
         p=((fitness(i)-worstFitness))/(gBestScore-worstFitness+eps);% Parameters of Eq.(5) individual quality factor
         %% Eq.(1) 
         if  rand>IP 
             Flight(i,:) = (ub-lb).*rand+lb;
         else
        for j=1:dim
            num=floor(rand*N+1);
            if rand<p   
            Flight(i,j)=gBest(j)+Flight(i,j).*Para1(j);%Light refraction(first phase)  Eq.(8)      
            else   
            Flight(i,j)=Flight(num,j)+Para2(j).*Flight(i,j);%Light refraction(second phase)   Eq.(11)    
            Flight(i,j)=(0.5*(arf+1).*(lb(j)+ub(j))-arf.*Flight(i,j));%Light total internal reflection Eq.(14)  
            end      
        end
        end
     end     
    cg_curve(it)=gBestScore;
    it=it+1;
    bestPos=gBest;
end
end