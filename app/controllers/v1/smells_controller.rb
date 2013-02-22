class V1::SmellsController < ApplicationController
  respond_to :json
  
  def index
    smells = Smell.scoped
        
    if params[:s]
      smells = smells.where(Smell.arel_table[:name].matches("%#{params[:s]}%"))
    end
    
    if params[:lat] && params[:lon]
      smells = smells.near([params[:lat],params[:lon]], params[:dist] || 5)
    end

    render json: smells.to_json(:methods => :reaction_ids)
  end

  def show
    smell = Smell.where(id: params[:id])
    render json: smell.to_json(:methods => :reaction_ids)
  end

  def new
    smell = Smell.new
    render json: smell.to_json(:methods => :reaction_ids)
  end

  def create
    smell = Smell.new(name: params[:name], lat: params[:lat], lon: params[:lon])
    
    if smell.save
      render json: smell.to_json(:methods => :reaction_ids)
    else
      render json: Smell.new
    end
  end
  
  # Special routes for POST on a smell to incremiment either up_votes or down_votes
  
  def up
    smell = Smell.where(id: params[:smell_id]).first
    
    if smell
      smell.up_votes += 1
      
      if smell.save
        render json: smell.to_json(:methods => :reaction_ids)
      else
        render json: Smell.new
      end
    else
      render json: Smell.new
    end
  end
  
  def down
    smell = Smell.where(id: params[:smell_id]).first
    
    if smell
      smell.down_votes += 1
      
      if smell.save
        render json: smell.to_json(:methods => :reaction_ids)
      else
        render json: Smell.new
      end
    else
      render json: Smell.new
    end
  end
end
