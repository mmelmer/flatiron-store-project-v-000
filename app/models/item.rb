class Item < ActiveRecord::Base

  belongs_to :category
  has_many :line_items


  def self.available_items
    available = []
    self.all.each do |item|
      available << item if (item.inventory > 0)
    end
    return available
  end

end
