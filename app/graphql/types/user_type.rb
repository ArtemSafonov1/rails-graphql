# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false, description: 'User id'
    field :email, String, null: true, description: 'User email'
    field :name, String, null: true, description: 'User name'
    field :posts, [Types::PostType], null: true, description: 'User posts'
    field :posts_count, Integer, null: true, description: 'User posts count'
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false, description: 'Creation timestamp'
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false, description: 'Updation timestamp'

    def posts_count
      object.posts.size
    end
  end
end
