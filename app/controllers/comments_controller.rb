class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :fetch_content

  def index
    @comments = Comment.where(book_contents_id: params[:content_id])
    # TODO - sort

    # TODO - Turbostream Response
    response do |format|
      format.html
      format.json
    end
  end

  def create
    params = create_params
    Comment.create!(
      user:         current_user,
      text:         params[:comment],
      book_content: @content,
    )

    @comments = Comment.where(book_contents_id: params[:content_id])
    # TODO - sort

    # TODO - Turbostream Response
  end

  private

  def fetch_content
    @content = BookContent.find(params[:content_id])
  end

  def create_params
    params.require([:content_id, :comment])
  end

  def index_params
    params.require(:content_id)
  end
end