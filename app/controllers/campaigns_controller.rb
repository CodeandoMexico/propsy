class CampaignsController < ApplicationController
  before_action :authenticate_publisher!, except: :show

  def index
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

    render :new
  end

  def show
    @campaign = Campaign.find(params[:id])
    render json: @campaign
  end

  private

  def secure_params
    params.require(:campaign).permit :title, :description, :sources_text
  end
end
