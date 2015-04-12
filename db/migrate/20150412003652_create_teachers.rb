class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
    	t.string	:username
    	t.string 	:firstname
    	t.string	:lastname
    	#password
    	#photo
      t.timestamps
    end
  end
end
