require_relative "../../config/application.rb"

class CreateTodoTable < ActiveRecord::Migration[5.2]
    def change
        create_table :todos do |t|
            t.string :description
            t.boolean :status, default: false
            t.timestamps
        end
    end
end