class LineItem < ActiveRecord::Base

  belongs_to :cart
  belongs_to :item

  def update_quantity
    self.item.inventory -= self.quantity
    self.item.save
  end


end
