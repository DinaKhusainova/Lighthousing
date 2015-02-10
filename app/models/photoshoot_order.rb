class PhotoshootOrder < ActiveRecord::Base

  validates :name,    presence: true
  validates :email,   presence: true
  validates :message, presence: true

  def type
    'Photoshoot order'
  end
end
