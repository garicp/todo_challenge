# Pre-configurations (Change if you want an awesome difficulty assessment)
require_relative 'config/application'

# Your Code begins from this line onwards #

def add_todo(desc)
    Todo.create(description: "#{desc}")
    list_todo
end

def list_todo
    puts "No\tDescription\t\t\tStatus"
    puts "==============================================="
    all_todo = Todo.all
    all_todo.each do |t|
        puts "#{all_todo.index(t) + 1}\t#{t.description}\t\t\t#{t.status}"
    end
end

def update_todo(num, desc, stat)
    selected_todo = Todo.all[num.to_i - 1]
    selected_todo.update(description: desc, status: stat)
    list_todo
end

def remove_todo(num)
    selected_todo = Todo.all[num.to_i - 1]
    selected_todo.destroy
    list_todo
end

ARGV

case ARGV[0]
when "add"
    #Add todo
    add_todo(ARGV[1])
when "list"
    #List all todo
    list_todo
when "update"
    #Update todo either description or status
    update_todo(ARGV[1], ARGV[2], ARGV[3])
when "remove"
    #Remove selected todo
    remove_todo(ARGV[1])
else
    puts "Invalid input."
end