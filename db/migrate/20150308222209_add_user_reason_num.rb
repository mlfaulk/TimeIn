class AddUserReasonNum < ActiveRecord::Migration
  def change
  	add_column	:users, :current_reason_num, :integer
  end
end
