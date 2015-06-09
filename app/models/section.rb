class Section < ActiveRecord::Base
  belongs_to :turn_table
  has_one :article

  def empty?
    [true, false].sample
  end

end
