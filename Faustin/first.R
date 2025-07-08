# Physical Inactivity Visualization
state_inactivity <- data_2024 |> 
  select(State, `% Physically Inactive`) |> 
  filter(!is.na(State), !is.na(`% Physically Inactive`)) |> 
  group_by(State) |> 
  summarize(inactivity_rate = mean(`% Physically Inactive`, na.rm = TRUE)) |> 
  rename(state = State) |> 
  arrange(inactivity_rate)

plot_usmap(data = state_inactivity, values = "inactivity_rate", regions = "states") +
  scale_fill_continuous(
    low = "lightgreen", high = "darkblue", 
    name = "Physical Inactivity Rate (%)", 
    label = scales::comma
  ) +
  labs(title = "Average Adult Physical Inactivity Rate by State (2024)",
       subtitle = "Based on County Health Rankings Data") +
  theme(legend.position = "right")

# Food Access Visualization
state_food <- data_2024 |> 
  select(State, `% Limited Access to Healthy Foods`) |> 
  filter(!is.na(State), !is.na(`% Limited Access to Healthy Foods`)) |> 
  group_by(State) |> 
  summarize(food_access_rate = mean(`% Limited Access to Healthy Foods`, na.rm = TRUE)) |> 
  rename(state = State) |> 
  arrange(food_access_rate)

plot_usmap(data = state_food, values = "food_access_rate", regions = "states") +
  scale_fill_continuous(
    low = "lightblue", high = "purple", 
    name = "Limited Healthy Food Access (%)", 
    label = scales::comma
  ) +
  labs(title = "Average Limited Access to Healthy Foods by State (2024)",
       subtitle = "Based on County Health Rankings Data") +
  theme(legend.position = "right")