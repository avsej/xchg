class ItemsController < ApplicationController
  respond_to :html

  def index
    if params[:public_token]
      @items = User.find_by_public_token!(params[:public_token]).items
    elsif current_user
      @items = current_user.items
      @item = current_user.items.build
    else
      @items = []
    end

    @items = @items.reject(&:new_record?).group_by{|i| i.attachment_updated_at.to_date}
    respond_with(@items)
  end

  def create
    @item = current_user.items.create(params[:item])
    redirect_to items_path
  end

end
