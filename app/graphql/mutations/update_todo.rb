# frozen_string_literal: true

module Mutations
  class UpdateTodo < BaseMutation
    field :todo, Types::TodoType, null: false
    field :errors, [String], null: false

    argument :id, ID, required: true
    argument :title, String, required: true
    argument :completed, Boolean

    def resolve(id:, title:, completed: false)
      todo = Todo.find(id)
      if todo.update(title: title, completed: completed)
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
