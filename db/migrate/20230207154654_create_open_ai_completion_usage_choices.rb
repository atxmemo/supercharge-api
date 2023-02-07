class CreateOpenAiCompletionUsageChoices < ActiveRecord::Migration[7.0]
  def change
    create_table :open_ai_completion_usage_choices do |t|
      t.belongs_to :open_ai_completion_usage, null: false, index: { name: :index_usage_choices_on_usage_id }
      t.string :text, null: false
      t.integer :index, null: false
      t.float :logprobs
      t.string :finish_reason, null: false
      t.timestamps
    end
  end
end