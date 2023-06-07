# frozen_string_literal: true

module Mutations
  class DeletePostMutation < BaseMutation
    argument :id, ID, required: true

    field :post, Types::PostType, null: true
    field :errors, [String], null: true

    def resolve(id:)
      post = Post.find_by(id: id)
      return { post: nil, errors: ["Post with id=#{id} is not found"] } unless post

      post.destroy!
      { post: nil, errors: [] }
    end
  end
end
