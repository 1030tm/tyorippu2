class PagesController < ApplicationController

  def index
    @pages = Page.all
  end

  def new
    @page = Page.new
    @page.spots.build
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def page_params
    params.require(:page).permit(:page_title, :page_comment,
      spots_attributes:[:id, :spot_name, :spot_address, :spot_tel, :spot_parking, :spot_comment, :_destroy, :page_id]).merge(user_id: current_user.id)
  end
end
