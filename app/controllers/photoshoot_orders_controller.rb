class PhotoshootOrdersController < ApplicationController

  def index
    @photoshoot_order = PhotoshootOrder.new
  end

  def create
    @photoshoot_order = PhotoshootOrder.new(photoshoot_order_params)

    if @photoshoot_order.save
      redirect_to finish_path
    else
      render :index
    end
  end

  private

  def photoshoot_order_params
    params.require(:photoshoot_order).permit(:name, :email, :message)
  end
end
