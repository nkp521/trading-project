# Trading Strategies Manager

## Feature 1: User Authentication

**User Story**  
As a user, I want to sign up, log in, and log out so I can securely manage my own strategies.

**Details**  
Users table with email and password. Authentication provides account access and protects strategies.

---

## Feature 3: Table Creation / Association

**User Story**  
As a user, I want my strategies tied to me through a join so I only see strategies I’ve created.

**Details**  
Create User and Strategy tables, then a Join table `user_strategies` table that connects users and strategies.

---

## Feature 2: Create a Strategy

**User Story**  
As a user, I want to create a new trading strategy so I can define my trading approaches.

**Details**  
Strategies table with name, description, long_entry, short_entry, and risk_level. Validations ensure presence and correct formats.

---

## Feature 4: Nested Resource (User → Strategies)

**User Story**  
As a user, I want to create a strategy under my account so it is automatically associated with me.

**Details**  
Form at `/users/:user_id/strategies/new`. Saves strategy data and links it to the user via the join.

---

## Feature 5: Scope (Filter Strategies)

**User Story**  
As a user, I want to filter my strategies by risk level so I can focus on specific ones.

**Details**  
Scope method ex. `Strategy.high_risk` shows only high-risk strategies.

---

## Feature 6: Validation Errors

**User Story**  
As a user, I want to see error messages when I enter invalid data so I can correct it.

**Details**  
Forms display validation errors using `errors.full_messages`.
