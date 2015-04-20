class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
    	t.integer	:student_id
    	t.datetime	:date_time
      t.datetime  :end_time
    	t.string	:reason_num     # Matches with order of options in dropdown menu.
                                # For example, 1="Spoke when he/she was supposed to be quiet."
    	t.string	:task_choice    # either "teacher", "freewrite", or "promise"
    	t.text		:task_text
      t.timestamps
    end
  end
end
