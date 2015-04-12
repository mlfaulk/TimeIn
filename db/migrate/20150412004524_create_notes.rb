class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
    	t.text		:note_text
    	t.integer	:author_id	#id of teacher/administrator who wrote the note
    	t.integer	:visit_id	#id of corresponding visit
      t.timestamps
    end
  end
end
