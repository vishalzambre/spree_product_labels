class CreateSpreeLabels < ActiveRecord::Migration
  def change
  	create_table :spree_labels, :force => true do |t|
      t.string :title
      t.string :color
      t.string :shape
    end
  end

end
