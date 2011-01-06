class ItemsController < ApplicationController
  respond_to :html

  def index
    @items = current_user.items.group_by{|i| i.attachment_updated_at.to_date} rescue []
    respond_with @items
  end

end
