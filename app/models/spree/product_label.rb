module Spree
	class ProductLabel < ActiveRecord::Base
		belongs_to :label, :class_name => "Spree::Label"
		belongs_to :product, :class_name => "Spree::Product"

	end
end
