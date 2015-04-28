class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
    	t.string	:username
    	t.string 	:firstname
    	t.string 	:lastname
    	t.integer	:gender					# 1=female, 2=male
    	t.integer :visit_count
    	t.integer	:current_reason_num 	# Matches with order of options in dropdown menu.  
    										              # For example, 1="Spoke when he/she was supposed to be quiet."
    	t.integer	:current_visit_id		

      t.timestamps
    end
  end
end
