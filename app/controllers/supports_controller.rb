class SupportsController < ApplicationController

  skip_before_action :verify_authenticity_token, only: :create
  
  def create
    @campaign = Campaign.find(params[:campaign_id])
    @support = @campaign.supports.create
    render json: @support
  end

end
