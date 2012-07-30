module Spree
	module Admin
		class LabelsController < ResourceController

			def index
				respond_with(@labels) do |format|
					format.html
				end
			end

			def edit
				@label = Label.find params[:id]
				@products = @label.products
			end

			def selected
				@product = load_product
				@labels = @product.labels

				respond_with(:admin, @labels)
			end

			def available
				@product = load_product
				@labels = params[:q].blank? ? [] : Label.where('lower(title) LIKE ?', "%#{params[:q].mb_chars.downcase}%")
				@labels.delete_if { |label| @product.labels.include?(label) }

				respond_with(:admin, @labels)
			end

			def select
				@product = load_product
				@label = Label.find(params[:id])
				@product.labels << @label
				@product.save
				@labels = @product.labels

				respond_with(:admin, @labels)
			end

      def remove
        @product = load_product
        @label = Label.find(params[:id])
        @product.labels.delete(@label)
        @product.save
        @labels = @product.labels

        respond_with(@label) { |format| format.js { render_js_for_destroy } }
      end

			private

			def find_all_labels
				@labels = Spree::Label.all
			end

			def load_product
				Product.find_by_permalink! params[:product_id]
			end

		end
	end
end
