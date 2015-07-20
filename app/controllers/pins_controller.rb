class PinsController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  """
   Route: http://hostname/pins
   Authentication: required
   Method: GET
   Show all pins for current user
  """
  def index
  	@pins = current_user.pins.all
  end

  """
   Route: http://hostname/pins/new
   Authentication: required
   Method: GET
   Show form to create a new pin
  """
  def new
  	@pin = current_user.pins.new
  end

  """
   Route: http://hostname/pins/create
   Authentication: required
   Method: POST
   Create a new pin
  """
  def create
    @pin = current_user.pins.new(pin_params)
    if @pin.save
    	redirect_to @pin
    else
    	render 'new'
    end
  end

  """
   Route: http://hostname/pins/{:id}
   Authentication: optional
   Method: GET
   Show a pin by ID
  """
  def show
    @pin = Pin.find(params[:id])
  end

  private
    def pin_params
      params.require(:pin).permit(:description)
    end
end
