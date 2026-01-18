# Framing Effects in Student Housing Policy  
**An Experimental Design & ANOVA Analysis**

## Project Overview
This project investigates how different framings of a university housing policy influence student agreement levels. Using a survey-based experiment and a Generalized Randomized Block Design (GRBD), I analyze whether emphasizing student benefits, resource constraints, or neutral wording affects student responses while controlling for class standing.

The goal of this project is to demonstrate experimental design principles, statistical inference, and applied data analysis using real survey data.


## Research Question
Does the framing of a housing policy statement significantly affect student agreement levels, and does this effect vary by class standing?


## Experimental Design
- **Primary Factor:** Policy framing  
  - Neutral wording  
  - Emphasizing student benefit  
  - Emphasizing resource constraints
- **Blocking Variable:** Class standing (Freshman, Sophomore, Junior, Senior)
- **Outcome Variable:** Agreement score (0–10)
- **Design:** Generalized Randomized Block Design (GRBD)


## Data Collection
Data was collected via a Google Forms survey (n = 27). Participants were exposed to one version of the policy statement and asked to rate their agreement level.

**Note:** While the framing selection was intended to be random, participants self-selected survey links, resulting in partial randomization. This limitation is addressed in the discussion.


## Methods & Analysis
- Data cleaning and restructuring in **R**
- Exploratory data analysis and visualization using **ggplot2**
- One-way ANOVA with blocking to evaluate framing effects
- Power analysis to estimate required sample sizes for future studies


## Key Results
- Policy framing had a **statistically significant effect** on agreement scores (p < 0.05).
- Statements emphasizing student benefit and neutral wording received higher agreement than resource-constrained framing.
- Class standing did **not** have a statistically significant effect on agreement levels.


## Limitations
- Small sample size limits generalizability
- Imperfect randomization due to self-selection
- Potential response bias inherent in survey data

Future iterations of this study would benefit from full random assignment and a larger, stratified sample.


## Tools & Technologies
- R  
- tidyverse  
- ggplot2  
- ANOVA  
- Experimental Design  
- Survey Data Analysis  
