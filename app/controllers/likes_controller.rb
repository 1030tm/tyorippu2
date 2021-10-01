class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_page, only: [:create, :destroy]

  def create
    @like = current_user.likes.create(page_id: @page.id)
  end

  def destroy
    @like = current_user.likes.find_by(page_id: @page.id)
    @like.destroy!
  end

  private
  def set_page
    @page = Page.find(params[:page_id])
  end

end
