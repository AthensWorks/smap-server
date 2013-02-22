class V1::ReactionsController < ApplicationController
  
  def index
    reactions = Reaction.all
    
    respond_to do |format|  
      format.json { render :json => reactions.to_json }
    end
     
  end
end
