class CampaignsController < ApplicationController
  before_action :authenticate_publisher!

  def index
    @campaigns = Campaign.where(publisher: current_publisher)
      .order(created_at: :desc)
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new secure_params
    @campaign.publisher = current_publisher

    if @campaign.save
      return redirect_to campaigns_path
    end

    flash.now[:alert] = 'Please review form errors'
    render :new
  end

  private
  def secure_params
    params.require(:campaign).permit :title, :description, :sources_text
  end
end
