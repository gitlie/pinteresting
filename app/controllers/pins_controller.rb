class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]

#-----like show all----
  def index
    @pins = Pin.all
  end

#-----shows single when clicked----
  def show
  end

#-----links to new page----
  def new
    @pin = Pin.new
  end

#-----links to edit page----
  def edit
  end

#-----creates new id----
  def create
    @pin = Pin.new(pin_params)
      if @pin.save
        redirect_to @pin, notice: 'Pin was successfully created.'
      else
        frender :new
      end
  end

#-----changes and updates info----
  def update
      if @pin.update(pin_params)
        redirect_to @pin, notice: 'Pin was successfully updated.'
      else
        render :edit
      end
  end

#-----deletes id----
  def destroy
    @pin.destroy
      redirect_to pins_url, notice: 'Pin was successfully destroyed.' 
  end

  private
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def pin_params
      params.require(:pin).permit(:description)
    end
end
