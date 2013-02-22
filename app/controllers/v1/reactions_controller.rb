class V1::ReactionsController < ApplicationController
  respond_to :json
  
  def index
    reactions = Reaction.all
    render :json => reactions.to_json
  end
end
