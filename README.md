# FATA Optimization (Version 1.0)

## Overview
An efficient swarm intelligence algorithm is proposed to solve continuous multi-type optimization problems, named the fata morgana algorithm (FATA). By mimicking the process of mirage formation, FATA designs the mirage light filtering principle (MLF) and the light propagation strategy (LPS), respectively. The MLF strategy, combined with the definite integration principle, drives the algorithmic population to enhance FATA’s exploration capability. The LPS strategy, combined with the trigonometric principle, drives the algorithmic individual to improve the algorithm's convergence speed and exploitation capability. These two search strategies can better use FATA’s population and individual search capabilities. The FATA is compared with a broad array of competitive optimizers on 23 benchmark functions and IEEE CEC 2014 to verify the optimization capability. This work is designed separately for qualitative analysis, exploration and exploitation competence analysis, the analysis of avoiding locally optimal solutions, and comprehensive comparison experiments. The experimental results demonstrate the comprehensiveness and competitiveness of FATA for solving multi-type functions. Meanwhile, FATA is applied to three practical engineering optimization problems to evaluate its performance. Then, the algorithm obtains better results than its counterparts in engineering problems. According to the results, FATA has excellent potential to be used as an efficient computer-aided tool for dealing with practical optimization tasks. Source codes and related files are available at https://aliasgharheidari.com/FATA.html and other websites.

### Key Features:
- Mirage Light Filtering Principle (MLF)
- Light Propagation Strategy (LPS)
- Exploration and Exploitation Competence
- Avoiding Locally Optimal Solutions
  
## Usage
1. Set the objective function in fobj. 
2. Specify the lower and upper bounds of the variables in lb and ub.
3. Set the dimension of the problem, population size N, and maximum number of function evaluations MaxFEs.
4. Run the FATA function to execute the optimization process.
5. The function will return the best solution bestPos, global best score gBestScore, and convergence curve cg_curve.

Feel free to explore and utilize the FATA optimization algorithm for your optimization tasks. Happy optimizing! 🚀🔍


You can simply copy this code snippet and paste it into your README to provide clear instructions on how to use the FATA optimization algorithm in MATLAB. Let me know if you need any further assistance or modifications!


## Authors
Ailiang Qi, Dong Zhao, Ali Asghar Heidari, Lei Liu, Yi Chen, Huiling Chen

## Last Update
June 8, 2024

## Contact
Feel free to reach out to us via email:
- Ailiang Qi: q17853118231@163.com
- Ali Asghar Heidari: as_heidari@ut.ac.ir, aliasghar68@gmail.com
- Huiling Chen: chenhuiling.jlu@gmail.com

## Citation
If you use this code, please cite the main paper on FATA:

**Title:** FATA: An Efficient Optimization Method Based on Geophysics
**Journal:** Neurocomputing
**Year:** 2024
**DOI:** 10.1016/j.neucom.2024.128289

## Other Optimization Methods
You can compare FATA with other optimization methods developed recently:

- ECO (2024)
- AO (2024)
- PO (2024)
- RIME (2023)
- INFO (2022)
- RUN (2021)
- HGS (2021)
- SMA (2020)
- HHO (2019)
