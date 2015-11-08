class CampaignSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :supports_count
end
