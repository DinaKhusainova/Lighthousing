class Admin::PhotoshootOrdersController < Admin::AdminController

  def show
    @photoshoot_order = PhotoshootOrder.find(params[:id])
  end

  def destroy
    PhotoshootOrder.find(params[:id]).destroy!
    flash[:success] = 'Order successfully deleted'
    redirect_to admin_orders_path
  end
end
