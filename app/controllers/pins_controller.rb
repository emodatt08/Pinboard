class PinsController < ApplicationController
  before_action :find_pin, only: [:show, :edit, :update, :destroy]
  def index
    @pins = Pin.all.order("created_at DESC")
  end

  def show
  end

  def edit
  end

  def update
    if @pin.update_attributes(pin_params)
      redirect_to @pin, notice: "Successfully updated pin"
    else
      render "edit"
    end
  end

  def destroy
    @pin.delete
    redirect_to  root_path
  end


  def new
    @pin = current_user.pins.build
  end

  def create
    @pin = current_user.pins.build(pin_params)
    if @pin.save
      redirect_to @pin, notice: "Successfully created new Pin"
    else
      render 'new'
    end
  end

private
  def pin_params
    params.require(:pin).permit(:title, :description, :category)
  end

private
  def find_pin
    @pin = Pin.find(params['id'])
  end

end
