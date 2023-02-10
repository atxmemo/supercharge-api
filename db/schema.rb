# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_02_08_030739) do

  create_table "api_keys", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "token", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index "\"user\"", name: "index_api_keys_on_user", unique: true
    t.index ["token"], name: "index_api_keys_on_token", unique: true
    t.index ["user_id"], name: "index_api_keys_on_user_id"
  end

  create_table "open_ai_completion_usage_choices", force: :cascade do |t|
    t.integer "open_ai_completion_usage_id", null: false
    t.string "text", null: false
    t.integer "index", null: false
    t.float "logprobs"
    t.string "finish_reason", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["open_ai_completion_usage_id"], name: "index_usage_choices_on_usage_id"
  end

  create_table "open_ai_completion_usages", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "request_model", null: false
    t.string "request_prompt", default: "<|endoftext|>", null: false
    t.string "request_suffix"
    t.integer "request_max_tokens", default: 16, null: false
    t.float "request_temperature", default: 1.0, null: false
    t.float "request_top_p", default: 1.0, null: false
    t.integer "request_n", default: 1, null: false
    t.boolean "request_stream", default: false, null: false
    t.integer "request_logprobs"
    t.boolean "request_echo", default: false, null: false
    t.string "request_stop"
    t.float "request_presence_penalty", default: 0.0, null: false
    t.float "request_frequency_penalty", default: 0.0, null: false
    t.integer "request_best_of", default: 1, null: false
    t.string "response_id", null: false
    t.string "response_object", null: false
    t.bigint "response_created", null: false
    t.string "response_model", null: false
    t.integer "response_usage_prompt_tokens", null: false
    t.integer "response_usage_completion_tokens", null: false
    t.integer "response_usage_total_tokens", null: false
    t.float "cost", null: false
    t.string "user_identifier", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_open_ai_completion_usages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: 6
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at", precision: 6
    t.string "confirmation_token"
    t.datetime "confirmed_at", precision: 6
    t.datetime "confirmation_sent_at", precision: 6
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.text "tokens"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

end
