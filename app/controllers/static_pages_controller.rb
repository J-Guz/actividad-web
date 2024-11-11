class StaticPagesController < ApplicationController

  before_action :authenticate_user!

  def index
    @items = current_user.items.where(done: false)
  end

  def new
    @item = Item.new
  end

  def create_item
    item = current_user.items.new(item_params)
    item.done = false  
    item.created_date = Time.current

    if @item.save
      redirect_to root_path, notice: 'Item creado exitosamente.'
    else
      redirect_to root_path, alert: 'No se pudo crear el ítem.'
    end
  end

  private

  def item_params
    params.require(:item).permit(:description)
  end

end
