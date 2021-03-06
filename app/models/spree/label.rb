module Spree
  class Label < ActiveRecord::Base
		has_many :product_labels, :class_name => "Spree::ProductLabel", :dependent => :destroy
		has_many :products, :through => :product_labels
    belongs_to  :seller

		validates :color, :presence => true
		validates :shape, :presence => true
		validates :title, :presence => true

		attr_accessible :title, :shape, :color, :seller_id, :is_approved

		SHAPES = ['circle', 'square']
		COLORS = 	[
								['black', 			'#333'],
								['red', 				'#F02311'],
								['crimson', 		'#8D2036'],
								['brown', 			'#785D56'],
								['purple', 			'#992C60'],
								['dark_purple', '#623645'],
								['vineyard', 		'#7FAF1B']
							]

  end
end
