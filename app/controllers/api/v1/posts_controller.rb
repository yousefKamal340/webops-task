module Api
  module V1
    class PostsController < ApplicationController
      before_action :set_post, only: [:show, :update, :destroy]
      before_action :authorize_user, only: [:update, :destroy]

      def index
        posts = Post.includes(:author, :tags).all
        render json: posts, include: [:author, :tags]
      end

      def show
        render json: @post, include: [:author, :tags, :comments]
      end

      def create
        post = current_user.posts.build(post_params)
        
        if post.save
          render json: post, status: :created
        else
          render json: { errors: post.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @post.update(post_params)
          render json: @post
        else
          render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @post.destroy
        head :no_content
      end

      private

      def set_post
        @post = Post.find(params[:id])
      end

      def post_params
        params.permit(:title, :body, tag_ids: [])
      end

      def authorize_user
        unless @post.author_id == current_user.id
          render json: { error: 'Unauthorized' }, status: :forbidden
        end
      end
    end
  end
end 