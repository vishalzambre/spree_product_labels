Spree::Core::Engine.routes.draw do

  namespace :admin do
  	resources :products do
	    resources :labels do
	    	member do
					get :select
	        delete :remove
				end
				collection do
	        get  :selected
	        post :available
	      end
	  	end
		end

		resources :labels do
			collection do
	      get  :filtered
	    end
		end
  end

end
