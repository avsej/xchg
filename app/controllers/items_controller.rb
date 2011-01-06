class ItemsController < ApplicationController
  respond_to :html

  def index
    if current_user
      @items = current_user.items.group_by{|i| i.attachment_updated_at.to_date}
      @item = current_user.items.build
    else
      @items = {}
    end
      respond_with(@items)
  end

  def create
    @item = current_user.items.create(params[:item])
    redirect_to items_path
  end

end
