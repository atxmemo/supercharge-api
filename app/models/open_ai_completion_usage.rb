class OpenAiCompletionUsage < ApplicationRecord
  belongs_to :user
  has_many :open_ai_completion_usage_choices
  accepts_nested_attributes_for :open_ai_completion_usage_choices

  before_save :calculate_cost

  valid_models = %w(text-ada-001 text-babbage-001 text-curie-001 text-davinci-003)
  validates :request_model, presence: true, inclusion: { in: valid_models, message: "%{value} is not a valid model" }
  
  validates :response_id, presence: true
  validates :response_object, presence: true
  validates :response_created, presence: true
  validates :response_model, presence: true
  validates :response_usage_prompt_tokens, presence: true
  validates :response_usage_completion_tokens, presence: true
  validates :response_usage_total_tokens, presence: true

  MODEL_PRICING = {
    ada: 0.0000004,
    babbage: 0.0000005,
    curie: 0.0000020,
    davinci: 0.0000200
  }.freeze

  def calculate_cost
    price_per_token = MODEL_PRICING[self.request_model.split('-')[1].to_sym]
    self.cost = (price_per_token * self.response_usage_total_tokens).round(10)
  end
  
end