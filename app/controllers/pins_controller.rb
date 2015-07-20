class PinsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_pin, only: [:edit, :update, :destroy, :show]
  before_action :owns_pin, only: [:edit, :update, :destroy]
  """
   Route: http://hostname/pins
   Authentication: Optional
   Method: GET
   Show all pins for current user
  """
  def index
  	@pins = Pin.all.each_slice(3).to_a
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
  end

  """
   Route: http://hostname/pins/{:id}/edit
   Authentication: required
   Method: GET
   Show Pin Edit form
  """
  def edit
  end

  """
    Route: http://hostname/pins/{:id}
    Authentication: required
    Method: PATCH or PUT
    Update Pin
  """
  def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: "You have successfully updated the pin"
    else
      redirect_to edit
    end
  end

  """
    Route: http://hostname/pins/{:id}
    Authentication: required
    Method: DELETE
    Delete Pin
  """
  def destroy
    @pin.destroy
    redirect_to pins_url
  end

  private
    def owns_pin
      @pin = current_user.pins.find(params[:id])
      redirect_to pins_path, notice: "You are not authorized to edit this pin" if @pin.nil?
    end

    def set_pin
      @pin = Pin.find(params[:id])
    end

    def pin_params
      params.require(:pin).permit(:description, :image)
    end
end
