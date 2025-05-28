class PostDeletionJob < ApplicationJob
  queue_as :default

  def perform(post)
    post.destroy if post
  end
end 