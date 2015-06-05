class Section < ActiveRecord::Base
  belongs_to :turn_table

  def empty?
    [true, false].sample
  end

end
