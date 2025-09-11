# Requirements

- [x] **Rails framework**

  - Rails 8.0.2.1

- [x] **has_many, belongs_to, has_many :through relationships**

  - has_many :strategies through :user_strategies
  - belongs_to :user, belongs_to :strategy (UserStrategy join model)
  - All tables have 2+ attributes

- [x] **Validations**

  - presence, uniqueness, length validations on all models

- [x] **ActiveRecord scope methods**

  - Strategy.with_risk(level), .low_risk, .medium_risk, .high_risk

- [x] **Authentication (signup, login, logout)**

  - Devise with custom forms at /?form=signup and /?form=login

- [x] **Nested resource with RESTful URLs**

  - /users/:user_id/strategies/new

- [x] **Forms display validation errors**

  - shared errors partial with errors.full_messages

- [x] **Unit tests for all models + integration test**

  - 23 test examples, and request test for new strategies

- [x] **FactoryBot**

  - factories for all models

- [x] **DRY code following style guides**

  - logic in models, controllers serve as "middle-men", views display info, and include partial views

- [x] **RuboCop compliant**

  - no offenses detected, Nitro .rubocop.yml file copied and used

- [x] **No scaffolding**
  - All models, controllers, views, schema, ect.. built as needed without generators
