class CreateOpenAiCompletionUsages < ActiveRecord::Migration[7.0]
  def change
    create_table :open_ai_completion_usages do |t|
      t.belongs_to :user, null: false
      t.string :request_model, null: false
      t.string :request_prompt, null: false, default: '<|endoftext|>'
      t.string :request_suffix
      t.integer :request_max_tokens, null: false, default: 16
      t.float :request_temperature, null: false, default: 1
      t.float :request_top_p, null: false, default: 1
      t.integer :request_n, null: false, default: 1
      t.boolean :request_stream, null: false, default: false
      t.integer :request_logprobs
      t.boolean :request_echo, null: false, default: false
      t.string :request_stop
      t.float :request_presence_penalty, null: false, default: 0
      t.float :request_frequency_penalty, null: false, default: 0
      t.integer :request_best_of, null: false, default: 1
      t.string :response_id, null: false
      t.string :response_object, null: false
      t.bigint :response_created, null: false
      t.string :response_model, null: false
      t.integer :response_usage_prompt_tokens, null: false
      t.integer :response_usage_completion_tokens, null: false
      t.integer :response_usage_total_tokens, null: false
      t.float :cost, null: false
      t.string :user_identifier, null: false
      t.timestamps
    end
  end
end