# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    # user managing
    field :create_user, mutation: Mutations::CreateUserMutation
    field :update_user, mutation: Mutations::UpdateUserMutation
    field :delete_user, mutation: Mutations::DeleteUserMutation
    # post managing
    field :create_post, mutation: Mutations::CreatePostMutation
    field :update_post, mutation: Mutations::UpdatePostMutation
    field :delete_post, mutation: Mutations::DeletePostMutation
  end
end
