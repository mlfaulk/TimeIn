class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
    	t.string	:char_scen_img_file
    	t.string	:caption
      t.timestamps
    end
  end
end
