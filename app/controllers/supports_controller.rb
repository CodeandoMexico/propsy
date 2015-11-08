class SupportsController < ApplicationController

  skip_before_action :verify_authenticity_token, only: :create
  
  def create
    @campaign = Campaign.find(params[:campaign_id])
    @support = @campaign.supports.create(secure_params)
    render json: @support
  end

  private

  def secure_params
    params.require(:support).permit :name, :last_name, :phone_number, :email, 
                                    :nationality,:education_level,:profession, :age
  end

end
