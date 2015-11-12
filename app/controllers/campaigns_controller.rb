class CampaignsController < ApplicationController
  before_action :authenticate_publisher!, except: :show

  def index
    @campaigns = Campaign.where(publisher: current_publisher)
      .order(created_at: :desc)
    respond_to do |format|
      format.html { }
      format.json { render json: @campaigns }
    end
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

  def show
    @campaign = Campaign.find(params[:id])
    respond_to do |format|
      format.html { }
      format.json { render json: @campaign }
    end
  end

  private

  def secure_params
    params.require(:campaign).permit :title, :description, :sources_text, :petition_type
  end
end
