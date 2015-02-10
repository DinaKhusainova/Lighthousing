class Admin::ModelOrdersController < Admin::AdminController

  def show
    @model_order = ModelOrder.find(params[:id])
  end

  def destroy
    ModelOrder.find(params[:id]).destroy!
    flash[:success] = 'Order successfully deleted'
    redirect_to admin_orders_path
  end
end
