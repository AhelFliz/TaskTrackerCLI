#!/usr/bin/env ruby

require "thor"
require "json"

class TaskManager < Thor
  TASKS_FILE = "tasks_thor.json"

  desc "add DESCRIPTION", "Add a new task"
  def add(description)
    tasks << create_task_hash(description)
    save_tasks
    puts "Task added successfully with id #{tasks.last["id"]}"
  end

  desc "update ID DESCRIPTION", "Update a task"
  def update(id, description)
    puts "Updating task #{id} with description #{description}"
    task = find_task(id)
    task["task"] = description
    task["updated_at"] = time_now
    save_tasks
    puts "Task updated successfully"
  end

  desc "delete ID", "Delete a task"
  def delete(id)
    tasks.delete_if { |task| task["id"] == id.to_i }

    save_tasks
    puts "Task deleted successfully"
  end

  desc "list STATUS", "List all tasks"
  def list(options = nil)
    list_tasks(options)
  end

  desc "mark-in-progress ID", "Mark a task as in progress"
  def mark_in_progress(id)
    task = find_task(id)
    task["status"] = :in_progress
    task["updated_at"] = time_now
    save_tasks
    puts "Task marked as in progress successfully"
  end

  desc "mark-done ID", "Mark a task as done"
  def mark_done(id)
    task = find_task(id)
    task["status"] = :done
    task["updated_at"] = time_now
    save_tasks
    puts "Task marked as done successfully"
  end

  private

  def find_task(id)
    tasks.find { |t| t["id"] == id.to_i }
  end

  def create_task_hash(description)
    {
      "id" => generate_id,
      "task" => description,
      "status" => :todo,
      "created_at" => time_now,
      "updated_at" => time_now
    }
  end

  def generate_id
    tasks.empty? ? 0 : tasks.map { |task| task["id"] }.max + 1
  end

  def list_tasks(option = nil)
    tasks.each do |task|
      if option.nil? || task["status"] == "#{option}"
        puts "ID: #{task["id"]}, Task: #{task["task"]}, Status: #{task["status"]}, Created At: #{task["created_at"]}, Updated At: #{task["updated_at"]}"
      end
    end
  end

  def tasks
    @tasks ||= load_tasks
  end

  def load_tasks
    if File.exist?(TASKS_FILE)
      JSON.parse(File.read(TASKS_FILE))
    else
      File.write(TASKS_FILE, "[]")
      []
    end
  rescue JSON::ParserError
    puts "Error parsing tasks file"
    []
  end

  def save_tasks
    File.write(TASKS_FILE, JSON.pretty_generate(tasks))
  end

  def time_now
    Time.now.strftime("%Y-%m-%d %H:%M:%S")
  end
end

TaskManager.start(ARGV) if $PROGRAM_NAME == __FILE__
