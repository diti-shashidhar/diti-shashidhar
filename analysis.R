# =====================================================
# Framing Effects in Student Housing Policy
# Experimental Design & ANOVA Analysis
# Author: Diti Shashidhar
# =====================================================


# ===============================
# Load libraries
# ===============================
library(dplyr)
library(ggplot2)


# ===============================
# Load data
# ===============================
housing_data <- read.csv(
  "survey_data.csv",
  stringsAsFactors = TRUE
)


# ===============================
# Data preparation
# ===============================

# Option 1: Neutral framing
option1_data <- housing_data %>%
  filter(Versions == "Option 1") %>%
  select(Block = block1, Rating = FOI1) %>%
  mutate(Option = "Option 1")

# Option 2: Emphasizing student benefit
option2_data <- housing_data %>%
  filter(Versions == "Option 2") %>%
  select(Block = block2, Rating = FOI2) %>%
  mutate(Option = "Option 2")

# Option 3: Emphasizing resource constraints
option3_data <- housing_data %>%
  filter(Versions == "Option 3") %>%
  select(Block = block3, Rating = FOI3) %>%
  mutate(Option = "Option 3")

# Combine all options into one dataset
stacked_data <- bind_rows(option1_data, option2_data, option3_data)

# Ensure consistent factor ordering
stacked_data$Option <- factor(
  stacked_data$Option,
  levels = c("Option 1", "Option 2", "Option 3")
)


# ===============================
# Summary statistics
# ===============================
summary_stats <- stacked_data %>%
  group_by(Block) %>%
  summarize(
    mean_rating = mean(Rating),
    variance = var(Rating),
    n = n()
  )

print(summary_stats)


# ===============================
# Sample size / power analysis
# ===============================

group_means <- c(7.00, 7.93, 8.25, 8.00)

# Best-case within-group variance
power.anova.test(
  groups = length(group_means),
  between.var = var(group_means),
  within.var = 4,
  power = 0.8,
  sig.level = 0.05
)

# Worst-case within-group variance
power.anova.test(
  groups = length(group_means),
  between.var = var(group_means),
  within.var = 8,
  power = 0.8,
  sig.level = 0.05
)


# ===============================
# Visualization
# ===============================

# Agreement ratings by policy framing
p1 <- ggplot(stacked_data, aes(x = Option, y = Rating)) +
  geom_point() +
  ggtitle("Agreement Ratings by Housing Policy Framing") +
  theme(text = element_text(size = 14))

ggsave(
  filename = "figures/ratings_by_option.png",
  plot = p1,
  width = 7,
  height = 5
)

# Agreement ratings by framing and class standing
p2 <- ggplot(
  stacked_data,
  aes(x = Option, y = Rating, group = Block, color = Block)
) +
  geom_point() +
  geom_line() +
  ggtitle("Agreement Ratings by Policy Framing and Class Standing") +
  theme(text = element_text(size = 14))

ggsave(
  filename = "figures/ratings_by_option_and_class.png",
  plot = p2,
  width = 7,
  height = 5
)


# ===============================
# Statistical analysis
# ===============================

# ANOVA with blocking on class standing
fit <- aov(Rating ~ Option + Block, data = stacked_data)
anova_results <- summary(fit)

print(anova_results)

# Interpretation:
# - Policy framing (Option) shows a statistically significant effect on agreement ratings.
# - Class standing (Block) does not show a statistically significant effect.
