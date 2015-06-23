class Section < ActiveRecord::Base
  belongs_to :turn_table
  has_one :article, dependent: :destroy

  def empty?
    article.blank?
  end

end
