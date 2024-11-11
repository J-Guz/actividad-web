class StaticPagesController < ApplicationController

  before_action :authenticate_user!

  def index
    @items = current_user.items.where(done: false)
    @new_item = Item.new
  end

  def create_item
    new_item = current_user.items.new(item_params)
    new_item.done = false  
    new_item.created_date = Time.current

    if new_item.save
      redirect_to index_path, notice: 'Item creado exitosamente.'
    else
      redirect_to index_path, alert: 'No se pudo crear el ítem.'
    end
  end

  private

  def item_params
    params.require(:item).permit(:description)
  end

end
