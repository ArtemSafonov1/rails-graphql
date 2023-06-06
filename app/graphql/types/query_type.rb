# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # /users
    field :users, [Types::UserType], description: 'Get list of users'

    def users
      User.preload(:posts, posts: :comments)
    end

    # /user
    field :user, Types::UserType, null: false, description: 'Get user by id' do
      argument :id, ID, required: true
    end

    def user(id:)
      User.find(id)
    end

    # /posts
    field :posts, [Types::PostType], description: 'Get list of posts'

    def posts
      Post.preload(:user, :comments)
    end

    # /post
    field :post, Types::PostType, null: false, description: 'Get post by id' do
      argument :id, ID, required: true
    end

    def post(id:)
      Post.find(id)
    end

    # /comments
    field :comments, [Types::CommentType], description: 'Get list of comments'

    def comments
      Comment.preload(:user, :post)
    end

    # /comment
    field :comment, Types::CommentType, null: false, description: 'Get comment by id' do
      argument :id, ID, required: true
    end

    def comment(id:)
      Comment.find(id)
    end
  end
end
