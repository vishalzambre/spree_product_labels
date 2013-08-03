module Spree
	module Admin
		class LabelsController < Spree::Admin::ResourceController
      
			def index
        if params[:format] == "json"
          q = params[:q]
          search = params[:search]
          if q.present?
            if current_spree_user.has_spree_role?("admin")
              labels = Spree::Label.where("title like '%#{q}%' || color like '%#{q}%'|| shape like '%#{q}%'")
            else
              labels = current_spree_user.seller.labels.where("title like '%#{q}%' || color like '%#{q}%'|| shape like '%#{q}%'")
            end
          end
          if search.present?
            labels = Spree::Label.where(:id => search)
          end
          @labels = []
          
          #labels.blank? ? [] : labels
          labels.each do |label|
            @labels.push(label.attributes)
          end unless labels.nil?

        end
				respond_with(@labels) do |format|
					format.html
          format.json
				end
			end

			def edit
				@label = Label.find params[:id]
				@products = @label.products
			end

      def create
        seller_id = current_spree_user.has_spree_role?("admin") ? params[:seller_id] : current_spree_user.seller.id
        ap seller_id
        params[:label].merge!(:seller_id => seller_id)
        super
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

      def search
        q = params[:q]
        if current_spree_user.has_spree_role?("admin")
          @labels = Spree::Label.where("title is like '%#{q}%' || color is like '%#{q}%'|| shape is like '%#{q}%'")
        else
          @labels = current_spree_user.seller.labels.where("title is like '%#{q}%' || color is like '%#{q}%'|| shape is like '%#{q}%'")
        end
        render :json => @labels.to_json
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
