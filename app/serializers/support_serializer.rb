class SupportSerializer < ActiveModel::Serializer
  attributes :id, :campaign_id, :name, :last_name, :phone_number, :email, 
             :nationality,:education_level,:profession, :age, :petition_id,
             :status
end
