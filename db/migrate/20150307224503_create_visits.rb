class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
    	t.integer	:student_id
    	t.datetime	:date_time
    	t.string	:reason_num
    	t.string	:task_choice
    	t.text		:task_text
      t.timestamps
    end
  end
end
