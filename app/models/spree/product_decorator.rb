Spree::Product.class_eval do
  has_many :product_labels
  has_many :labels, :through => :product_labels



end