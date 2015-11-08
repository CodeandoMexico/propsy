class HomeController < ApplicationController
  def index
    return redirect_to campaigns_path if publisher_signed_in?
  end
end
