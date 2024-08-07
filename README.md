# FATA Optimization (Version 1.0)

## Overview
Introducing an exceptionally efficient and innovative swarm intelligence algorithm, the fata morgana algorithm (FATA), meticulously designed to tackle complex continuous multi-type optimization problems. Inspired by the captivating phenomenon of mirage formation, FATA ingeniously implements the mirage light filtering principle (MLF) and the light propagation strategy (LPS). The MLF strategy, synergistically combined with the robust definite integration principle, propels the algorithmic population to significantly enhance FATA’s remarkable exploration capability. Concurrently, the LPS strategy, artfully integrated with trigonometric principles, empowers each algorithmic individual to markedly improve the algorithm's convergence speed and exceptional exploitation capability. These two sophisticated search strategies synergistically optimize FATA’s population and individual search functions, ensuring a balanced and effective optimization process.

FATA has been rigorously compared against a diverse range of competitive optimizers across 23 benchmark functions and the IEEE CEC 2014 to validate its outstanding optimization prowess. This groundbreaking work is meticulously designed for comprehensive qualitative analysis, exploration and exploitation competency evaluation, local optima avoidance strategies, and extensive comparative experiments. The experimental results compellingly demonstrate the robustness, comprehensiveness, and competitiveness of FATA in effectively solving various multi-type functions. Additionally, FATA has been successfully applied to three challenging practical engineering optimization problems, where it consistently outperforms its counterparts, showcasing its practical utility and effectiveness. The promising results indicate that FATA possesses remarkable potential as a powerful computer-aided tool for addressing complex practical optimization tasks. Source codes and related files are readily available at [FATA Project Page](https://aliasgharheidari.com/FATA.html) and other platforms.

### Key Features:
- **Mirage Light Filtering Principle (MLF):** Enhances exploration through innovative filtering techniques.
- **Light Propagation Strategy (LPS):** Accelerates convergence with effective propagation methods.
- **Exploration and Exploitation Competence:** Strikes a harmonious balance between exploration and exploitation.
- **Avoiding Locally Optimal Solutions:** Employs advanced strategies to navigate around local optima.

## Usage
1. **Set the Objective Function:** Define your objective function in the variable `fobj`.
2. **Specify Variable Bounds:** Clearly outline the lower (`lb`) and upper (`ub`) bounds of the variables.
3. **Configure Problem Parameters:** Set the problem dimension, population size (`N`), and maximum number of function evaluations (`MaxFEs`).
4. **Execute the Optimization Process:** Run the FATA function to initiate the optimization sequence.
5. **Retrieve Results:** The function will return the optimal solution in `bestPos`, the global best score in `gBestScore`, and the convergence curve in `cg_curve`.

Feel free to delve into and leverage the FATA optimization algorithm for your various optimization endeavors. Happy optimizing! 🚀🔍

You can effortlessly copy this code snippet and paste it into your README to provide clear and concise instructions on utilizing the FATA optimization algorithm in MATLAB. Don’t hesitate to reach out for any further assistance or modifications!

## Authors
Ailiang Qi, Dong Zhao, Ali Asghar Heidari, Lei Liu, Yi Chen, Huiling Chen

## Last Update
June 8, 2024

## Contact
We welcome your inquiries! Feel free to reach out to us via email:
- **Ailiang Qi:** q17853118231@163.com
- **Ali Asghar Heidari:** as_heidari@ut.ac.ir, aliasghar68@gmail.com
- **Huiling Chen:** chenhuiling.jlu@gmail.com

## Citation
If you utilize this code, please ensure to cite the primary paper on FATA:

**Title:** FATA: An Efficient Optimization Method Based on Geophysics  
**Journal:** Neurocomputing  
**Year:** 2024  
**DOI:** 10.1016/j.neucom.2024.128289

## Other Optimization Methods
For comparative analysis, consider exploring these notable optimization methods developed recently:

- **ECO (2024)**: An advanced optimization framework.
- **AO (2024)**: A novel approach to optimization challenges.
- **PO (2024)**: A state-of-the-art optimization methodology.
- **RIME (2023)**: A cutting-edge algorithm for robust optimization.
- **INFO (2022)**: An metaphore free optimization technique.
- **RUN (2021)**: A metaphore free optimization solution.
- **HGS (2021)**: A high-performance optimization strategy.
- **SMA (2020)**: A sophisticated optimization method.
- **HHO (2019)**: A pioneering optimization algorithm inspired by Harris Hawks.
