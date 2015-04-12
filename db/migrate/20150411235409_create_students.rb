class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
    	t.string	:username
    	t.integer   :visit_count
    	t.integer	:current_reason_num
    	t.integer	:current_visit_id

      t.timestamps
    end
  end
end
