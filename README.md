# Trading Strategies Manager

## Feature 1: User Authentication

**User Story**  
As a user, I want to sign up and log in so I can access my personal trading strategies.

**Details**  
Allow users to create an account with email/password and authenticate to access their dashboard.

---

## Feature 2: Create a Strategy

**User Story**  
As a user, I want to create a trading strategy with a name, description, and risk level so I can organize my trading approaches.

**Details**  
Prompt the user to enter strategy name, description, and select risk level (low, medium, high). Save it to the database and confirm success.

---

## Feature 3: Add Indicators to Strategy

**User Story**  
As a user, I want to add technical indicators (RSI, EMA, MACD) to my strategy so I can define its trading logic.

**Details**  
Use the nested resource `/strategies/:id/indicators/new` to associate indicators with a strategy via a join table.

---

## Feature 4: View Strategy with Indicators

**User Story**  
As a user, I want to see all indicators associated with a strategy so I can understand its configuration.

**Details**  
Display the selected strategy with all its associated indicators.

---

## Feature 5: Filter Strategies by Risk

**User Story**  
As a user, I want to filter strategies by risk level so I can focus on specific types of trading approaches.

**Details**  
Use the scope like `Strategy.high_risk` to display only strategies with high risk level.
