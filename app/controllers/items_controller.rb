class ItemsController < ApplicationController
  respond_to :html

  def index
    @items = current_user.items rescue []
    respond_with @items
  end

end
