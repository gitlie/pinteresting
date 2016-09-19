class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
                                  #---only: []

#-----like show all----
  def index
    @pins = Pin.all
  end

#-----shows single when clicked----
  def show
  end

#-----links to new page----
  def new
    @pin = current_user.pins.build
  end

#-----links to edit page----
  def edit
  end

#-----creates new id----
  def create
    @pin = current_user.pins.build(pin_params)
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

    def correct_user
      @pin = current_user.pins.find_by(id: params[:id])
      redirect_to pins_path, notice: "Not authorized to edit this pin" if @pin.nil?
    end

    def pin_params
      params.require(:pin).permit(:description)
    end
end
