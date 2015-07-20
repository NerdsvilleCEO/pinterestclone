class PinsController < ApplicationController
  before_action :authenticate_user!
  
  def index
  	@pins = Pin.all
  end

  def new
  	@pin = Pin.new
  end

  def create
    @pin = Pin.new(pin_params)
    if @pin.save
    	redirect_to @pin
    else
    	render 'new'
    end
  end


  private
    def pin_params
      params.require(:pin).permit(:description)
    end
end
