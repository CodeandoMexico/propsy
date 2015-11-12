require 'rest-client'

class BazookaClient
  DOMAIN='http://info-bazooka.herokuapp.com/petitions'


  attr_accessor :support

  delegate :campaign, to: :support

  def initialize(support)
    @support = support
  end

  def self.default_user
    {
      name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      phone_number: Faker::Number.number(10),
      email: Faker::Internet.email,
      nationality: "México",
      education_level: 1 + rand(6),
      profession: 2,
      age: 18 + rand(50)
    }
  end

  def create_petition
    JSON.parse(RestClient.post([DOMAIN, 'agency'].join('/'), params))
  end

  def fetch
    JSON.parse(RestClient.get([DOMAIN, support.petition_id].join('/')))
  end

  private

  def params
    {
      user: user_information,
      petition: campaign_information
    }
  end

  def user_information
    result = {}
    self.class.default_user.map do |k,v| 
      result[k] = support.send(k) || v
    end
    result[:last_name] = result[:last_name].split
    result
  end

  def campaign_information
    {
      dependency: "27001",
      text: campaign.description,
      type: campaign.petition_type,
      extra: ""
    }
  end

end