class Support < ActiveRecord::Base
  belongs_to :campaign, counter_cache: true

  after_create :create_petition

  def fetch_status
    update status: bazooka_client.fetch["status"]
  end

  private

  def create_petition
    response = bazooka_client.create_petition
    update(petition_id: response["job"], status: response["status"])
  end

  def bazooka_client
    BazookaClient.new(self)
  end

end
