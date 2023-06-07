# frozen_string_literal: true

module Mutations
  class UpdateUserMutation < BaseMutation
    argument :id, ID, required: true
    argument :name, String, required: false
    argument :email, String, required: false

    field :user, Types::UserType, null: true
    field :errors, [String], null: true

    def resolve(id:, name: nil, email: nil)
      user = User.find_by(id: id)
      return { user: nil, errors: ["User with id=#{id} is not found"] } unless user

      if user.update(name: name, email: email)
        { user: user, errors: [] }
      else
        { user: user, errors: user.errors.full_messages }
      end
    end
  end
end
