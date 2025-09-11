# Stonk Strategies

A full-stack Rails application for creating and sharing trading strategies. Built with Rails 8, Devise authentication, and a brutalist design aesthetic with animated candlestick backgrounds.

## What This App Does

This application allows you to:

- **Create an account**
- **Login and logout**
- **Create trading strategies** with risk levels and entry/exit points
- **View all strategies** with filtering by risk level
- **Browse user profiles** and their strategies

The app features a UI with animated stock candlesticks

## How to Clone and Run

### Prerequisites

- Ruby (version 3.3.5 or higher)
- Rails 8.0.2.1
- SQLite3
- Git

### Step 1: Clone the Repository

```bash
git clone <your-repo-url>
cd trading-project
```

### Step 2: Install Dependencies

```bash
bundle install
```

### Step 3: Setup Database

```bash
rails db:create
rails db:migrate
rails db:seed
```

### Step 4: Start the Server

```bash
rails server
```

The application will run on `http://localhost:3000`

## How to Use

1. Navigate to `http://localhost:3000`
2. Sign up for a new account or login
3. Create your first trading strategy
4. Browse strategies from other users
5. Filter strategies by risk level (Low, Medium, High)

## Features

- **User Authentication**: Secure signup/login with Devise
- **Strategy Management**: Create, view, and share trading strategies
- **Risk Assessment**: Categorize strategies by risk level
- **User Profiles**: View user information and their strategies
- **Animated Background**: Candlestick animations
- **Form Validation**: Thurough Error handling and validation
- **Clean URLs**: RESTful routing with nested resources/forms

## Tech Stack

- **Backend**: Ruby on Rails 8.0.2.1
- **Database**: SQLite3
- **Authentication**: Devise
- **Testing**: RSpec with FactoryBot and shoulda-matchers
- **Styling**: Custom CSS
- **Code Quality**: Nitro RuboCop compliant

Good-Luck in your Investing and Trading Journey!
