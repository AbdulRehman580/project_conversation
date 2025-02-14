# Project Management Application

This application allows users to manage projects, track their status, and add comments related to those projects. It uses Devise for user authentication and Active Record for data modeling. Below are the key features and how to set up and test the application.

## Features

- **Projects**: Users can create projects and assign them a status.
- **Comments**: Users can add comments to projects.
- **Status History**: The application keeps track of the status history of each project.
- **User Authentication**: Users can sign up, log in, and manage their accounts via Devise.

## Models

### Project
- `name`: Name of the project (string).
- `status`: Enum representing the status of the project (`not_started`, `in_progress`, `on_hold`, `completed`, `cancelled`).
- **Associations**:
  - `has_many :comments`
  - `has_many :status_histories`

### Comment
- `content`: Content of the comment (text).
- **Associations**:
  - `belongs_to :project`
  - `belongs_to :user`

### StatusHistory
- `old_status`: Enum representing the previous status of the project.
- `new_status`: Enum representing the updated status of the project.
- **Associations**:
  - `belongs_to :project`
  - `belongs_to :user`

### User
- `name`: Name of the user (string).
- `email`: Email address of the user (string, unique).
- **Associations**:
  - `has_many :comments`
  - `has_many :status_histories`
- **Authentication**: Managed via Devise.

## Setup

### Prerequisites
- Ruby 2.x or above
- Rails 5.0.7
- PostgreSQL database

### Installing

1. Clone the repository:
2. Install the dependencies:
   ```bash
   bundle install
   ```

3. Set up the database:
   ```bash
   rake db:create
   rake db:migrate
   rake db:seed
   ```

4. Start the Rails server:
   ```bash
   rails server
   ```

   The app should now be running at [http://localhost:3000](http://localhost:3000).

### Running Tests

This project uses Minitest for testing. To run the tests:

1. Run all tests:
   ```bash
   rails test
   ```

2. Run tests for a specific model:
   ```bash
   rails test test/models/project_test.rb
   rails test test/models/comment_test.rb
   rails test test/models/status_history_test.rb
   rails test test/models/user_test.rb
   ```

### Fixture Setup

To make testing easier, fixture data for the models is provided in `test/fixtures/`:

- **comments.yml**: Fixture data for the `Comment` model.
- **projects.yml**: Fixture data for the `Project` model.
- **status_histories.yml**: Fixture data for the `StatusHistory` model.
- **users.yml**: Fixture data for the `User` model.

Ensure you have the following files in `test/fixtures/` for your tests to work:

- `comments.yml`
- `projects.yml`
- `status_histories.yml`
- `users.yml`
