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

ActiveRecord::Schema.define(:version => 0) do

  create_table "accounts", :force => true do |t|
    t.integer "bld_id",                                             :null => false
    t.string  "acc_type",            :limit => 3
    t.string  "acc_branch",          :limit => 3
    t.string  "acc_number",          :limit => 20
    t.float   "acc_starting_amount",               :default => 0.0
    t.text    "acc_remarks"
    t.integer "acc_bank"
  end

  create_table "ad_cat_codes", :id => false, :force => true do |t|
    t.integer "id",                      :null => false
    t.string  "code_desc", :limit => 30
  end

  create_table "ads", :force => true do |t|
    t.integer "bld_id",                                       :null => false
    t.string  "name"
    t.string  "title",                                        :null => false
    t.text    "content_txt",                                  :null => false
    t.boolean "is_asking"
    t.boolean "is_offering"
    t.string  "phone_num",     :limit => 15
    t.text    "remarks"
    t.float   "price_asked",                 :default => 0.0
    t.integer "category",                    :default => 0
    t.time    "creation_date",                                :null => false
    t.time    "update_time",                                  :null => false
  end

  create_table "app_codes", :force => true do |t|
    t.string "code_desc", :limit => 30
  end

  create_table "app_taxes", :id => false, :force => true do |t|
    t.integer "app_id",     :null => false
    t.integer "bld_id",     :null => false
    t.date    "start_date", :null => false
    t.integer "app_num",    :null => false
    t.float   "tax_amount"
  end

  create_table "appartments", :force => true do |t|
    t.integer "bld_id",                        :null => false
    t.integer "app_num",                       :null => false
    t.integer "app_flat_num",   :default => 0
    t.integer "app_type",       :default => 1
    t.date    "start_mnt_date"
    t.date    "next_mnt_date"
    t.integer "mnt_gap",        :default => 1
    t.integer "mnt_gap_type",   :default => 2, :null => false
  end

  create_table "apt_maintenance", :force => true do |t|
    t.integer "bld_id",                      :null => false
    t.integer "apt_id",                      :null => false
    t.date    "start_date",                  :null => false
    t.float   "amount",     :default => 0.0
  end

  create_table "bank_codes", :force => true do |t|
    t.string "code_desc", :limit => 30
  end

  create_table "buildings", :force => true do |t|
    t.integer "site_id",                                       :null => false
    t.boolean "is_active",                   :default => true, :null => false
    t.string  "bld_street",    :limit => 50,                   :null => false
    t.string  "bld_num",       :limit => 10,                   :null => false
    t.string  "bld_city",      :limit => 25,                   :null => false
    t.string  "bld_zip",       :limit => 5,                    :null => false
    t.integer "bld_num_app",                 :default => 30,   :null => false
    t.integer "bld_min_floor",               :default => 0,    :null => false
    t.integer "bld_max_floor",               :default => 6,    :null => false
  end

  create_table "comment_codes", :force => true do |t|
    t.string "code_desc", :limit => 30
  end

  create_table "comments", :force => true do |t|
    t.integer "bld_id",                          :null => false
    t.integer "post_id",                         :null => false
    t.integer "author_id",                       :null => false
    t.text    "content_text",                    :null => false
    t.integer "status",                          :null => false
    t.date    "create_time"
    t.boolean "is_locked",    :default => false, :null => false
  end

  create_table "contact_codes", :force => true do |t|
    t.string "code_desc", :limit => 30
  end

  create_table "contacts", :force => true do |t|
    t.integer "bld_id",                        :null => false
    t.string  "cnt_first_name", :limit => 20
    t.string  "cnt_last_name",  :limit => 20
    t.string  "cnt_phone1",     :limit => 20
    t.string  "cnt_phone2",     :limit => 20
    t.string  "cnt_address",    :limit => 100
    t.text    "cnt_remarks"
    t.integer "cnt_type"
    t.string  "cnt_email",      :limit => 50
  end

  create_table "forums", :force => true do |t|
    t.integer "bld_id",                    :null => false
    t.string  "forum_name",                :null => false
    t.text    "forum_desc"
    t.integer "forum_mngr", :default => 0
  end

  create_table "incomes", :force => true do |t|
    t.integer "bld_id",                            :null => false
    t.integer "prj_id",         :default => 0,     :null => false
    t.date    "inc_date",                          :null => false
    t.date    "inc_until_date"
    t.float   "inc_amount",                        :null => false
    t.boolean "inc_paid",       :default => false
    t.integer "inc_branch"
    t.integer "inc_chk_no"
    t.date    "inc_chk_date"
    t.integer "inc_apt_num"
    t.integer "inc_bank",       :default => 0,     :null => false
  end

  create_table "pay_codes", :id => false, :force => true do |t|
    t.integer "id",                      :null => false
    t.string  "code_desc", :limit => 30
  end

  create_table "poll_attendents", :id => false, :force => true do |t|
    t.integer "pol_id",          :null => false
    t.integer "bld_id",          :null => false
    t.integer "tnt_id",          :null => false
    t.integer "app_num",         :null => false
    t.integer "option_selected"
  end

  add_index "poll_attendents", ["app_num"], :name => "pollattendents_app_num_key", :unique => true

  create_table "poll_codes", :id => false, :force => true do |t|
    t.integer "id",                      :null => false
    t.string  "code_desc", :limit => 30
  end

  create_table "poll_options", :force => true do |t|
    t.integer "poll_id",     :null => false
    t.integer "bld_id",      :null => false
    t.integer "po_position"
    t.string  "po_title",    :null => false
  end

  create_table "polls", :force => true do |t|
    t.integer "bld_id",                          :null => false
    t.integer "pol_type",     :default => 0,     :null => false
    t.string  "pol_title",                       :null => false
    t.date    "pol_date",                        :null => false
    t.text    "pol_desc"
    t.date    "pol_exp_date"
    t.boolean "pol_on_main",  :default => false, :null => false
    t.boolean "pol_active",   :default => false, :null => false
  end

  create_table "post_codes", :id => false, :force => true do |t|
    t.integer "id",                      :null => false
    t.string  "code_desc", :limit => 30
  end

  create_table "post_tags", :id => false, :force => true do |t|
    t.integer "bld_id",  :null => false
    t.integer "post_id", :null => false
    t.integer "tag_id",  :null => false
  end

  create_table "posts", :force => true do |t|
    t.integer  "bld_id",                                           :null => false
    t.integer  "author_id",                                        :null => false
    t.integer  "pst_status",                                       :null => false
    t.string   "title",           :limit => 128,                   :null => false
    t.text     "content_txt",                                      :null => false
    t.string   "pst_picture",     :limit => 128
    t.datetime "create_time"
    t.datetime "update_time"
    t.integer  "forum_id"
    t.boolean  "adding_comments",                :default => true, :null => false
  end

  create_table "projects", :force => true do |t|
    t.integer "bld_id",                              :null => false
    t.string  "prj_title",             :limit => 50
    t.text    "prj_desc"
    t.float   "prj_approx_cost"
    t.float   "prj_actual_cost"
    t.date    "prj_approx_start_date"
    t.date    "prj_actual_start_date"
    t.date    "prj_approx_end_date"
    t.date    "prj_actual_end_date"
  end

  create_table "receipts", :force => true do |t|
    t.integer "bld_id",                                         :null => false
    t.integer "ser_num",                                        :null => false
    t.integer "rct_year"
    t.date    "rct_date",                                       :null => false
    t.float   "rct_amount",                                     :null => false
    t.integer "rct_tnt_id",                      :default => 0, :null => false
    t.string  "rct_name",         :limit => 60
    t.string  "rct_full_address", :limit => 250
    t.string  "rct_city",         :limit => 60
    t.string  "rct_zip",          :limit => 10
    t.string  "rct_phone",        :limit => 15
    t.integer "rct_trn_id"
  end

  create_table "registries", :id => false, :force => true do |t|
    t.integer "id",                           :null => false
    t.integer "bld_id",                       :null => false
    t.integer "tnt_app_num"
    t.string  "tnt_first_name", :limit => 15
    t.string  "tnt_last_name",  :limit => 15
    t.string  "tnt_password",   :limit => 60
    t.date    "tnt_birthday"
    t.string  "tnt_email",      :limit => 60
    t.string  "tnt_app_phone",  :limit => 20
    t.string  "tnt_picture"
    t.string  "tnt_mobile",     :limit => 20
    t.date    "tnt_entry_date"
    t.string  "tnt_occupation", :limit => 30
    t.boolean "tnt_is_owner"
  end

  add_index "registries", ["tnt_email"], :name => "registries_tnt_email_key", :unique => true
  add_index "registries", ["tnt_first_name", "tnt_last_name"], :name => "registries_tnt_first_name_tnt_last_name_key", :unique => true

  create_table "reminders", :force => true do |t|
    t.integer  "bld_id",        :null => false
    t.integer  "apt_id",        :null => false
    t.datetime "reminder_time"
    t.string   "title",         :null => false
    t.text     "remarks"
  end

  create_table "sites", :force => true do |t|
    t.string "st_name",       :limit => 100, :null => false
    t.string "st_slogen",     :limit => 150
    t.string "st_street",     :limit => 50
    t.string "st_street_num", :limit => 10
    t.string "st_city",       :limit => 25
    t.string "st_zipcode",    :limit => 5
  end

  create_table "tags", :force => true do |t|
    t.integer "bld_id",                                  :null => false
    t.string  "tag_name",  :limit => 128,                :null => false
    t.integer "frequency",                :default => 1
  end

  create_table "task_codes", :id => false, :force => true do |t|
    t.integer "id",                      :null => false
    t.string  "code_desc", :limit => 30
  end

  create_table "tasks", :force => true do |t|
    t.integer "bld_id",                     :null => false
    t.integer "tnt_id",                     :null => false
    t.string  "tsk_title",   :limit => 150, :null => false
    t.text    "tsk_details",                :null => false
    t.date    "tsk_duedate"
    t.integer "tsk_status"
  end

  create_table "taxes", :id => false, :force => true do |t|
    t.integer "bld_id",         :null => false
    t.date    "tax_start_date", :null => false
    t.float   "tax_amount",     :null => false
  end

  create_table "tenants", :force => true do |t|
    t.integer "bld_id",                                             :null => false
    t.boolean "tnt_is_active",                   :default => false
    t.integer "tnt_app_num",                                        :null => false
    t.string  "tnt_first_name",    :limit => 15,                    :null => false
    t.string  "tnt_last_name",     :limit => 15,                    :null => false
    t.string  "tnt_password",      :limit => 60
    t.date    "tnt_birthday"
    t.string  "tnt_email",         :limit => 60
    t.string  "tnt_app_phone",     :limit => 20
    t.string  "tnt_picture"
    t.string  "tnt_mobile",        :limit => 20
    t.date    "tnt_entry_date"
    t.float   "tnt_prev_debt"
    t.string  "tnt_occupation",    :limit => 30
    t.boolean "tnt_is_vaad",                     :default => false
    t.boolean "tnt_is_owner",                    :default => true
    t.boolean "tnt_is_site_vaad",                :default => false
    t.boolean "tnt_is_nbrhd_vaad",               :default => false
    t.boolean "tnt_is_city_vaad",                :default => false
    t.boolean "tnt_is_admin",                    :default => false
  end

  create_table "ticket_codes", :id => false, :force => true do |t|
    t.integer "id",                      :null => false
    t.string  "code_desc", :limit => 30
  end

  create_table "ticket_history", :id => false, :force => true do |t|
    t.integer "id",                      :null => false
    t.integer "tkt_id",                  :null => false
    t.integer "bld_id",                  :null => false
    t.integer "tnt_id",                  :null => false
    t.date    "tkh_date",                :null => false
    t.string  "tkh_title", :limit => 50
    t.text    "tkh_desc"
  end

  create_table "tickets", :force => true do |t|
    t.integer "bld_id",                                     :null => false
    t.integer "tnt_id",                                     :null => false
    t.integer "tkt_status",                  :default => 0
    t.date    "tkt_opendate"
    t.string  "tkt_title",     :limit => 50,                :null => false
    t.date    "tkt_eta"
    t.date    "tkt_closedate"
  end

  create_table "todo", :force => true do |t|
    t.string  "tsk_title",       :limit => 30,                :null => false
    t.integer "tsk_status",                                   :null => false
    t.string  "tsk_category",    :limit => 30,                :null => false
    t.text    "tsk_description"
    t.integer "tsk_priority",                  :default => 1, :null => false
  end

  create_table "transactions", :force => true do |t|
    t.integer "bld_id",                      :null => false
    t.integer "acc_id",                      :null => false
    t.integer "prj_id",                      :null => false
    t.date    "trn_date",                    :null => false
    t.float   "trn_amount",                  :null => false
    t.integer "trn_debit"
    t.string  "trn_reference", :limit => 30
    t.string  "trn_desc"
    t.integer "trn_cat"
  end

  create_table "trn_cat_codes", :id => false, :force => true do |t|
    t.integer "id",                      :null => false
    t.string  "code_desc", :limit => 30
  end

end
