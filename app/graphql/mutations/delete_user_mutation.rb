# frozen_string_literal: true

module Mutations
  class DeleteUserMutation < BaseMutation
    argument :id, ID, required: true

    field :user, Types::UserType, null: true
    field :errors, [String], null: true

    def resolve(id:)
      user = User.find_by(id: id)
      return { user: nil, errors: ["User with id=#{id} is not found"] } unless user

      user.destroy!
      { user: nil, errors: [] }
    end
  end
end
