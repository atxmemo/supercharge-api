json.extract! open_ai_completion_usage,
  :request_model,
  :request_prompt,
  :request_suffix,
  :request_max_tokens,
  :request_temperature,
  :request_top_p,
  :request_n,
  :request_stream,
  :request_logprobs,
  :request_echo,
  :request_stop,
  :request_presence_penalty,
  :request_frequency_penalty,
  :request_best_of,
  :response_id,
  :response_object,
  :response_created,
  :response_model,
  :response_usage_prompt_tokens,
  :response_usage_completion_tokens,
  :response_usage_total_tokens,
  :cost

# open_ai_completion_usage choices
json.open_ai_completion_usage_choices do 
  open_ai_completion_usage.open_ai_completion_usage_choices.each do |open_ai_completion_usage_choices|
    json.extract! open_ai_completion_usage_choices, 
      :text,
      :index,
      :logprobs,
      :finish_reason
  end   
end