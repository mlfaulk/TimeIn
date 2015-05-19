class InitData < ActiveRecord::Migration
  def up
    # Create initial students.
    down

    #test students
    mg = Student.new(:firstname => "Maggie", :lastname => "Goulder", :username => "Maggie", :gender => 1, :visit_count => 0, :current_reason_num => 0, :current_visit_id => 0, :image_file_name => "face.png")
    mg.save(:validate => false)
    je = Student.new(:firstname => "Julia", :lastname => "Enthoven", :username => "Julia", :gender => 1, :visit_count => 0, :current_reason_num => 0, :current_visit_id => 0, :image_file_name => "face.png")
    je.save(:validate => false)
    mf = Student.new(:firstname => "Megan", :lastname => "Faulk", :username => "Megan", :gender => 1, :visit_count => 0, :current_reason_num => 0, :current_visit_id => 0, :image_file_name => "face.png")
    mf.save(:validate => false)

    #real students
    pc = Student.new(:firstname => "Paneah", :lastname => "Chea", :username => "Paneah", :gender => 1, :visit_count => 0, :current_reason_num => 0, :current_visit_id => 0, :image_file_name => "Chea.JPG")
    pc.save(:validate => false)
    jek = Student.new(:firstname => "Jorge", :lastname => "Ek", :username => "Jorge",:gender => 2, :visit_count => 0, :current_reason_num => 0, :current_visit_id => 0, :image_file_name => "Ek.JPG")
    jek.save(:validate => false)
    se = Student.new(:firstname => "Shawn", :lastname => "Esteves", :username => "Shawn",:gender => 2, :visit_count => 0, :current_reason_num => 0, :current_visit_id => 0, :image_file_name => "face.png")
    se.save(:validate => false)
    jg = Student.new(:firstname => "James", :lastname => "Gayapa", :username => "James",:gender => 2, :visit_count => 0, :current_reason_num => 0, :current_visit_id => 0, :image_file_name => "Gayapa.JPG")
    jg.save(:validate => false)
    mh = Student.new(:firstname => "Malachi", :lastname => "Huang", :username => "Malachi",:gender => 2, :visit_count => 0, :current_reason_num => 0, :current_visit_id => 0, :image_file_name => "Huang.JPG")
    mh.save(:validate => false)
    gl = Student.new(:firstname => "Gisella", :lastname => "Lemus", :username => "Gisella",:gender => 1, :visit_count => 0, :current_reason_num => 0, :current_visit_id => 0, :image_file_name => "face.png")
    gl.save(:validate => false)
    km = Student.new(:firstname => "Katia", :lastname => "Martinez", :username => "Katia",:gender => 1, :visit_count => 0, :current_reason_num => 0, :current_visit_id => 0, :image_file_name => "Martinez.JPG")
    km.save(:validate => false)
    bm = Student.new(:firstname => "Brittani", :lastname => "Mitchell", :username => "Brittani",:gender => 1, :visit_count => 0, :current_reason_num => 0, :current_visit_id => 0, :image_file_name => "Mitchell.JPG")
    bm.save(:validate => false)
    sm = Student.new(:firstname => "Silas", :lastname => "Moberg", :username => "Silas",:gender => 2, :visit_count => 0, :current_reason_num => 0, :current_visit_id => 0, :image_file_name => "Moberg.JPG")
    sm.save(:validate => false)
    jm = Student.new(:firstname => "Juliana", :lastname => "Munoz", :username => "Juliana",:gender => 1, :visit_count => 0, :current_reason_num => 0, :current_visit_id => 0, :image_file_name => "Munoz.JPG")
    jm.save(:validate => false)

    #Load resources
    r1 = Resource.new(:char_scen_img_file => "scen1.jpg", :caption => "Peeta gives bread to Katniss.")
    r1.save(:validate => false)
    r2 = Resource.new(:char_scen_img_file => "scen2.jpg", :caption => "Suzy and Brian comfort Tim when he's crying.")
    r2.save(:validate => false)
    r3 = Resource.new(:char_scen_img_file => "scen3.jpg", :caption => "Cam coaches Manny in football.")
    r3.save(:validate => false)
    r4 = Resource.new(:char_scen_img_file => "scen4.jpg", :caption => "Francis stuffs Timmy in a locker.")
    r4.save(:validate => false)
    r6 = Resource.new(:char_scen_img_file => "scen6.jpg", :caption => "Spongebob and Patrick steal a balloon.")
    r6.save(:validate => false)
    r9 = Resource.new(:char_scen_img_file => "charscenes/scen9.jpg", :caption => "Pinocchio tells a lie.")
    r9.save(:validate => false)
    r10 = Resource.new(:char_scen_img_file => "charscenes/scen10.jpg", :caption => "Lilly copies an answer off of Maria’s test.")
    r10.save(:validate => false)
    r11 = Resource.new(:char_scen_img_file => "charscenes/scen11.jpg", :caption => "Joseph and Calvin get in a fight.")
    r11.save(:validate => false)
    r12 = Resource.new(:char_scen_img_file => "charscenes/scen12.jpg", :caption => "Kate, Rob, Vanessa, and Stew dance in the school talent show.")
    r12.save(:validate => false)
    r13 = Resource.new(:char_scen_img_file => "charscenes/scen13.jpg", :caption => "Olivia paints a card for her mom.")
    r13.save(:validate => false)
    r14 = Resource.new(:char_scen_img_file => "charscenes/scen14.jpg", :caption => "Ben teaches Michelle to play drums.")
    r14.save(:validate => false)
    r15 = Resource.new(:char_scen_img_file => "charscenes/scen15.jpg", :caption => "Anthony speaks clearly when he says the morning announcements.")
    r15.save(:validate => false)
    r16 = Resource.new(:char_scen_img_file => "charscenes/scen16.jpg", :caption => "Simone gives Jessica a hug.")
    r16.save(:validate => false)
    r17 = Resource.new(:char_scen_img_file => "charscenes/scen17.jpg", :caption => "Alex throws trash on the ground.")
    r17.save(:validate => false)
    r18 = Resource.new(:char_scen_img_file => "charscenes/scen18.jpg", :caption => "Beyonce collects food for charity.")
    r18.save(:validate => false)
    r19 = Resource.new(:char_scen_img_file => "charscenes/scen19.jpg", :caption => "Stephanie gives her bus seat to an old man.")
    r19.save(:validate => false)
    r20 = Resource.new(:char_scen_img_file => "charscenes/scen20.JPG", :caption => "Carlos helps Vivian with her homework when she is struggling.")
    r20.save(:validate => false)
    r21 = Resource.new(:char_scen_img_file => "charscenes/scen21.jpg", :caption => "Juan helps Jim solve a problem.")
    r21.save(:validate => false)
    r22 = Resource.new(:char_scen_img_file => "charscenes/scen22.jpg", :caption => "Carl buys ice cream for Russel.")
    r22.save(:validate => false)
    r23 = Resource.new(:char_scen_img_file => "charscenes/scen23.jpg", :caption => "Taylor Swift taught herself to play the guitar by practicing everyday.")
    r23.save(:validate => false)
    #r24 = Resource.new(:char_scen_img_file => "charscenes/scen24.html", :caption => "Thomas keeps working on a puzzle, even though it is very hard.")
    #r24.save(:validate => false)
    r25 = Resource.new(:char_scen_img_file => "charscenes/scen25.jpg", :caption => "Zoe and Mariah play fairly during a game of CandyLand.")
    r25.save(:validate => false)
    r26 = Resource.new(:char_scen_img_file => "charscenes/scen26.jpg", :caption => "Matt finishes a long book.")
    r26.save(:validate => false)
    r27 = Resource.new(:char_scen_img_file => "charscenes/scen27.jpg", :caption => "Mark and Louis high-five after a game of soccer.")
    r27.save(:validate => false)
    r28 = Resource.new(:char_scen_img_file => "charscenes/scen28.jpg", :caption => "Margo gives up on learning Chinese when it gets hard.")
    r28.save(:validate => false)
    r29 = Resource.new(:char_scen_img_file => "charscenes/scen29.jpg", :caption => "James make fun of Snape and call him names.")
    r29.save(:validate => false)
    r30 = Resource.new(:char_scen_img_file => "charscenes/scen30.jpg", :caption => "Students spread rumors about someone else.")
    r30.save(:validate => false)
    r31 = Resource.new(:char_scen_img_file => "charscenes/scen31.jpg", :caption => "McKayla acts annoyed when she does not win first place.")
    r31.save(:validate => false)












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