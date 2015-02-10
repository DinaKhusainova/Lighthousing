class ModelOrder < ActiveRecord::Base

  has_many :photos, dependent: :destroy

  accepts_nested_attributes_for :photos, allow_destroy: true

  validates :name,    presence: true
  validates :email,   presence: true
  validates :message, presence: true

  def type
    'TFP request'
  end
end
