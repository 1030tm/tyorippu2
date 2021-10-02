class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_page, only: [:destroy, :edit, :update]

  def index
    @pages = Page.order('created_at DESC').limit(3)
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

  def show
    @page = Page.where(id: params[:id])
  end

  def destroy
    @page.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
    if @page.update(page_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  private

  def page_params
    params.require(:page).permit(:page_title, :page_comment,
                                 spots_attributes: [:id, :spot_name, :spot_address, :spot_tel, :spot_parking, :spot_comment, categories: [], :_destroy, :page_id]).merge(user_id: current_user.id)
  end

  def set_page
    @page = Page.find(params[:id])
  end
end
