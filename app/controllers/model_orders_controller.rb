class ModelOrdersController < ApplicationController

  def index
    @model_order = ModelOrder.new
  end

  def create
    @model_order = ModelOrder.new(model_order_params)

    if @model_order.save
      redirect_to finish_path
    else
      render :index
    end
  end

  private

  def model_order_params
    params.require(:model_order).permit(:name, :email, :message,
                   photos_attributes: [:id, :image])
  end
end
