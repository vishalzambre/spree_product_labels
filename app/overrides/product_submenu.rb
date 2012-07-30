Deface::Override.new(:virtual_path => "spree/admin/shared/_product_sub_menu",
                     :name => "admin_labels",
                     :insert_bottom => "[data-hook='admin_product_sub_tabs']",
                     :text => "<%= tab(:labels, :label => 'labels', :match_path => '/labels') %>",
                     :disabled => false)

