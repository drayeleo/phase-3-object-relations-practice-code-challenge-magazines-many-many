class Reader < ActiveRecord::Base
  has_many :subscriptions
  has_many :magazines, through: :subscriptions

  def subscribe(magazine, price)
    Subscription.create(reader_id: id, magazine_id: magazine.id, price: price)
  end

  def total_subcription_price
    subscriptions.sum { |sub| sub.price }
  end

  def cancel_subscription(magazine)
    Subscription.destroy(subscriptions.find_by(magazine_id: magazine.id).id)
  end
end
