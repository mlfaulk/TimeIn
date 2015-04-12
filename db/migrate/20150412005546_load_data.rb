class LoadData < ActiveRecord::Migration
  def up
    # Create initial users.
    down
    mg = Student.new(:firstname => "Maggie", :lastname => "Goulder", :gender => 1, :visit_count => 0, :current_reason_num => 0, :current_visit_id => 0)
    mg.save(:validate => false)
    je = Student.new(:firstname => "Julia", :lastname => "Enthoven", :gender => 1, :visit_count => 0, :current_reason_num => 0, :current_visit_id => 0)
    je.save(:validate => false)
    mf = Student.new(:firstname => "Megan", :lastname => "Faulk", :gender => 1, :visit_count => 0, :current_reason_num => 0, :current_visit_id => 0)
    mf.save(:validate => false)
    
    
    # Create initial photos.
    #photo1 = Photo.new(:date_time => "2012-08-30 10:44:23",
        #:file_name => "ouster.jpg")
    #photo1.user = jo
    #photo1.save(:validate => false)
    
  end

  def down
      #Comment.delete_all
      #Photo.delete_all
      Student.delete_all
  end
end