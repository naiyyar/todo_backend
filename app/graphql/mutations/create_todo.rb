# frozen_string_literal: true

module Mutations
  class CreateTodo < BaseMutation
    # TODO: define return fields
    field :todo, Types::TodoType, null: false
    field :errors, [String], null: false
    
    argument :title, String, required: true
    argument :completed, Boolean

    def resolve(title:, completed: false)
      todo = Todo.new(title: title, completed: completed)
      if todo.save!
        {
          todo: todo,
          errors: nil
        }
      else
        {
          todo: nil, errors: todo.errors.full_messages
        }
      end
    end

  end
end
