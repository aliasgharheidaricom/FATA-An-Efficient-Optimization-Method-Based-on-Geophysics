# FATA Optimization (Version 1.0) 
![GitHub](https://img.shields.io/github/license/aliasgharheidaricom/FATA-An-Efficient-Optimization-Method-Based-on-Geophysics)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/aliasgharheidaricom/FATA-An-Efficient-Optimization-Method-Based-on-Geophysics)
![GitHub repo size](https://img.shields.io/github/repo-size/aliasgharheidaricom/FATA-An-Efficient-Optimization-Method-Based-on-Geophysics)
![GitHub language count](https://img.shields.io/github/languages/count/aliasgharheidaricom/FATA-An-Efficient-Optimization-Method-Based-on-Geophysics)
![GitHub last commit](https://img.shields.io/github/last-commit/aliasgharheidaricom/FATA-An-Efficient-Optimization-Method-Based-on-Geophysics)
![GitHub issues](https://img.shields.io/github/issues/aliasgharheidaricom/FATA-An-Efficient-Optimization-Method-Based-on-Geophysics)
![GitHub forks](https://img.shields.io/github/forks/aliasgharheidaricom/FATA-An-Efficient-Optimization-Method-Based-on-Geophysics)
![GitHub stars](https://img.shields.io/github/stars/aliasgharheidaricom/FATA-An-Efficient-Optimization-Method-Based-on-Geophysics)
![GitHub watchers](https://img.shields.io/github/watchers/aliasgharheidaricom/FATA-An-Efficient-Optimization-Method-Based-on-Geophysics)
![GitHub contributors](https://img.shields.io/github/contributors/aliasgharheidaricom/FATA-An-Efficient-Optimization-Method-Based-on-Geophysics)

---

## 📖 Overview
Introducing an **efficient** and **innovative** swarm intelligence algorithm: the **Fata Morgana Algorithm (FATA)**. This algorithm is meticulously designed to tackle **complex continuous multi-type optimization problems**. 

Inspired by the captivating phenomenon of **mirage formation**, FATA ingeniously implements two key strategies:
- **Mirage Light Filtering Principle (MLF)**: Enhances exploration through innovative filtering techniques.
- **Light Propagation Strategy (LPS)**: Accelerates convergence with effective propagation methods.

The MLF strategy, synergistically combined with the robust definite integration principle, significantly enhances FATA’s remarkable exploration capability. Concurrently, the LPS strategy, artfully integrated with trigonometric principles, empowers each algorithmic individual to markedly improve the algorithm's convergence speed and exceptional exploitation capability. 

These two sophisticated search strategies work together to ensure a balanced and effective optimization process.

FATA has been rigorously compared against a diverse range of competitive optimizers across **23 benchmark functions** and the **IEEE CEC 2014** to validate its outstanding optimization prowess. This groundbreaking work is designed for:
- Comprehensive qualitative analysis
- Exploration and exploitation competency evaluation
- Local optima avoidance strategies
- Extensive comparative experiments

The experimental results compellingly demonstrate the **robustness**, **comprehensiveness**, and **competitiveness** of FATA in effectively solving various multi-type functions. Additionally, FATA has been successfully applied to three challenging practical engineering optimization problems, where it consistently outperforms its counterparts, showcasing its practical utility and effectiveness. 

The promising results indicate that FATA possesses remarkable potential as a powerful computer-aided tool for addressing complex practical optimization tasks. Source codes and related files are readily available at the [FATA Project Page](https://aliasgharheidari.com/FATA.html) and other platforms.

---

## 🚀 Key Features
- **Mirage Light Filtering Principle (MLF)**: Enhances exploration through innovative filtering techniques.
- **Light Propagation Strategy (LPS)**: Accelerates convergence with effective propagation methods.
- **Exploration and Exploitation Competence**: Strikes a harmonious balance between exploration and exploitation.
- **Avoiding Locally Optimal Solutions**: Employs advanced strategies to navigate around local optima.

---

## 🛠️ Usage
To utilize the FATA optimization algorithm, follow these easy steps:

1. **Set the Objective Function**: Define your objective function in the variable `fobj`.
2. **Specify Variable Bounds**: Clearly outline the lower (`lb`) and upper (`ub`) bounds of the variables.
3. **Configure Problem Parameters**: Set the problem dimension, population size (`N`), and maximum number of function evaluations (`MaxFEs`).
4. **Execute the Optimization Process**: Run the FATA function to initiate the optimization sequence.
5. **Retrieve Results**: The function will return:
   - Optimal solution in `bestPos`
   - Global best score in `gBestScore`
   - Convergence curve in `cg_curve`

Feel free to delve into and leverage the FATA optimization algorithm for your various optimization endeavors. **Happy optimizing!** 🚀🔍
FUNCTION FATA(fobj, lb, ub, dim, N, MaxFEs)
    // Initialize parameters
    worstInte ← 0
    bestInte ← ∞
    gBest ← array of zeros with length dim
    cg_curve ← empty array
    gBestScore ← ∞
    Flight ← initialization(N, dim, ub, lb) // Initialize random solutions
    fitness ← array of infinities with size N
    FEs ← 0 // Function evaluations

    // Main loop until maximum function evaluations
    WHILE FEs < MaxFEs DO
        FOR i FROM 1 TO N DO
            // Ensure solutions are within bounds
            IF Flight[i] > ub THEN
                Flight[i] ← ub
            ELSE IF Flight[i] < lb THEN
                Flight[i] ← lb
            ENDIF
            
            FEs ← FEs + 1
            fitness[i] ← fobj(Flight[i]) // Evaluate fitness
            
            // Greedy selection for global best
            IF gBestScore > fitness[i] THEN
                gBestScore ← fitness[i]
                gBest ← Flight[i]
            ENDIF
        ENDFOR

        // Sort fitness to find worst and best
        Order, Index ← sort(fitness)
        worstFitness ← Order[N]
        bestFitness ← Order[1]

        // Apply the mirage light filtering principle
        Integral ← cumulative integral of Order
        IF Integral[N] > worstInte THEN
            worstInte ← Integral[N]
        ENDIF
        IF Integral[N] < bestInte THEN
            bestInte ← Integral[N]
        ENDIF
        
        IP ← (Integral[N] - worstInte) / (bestInte - worstInte + epsilon) // Population quality factor

        // Calculate parameters based on iterations
        a ← tan(-(FEs / MaxFEs) + 1)
        b ← 1 / tan(-(FEs / MaxFEs) + 1)

        // Update flight positions
        FOR i FROM 1 TO N DO
            Para1 ← a * random(dim) - a * random(dim)
            Para2 ← b * random(dim) - b * random(dim)
            p ← (fitness[i] - worstFitness) / (gBestScore - worstFitness + epsilon) // Individual quality factor

            IF random() > IP THEN
                Flight[i] ← random(dim) * (ub - lb) + lb // Randomly initialize
            ELSE
                FOR j FROM 1 TO dim DO
                    num ← floor(random() * N + 1)
                    IF random() < p THEN
                        Flight[i][j] ← gBest[j] + Flight[i][j] * Para1[j] // Light refraction (first phase)
                    ELSE
                        Flight[i][j] ← Flight[num][j] + Para2[j] * Flight[i][j] // Light refraction (second phase)
                        Flight[i][j] ← (0.5 * (arf + 1) * (lb[j] + ub[j]) - arf * Flight[i][j]) // Total internal reflection
                    ENDIF
                ENDFOR
            ENDIF
        ENDFOR

        cg_curve[it] ← gBestScore
        it ← it + 1
        bestPos ← gBest
    ENDWHILE
END FUNCTION
---

## 👥 Authors
- **Ailiang Qi**
- **Dong Zhao**
- **Ali Asghar Heidari**
- **Lei Liu**
- **Yi Chen**
- **Huiling Chen**

---

## 📅 Last Update
**June 8, 2024**

---

## 📬 Contact
We welcome your inquiries! Feel free to reach out to us via email:
- **Ailiang Qi:** [q17853118231@163.com](mailto:q17853118231@163.com)
- **Ali Asghar Heidari:** [as_heidari@ut.ac.ir](mailto:as_heidari@ut.ac.ir), [aliasghar68@gmail.com](mailto:aliasghar68@gmail.com)
- **Huiling Chen:** [chenhuiling.jlu@gmail.com](mailto:chenhuiling.jlu@gmail.com)

---

## 📑 Citation
If you utilize this code, please ensure to cite the primary paper on FATA:

**Title:** FATA: An Efficient Optimization Method Based on Geophysics  
**Journal:** Neurocomputing  
**Year:** 2024  
**DOI:** [10.1016/j.neucom.2024.128289](https://doi.org/10.1016/j.neucom.2024.128289)

---

## 🔍 Other Optimization Methods
For comparative analysis, consider exploring these notable optimization methods developed recently:

- **ECO (2024)**: An advanced optimization framework.
- **AO (2024)**: A novel approach to optimization challenges.
- **PO (2024)**: A powerful optimization methodology.
- **RIME (2023)**: A cutting-edge algorithm for robust optimization.
- **INFO (2022)**: A metaphor-free optimization technique.
- **RUN (2021)**: A dynamic optimization solution.
- **HGS (2021)**: A high-performance optimization strategy.
- **SMA (2020)**: A sophisticated multi-agent optimization method.
- **HHO (2019)**: A pioneering optimization algorithm inspired by nature.

---
