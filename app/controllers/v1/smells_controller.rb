class V1::SmellsController < ApplicationController
  respond_to :json
  
  def index
    smells = Smell.all
    render json: smells.to_json
  end

  def show
    smell = Smell.where(id: params[:id])
    render json: smell.to_json
  end

  def new
    smell = Smell.new
    render json: smell.to_json
  end

  def create
    smell = Smell.new(name: params[:name], lat: params[:lat], long: params[:long])
    
    if smell.save
      render json: smell.to_json
    else
      logger.debug smell.inspect
      render json: Smell.new
    end
  end
end
