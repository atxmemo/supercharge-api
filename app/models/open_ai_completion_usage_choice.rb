class OpenAiCompletionUsageChoice < ApplicationRecord
  belongs_to :open_ai_completion_usage

  validates :text, presence: true
  validates :index, presence: true
  validates :finish_reason, presence: true
end