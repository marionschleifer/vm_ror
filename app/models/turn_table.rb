class TurnTable < ActiveRecord::Base
  belongs_to :machine
  has_many :sections, dependent: :destroy
end
