class Machine < ActiveRecord::Base
  has_many :turn_tables

  def turn!
    rotate_position
    save!
  end

  private

  def rotate_position
    if current_position < positions
      self.current_position += 1
    else
      self.current_position = 1
    end
  end
end
