# frozen_string_literal: true

module Types
  class PostType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer, null: false
    field :user, Types::UserType, null: false
    field :title, String, null: true
    field :body, String, null: true
    field :comments, [Types::CommentType], null: true
    field :comments_count, Integer, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def comments_count
      object.comments.size
    end
  end
end
