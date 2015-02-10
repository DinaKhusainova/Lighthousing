class Admin::OrdersController < Admin::AdminController

  def index
    scope = PhotoshootOrder.all + ModelOrder.all
    scope = scope.sort_by { |order| order.created_at }.reverse

    @orders = scope
  end
end
