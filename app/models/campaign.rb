class Campaign < ActiveRecord::Base
  belongs_to :publisher
  has_many   :supports

  def sources_text
    return '' if !self.sources.present?
    self.sources.join(', ')
  end

  def sources_text=(value)
    if value.present?
      self.sources = value.split(',').map{|source| source.strip }
    end
  end
end
