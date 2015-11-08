class Campaign < ActiveRecord::Base
  PETITION_TYPES= %w{public personal correction}
  belongs_to :publisher
  has_many   :supports

  validates :title, :description, presence: true

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
