# frozen_string_literal: true

module Mutations
  class UpdatePostMutation < BaseMutation
    argument :id, ID, required: true
    argument :title, String, required: false
    argument :body, String, required: false

    field :post, Types::PostType, null: true
    field :errors, [String], null: true

    def resolve(id:, title: nil, body: nil)
      post = Post.find_by(id: id)
      return { post: nil, errors: ["Post with id=#{id} is not found"] } unless post

      if post.update(title: title, body: body)
        { post: post, errors: [] }
      else
        { post: post, errors: post.errors.full_messages }
      end
    end
  end
end
