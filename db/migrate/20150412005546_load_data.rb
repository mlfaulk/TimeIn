class LoadData < ActiveRecord::Migration
  def up
    # Create initial students.
    down

    #test students
    mg = Student.new(:firstname => "Maggie", :lastname => "Goulder", :username => "Maggie", :gender => 1, :visit_count => 0, :current_reason_num => 0, :current_visit_id => 0, :image_file_name => "")
    mg.save(:validate => false)
    je = Student.new(:firstname => "Julia", :lastname => "Enthoven", :username => "Julia", :gender => 1, :visit_count => 0, :current_reason_num => 0, :current_visit_id => 0, :image_file_name => "")
    je.save(:validate => false)
    mf = Student.new(:firstname => "Megan", :lastname => "Faulk", :username => "Megan", :gender => 1, :visit_count => 0, :current_reason_num => 0, :current_visit_id => 0, :image_file_name => "")
    mf.save(:validate => false)

    #real students
    pc = Student.new(:firstname => "Paneah", :lastname => "Chea", :username => "Paneah", :gender => 1, :visit_count => 0, :current_reason_num => 0, :current_visit_id => 0, :image_file_name => "Chea.JPG")
    pc.save(:validate => false)
    jek = Student.new(:firstname => "Jorge", :lastname => "Ek", :username => "Jorge",:gender => 2, :visit_count => 0, :current_reason_num => 0, :current_visit_id => 0, :image_file_name => "Ek.JPG")
    jek.save(:validate => false)
    se = Student.new(:firstname => "Shawn", :lastname => "Esteves", :username => "Shawn",:gender => 2, :visit_count => 0, :current_reason_num => 0, :current_visit_id => 0, :image_file_name => "")
    se.save(:validate => false)
    jg = Student.new(:firstname => "James", :lastname => "Gayapa", :username => "James",:gender => 2, :visit_count => 0, :current_reason_num => 0, :current_visit_id => 0, :image_file_name => "Gayapa.JPG")
    jg.save(:validate => false)
    mh = Student.new(:firstname => "Malachi", :lastname => "Huang", :username => "Malachi",:gender => 2, :visit_count => 0, :current_reason_num => 0, :current_visit_id => 0, :image_file_name => "Huang.JPG")
    mh.save(:validate => false)
    gl = Student.new(:firstname => "Gisella", :lastname => "Lemus", :username => "Gisella",:gender => 1, :visit_count => 0, :current_reason_num => 0, :current_visit_id => 0, :image_file_name => "")
    gl.save(:validate => false)
    km = Student.new(:firstname => "Katia", :lastname => "Martinez", :username => "Katia",:gender => 1, :visit_count => 0, :current_reason_num => 0, :current_visit_id => 0, :image_file_name => "Martinez.JPG")
    km.save(:validate => false)
    bm = Student.new(:firstname => "Brittani", :lastname => "Mitchell", :username => "Brittani",:gender => 1, :visit_count => 0, :current_reason_num => 0, :current_visit_id => 0, :image_file_name => "Mitchell.JPG")
    bm.save(:validate => false)
    sm = Student.new(:firstname => "Silas", :lastname => "Moberg", :username => "Silas",:gender => 2, :visit_count => 0, :current_reason_num => 0, :current_visit_id => 0, :image_file_name => "Moberg.JPG")
    sm.save(:validate => false)
    jm = Student.new(:firstname => "Juliana", :lastname => "Munoz", :username => "Juliana",:gender => 1, :visit_count => 0, :current_reason_num => 0, :current_visit_id => 0, :image_file_name => "Munoz.JPG")
    jm.save(:validate => false)











    # Test techer 
    t = Teacher.new(:firstname => "teacherFirst", :lastname => "teacherLast", :username => "testaccount", :password => "12345")
    t.save(:validate => false)

    # Real teachers
    jr = Teacher.new(:firstname => "Joni", :lastname => "Rummell", :username => "jrummell", :password => "12345")
    jr.save(:validate => false)
    vi = Teacher.new(:firstname => "Vanessa", :lastname => "Irving", :username => "virving", :password => "12345")
    vi.save(:validate => false)
    hb = Teacher.new(:firstname => "Hannah", :lastname => "Brockway", :username => "hannahb", :password => "12345")
    hb.save(:validate => false)
    js = Teacher.new(:firstname => "Junior", :lastname => "Santillan", :username => "junior", :password => "12345")
    js.save(:validate => false)

    
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