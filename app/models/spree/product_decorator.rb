Spree::Product.class_eval do
  has_many :product_labels, :class_name => "Spree::ProductLabel", :dependent => :destroy
  has_many :labels, :through => :product_labels



end