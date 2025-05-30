# Task Tracker CLI

A simple and efficient command-line task management application built with Ruby and Thor. Track your tasks with ease using intuitive commands to add, update, delete, and manage task statuses.

## Features

- ✅ **Add Tasks**: Create new tasks with descriptions
- 📝 **Update Tasks**: Modify existing task descriptions
- 🗑️ **Delete Tasks**: Remove tasks you no longer need
- 📋 **List Tasks**: View all tasks or filter by status
- 🔄 **Status Management**: Mark tasks as in-progress or done
- 💾 **Persistent Storage**: Tasks are saved to a JSON file
- 🕒 **Timestamps**: Automatic creation and update timestamps

## Prerequisites

- Ruby 3.0 or higher
- Thor gem

## Installation

1. **Clone or download** this repository
2. **Install dependencies**:
   ```bash
   gem install thor
   ```
3. **Make the script executable** (optional):
   ```bash
   chmod +x task_manager.rb
   ```

## Usage

Run the task manager using Ruby:

```bash
ruby task_manager.rb [COMMAND] [ARGUMENTS]
```

Or if you made it executable:

```bash
./task_manager.rb [COMMAND] [ARGUMENTS]
```

### Available Commands

#### Add a New Task
```bash
ruby task_manager.rb add "Complete project documentation"
```
**Output**: `Task added successfully with id 0`

#### List All Tasks
```bash
ruby task_manager.rb list
```
**Output**:
```
ID: 0, Task: Complete project documentation, Status: todo, Created At: 2024-01-15 10:30:00, Updated At: 2024-01-15 10:30:00
```

#### List Tasks by Status
```bash
# List only todo tasks
ruby task_manager.rb list todo

# List only in-progress tasks
ruby task_manager.rb list in_progress

# List only completed tasks
ruby task_manager.rb list done
```

#### Update a Task
```bash
ruby task_manager.rb update 0 "Complete project documentation and README"
```
**Output**: `Task updated successfully`

#### Mark Task as In Progress
```bash
ruby task_manager.rb mark-in-progress 0
```
**Output**: `Task marked as in progress successfully`

#### Mark Task as Done
```bash
ruby task_manager.rb mark-done 0
```
**Output**: `Task marked as done successfully`

#### Delete a Task
```bash
ruby task_manager.rb delete 0
```
**Output**: `Task deleted successfully`

## Task Statuses

Tasks can have one of three statuses:

- **`todo`**: Newly created tasks (default status)
- **`in_progress`**: Tasks currently being worked on
- **`done`**: Completed tasks

## Data Storage

Tasks are automatically saved to a `tasks_thor.json` file in the same directory as the script. This file is created automatically when you add your first task.

### Example JSON Structure
```json
[
  {
    "id": 0,
    "task": "Complete project documentation",
    "status": "todo",
    "created_at": "2024-01-15 10:30:00",
    "updated_at": "2024-01-15 10:30:00"
  }
]
```

## Examples

Here's a typical workflow:

```bash
# Add some tasks
ruby task_manager.rb add "Buy groceries"
ruby task_manager.rb add "Write blog post"
ruby task_manager.rb add "Review pull requests"

# List all tasks
ruby task_manager.rb list

# Start working on a task
ruby task_manager.rb mark-in-progress 1

# Complete a task
ruby task_manager.rb mark-done 0

# Update a task description
ruby task_manager.rb update 2 "Review and merge pull requests"

# List only in-progress tasks
ruby task_manager.rb list in_progress

# Delete a completed task
ruby task_manager.rb delete 0
```

## Help

To see all available commands and their descriptions:

```bash
ruby task_manager.rb help
```

To get help for a specific command:

```bash
ruby task_manager.rb help add
ruby task_manager.rb help list
```

## Error Handling

The application includes basic error handling:

- **Invalid JSON**: If the tasks file becomes corrupted, it will be reset to an empty array
- **Missing tasks**: The tasks file is automatically created if it doesn't exist
- **Invalid IDs**: Commands that reference task IDs will fail gracefully if the ID doesn't exist

## Contributing

Feel free to submit issues and enhancement requests!
