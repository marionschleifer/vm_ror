class Article < ActiveRecord::Base
  belongs_to :section

  validates :name, presence: true
  validates :price, presence: true
  validates :expiry_date, presence: true
  validates :section_id, presence: true, unless: :sold?

  scope :sold, -> { where(sold: true) }

  def expired?
    self.expiry_date < Date.today
  end

  def purchase!
    self.section = nil
    self.sold = true
    save!
  end
end
