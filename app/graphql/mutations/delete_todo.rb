# frozen_string_literal: true

module Mutations
  class DeleteTodo < BaseMutation
    field :errors, [String], null: false
    field :success, Boolean, null: false

    argument :id, ID, required: true

    def resolve(id:)
      todo = Todo.find(id)
      if todo&.destroy
        { success: true, errors: [] }
      else
        {
          success: false,
          errors: todo.errors.full_messages
        }
      end
    end
  end
end
