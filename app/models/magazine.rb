#started at 10pm
class Magazine < ActiveRecord::Base
  has_many :subscriptions
  has_many :readers, through: :subscriptions

  def email_list
    # emails = ""
    # readers.pluck(:email).each {|email| emails += "#{email}; "}
    readers.pluck(:email).join("; ")
  end

  def self.most_popular
    all.max_by { |mag| mag.subscriptions.count }
  end
end
