# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :delete_todo, mutation: Mutations::DeleteTodo
    field :update_todo, mutation: Mutations::UpdateTodo
    field :create_todo, mutation: Mutations::CreateTodo
  end
end
