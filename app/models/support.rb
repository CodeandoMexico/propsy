class Support < ActiveRecord::Base
  belongs_to :campaign, counter_cache: true
end
