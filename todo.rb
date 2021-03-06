# Pre-configurations (Change if you want an awesome difficulty assessment)
require_relative 'config/application'

# Your Code begins from this line onwards #

def add_todo(desc)
    Todo.create(description: "#{desc}")
    list_todo
end

def list_todo
    puts "No\tDescription\t\t\t\tDone"
    puts "=" * 55
    all_todo = Todo.all
    all_todo.each do |t|
        if t.description.length > 23
            inter_string = "#{t.description}\t"
        elsif t.description.length > 15
            inter_string = "#{t.description}\t\t"
        elsif t.description.length > 7
            inter_string = "#{t.description}\t\t\t"
        else 
            inter_string = "#{t.description}\t\t\t\t"
        end
        puts "#{all_todo.index(t) + 1}\t#{inter_string}\t#{t.done}"
    end
end

def update_todo(num, stat)
    if num.to_i > 0 && num.to_i < Todo.all.length - 1
        selected_todo = Todo.all[num.to_i - 1]
        selected_todo.update(done: stat)
        list_todo
    else
        no_record_found(num)
    end
end

def remove_todo(num)
    if num.to_i > 0 && num.to_i < Todo.all.length - 1
        selected_todo = Todo.all[num.to_i - 1]
        selected_todo.destroy
        list_todo
    else
        no_record_found(num)
    end
end

def no_record_found(num)
    list_todo
    raise "No record found on Todo ##{num}. Please choose todo from your existing todo list."
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
    #Update todo either description or done
    update_todo(ARGV[1], ARGV[2])
when "remove"
    #Remove selected todo
    remove_todo(ARGV[1])
when "--task"
    puts "ruby todo.rb add <task description> === Adding new todo"
    puts "ruby todo.rb list === List all todos"
    puts "ruby todo.rb update <todo number> <true or false> === Update todo whether done or not"
    puts "ruby todo.rb remove <todo number> === removes todo"
else
    puts "Invalid input. --task to see all available options"
end