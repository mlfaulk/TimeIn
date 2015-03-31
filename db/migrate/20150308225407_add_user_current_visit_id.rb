class AddUserCurrentVisitId < ActiveRecord::Migration
  def change
  	add_column	:users, :current_visit_id, :integer
  end
end
