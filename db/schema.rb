# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130328074514) do

  create_table "admins", :force => true do |t|
    t.string   "name"
    t.string   "hashed_password"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "arrangement"
    t.integer  "teacher_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "courses", ["teacher_id"], :name => "index_courses_on_teacher_id"

  create_table "courses_students", :force => true do |t|
    t.integer  "course_id"
    t.integer  "student_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "courses_students", ["course_id"], :name => "index_courses_students_on_course_id"
  add_index "courses_students", ["student_id"], :name => "index_courses_students_on_student_id"

  create_table "coursewares", :force => true do |t|
    t.integer  "course_id"
    t.string   "file_name"
    t.string   "content_type"
    t.integer  "file_size"
    t.binary   "file_data"
    t.text     "description"
    t.integer  "downloaded"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "coursewares", ["course_id"], :name => "index_coursewares_on_course_id"

  create_table "exams", :force => true do |t|
    t.string   "name"
    t.integer  "time_limit"
    t.text     "description"
    t.integer  "course_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "exams", ["course_id"], :name => "index_exams_on_course_id"

  create_table "messages", :force => true do |t|
    t.text     "question"
    t.text     "reply"
    t.datetime "replied_at"
    t.integer  "student_id"
    t.integer  "course_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "messages", ["course_id"], :name => "index_messages_on_course_id"
  add_index "messages", ["student_id"], :name => "index_messages_on_student_id"

  create_table "notices", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "published_at"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "notifies", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "readed_times"
    t.integer  "course_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "notifies", ["course_id"], :name => "index_notifies_on_course_id"

  create_table "students", :force => true do |t|
    t.string   "stu_no"
    t.string   "name"
    t.string   "hashed_password"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "teachers", :force => true do |t|
    t.string   "tea_no"
    t.string   "name"
    t.string   "hashed_password"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
