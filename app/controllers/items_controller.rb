class ItemsController < ApplicationController

  before_action :authenticate_user!

  def index
    @items = current_user.items.where(done: true)
  end

  def new
    @item = Item.new
  end

  def create
    item = current_user.items.new(item_params)
    item.created_date = Time.current
    item.done = false
    if item.save
      redirect_to items_path, notice: 'Item creado exitosamente.'
    else
      redirect_to new_item_path
    end
  end

  def edit
    @item = Item.find params['id']
  end

  def update
    item = Item.find params['id']
    if item.update item_params
      redirect_to items_path
    else
      redirect_to items_path
    end
  end

  def destroy
    item = Item.find params['id']
    item.destroy
    redirect_to items_path
  end

  private
    def item_params
      params.require(:item).permit(:description,:done)
    end

end