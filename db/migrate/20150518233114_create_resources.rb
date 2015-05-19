class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
    	t.string	:char_scen_img_file
    	t.integer	:good_char 		# 1 = good character scenario, 0 = bad character scenario
    	t.string	:caption

      t.timestamps
    end
  end
end
