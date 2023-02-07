class Api::V1::OpenAiCompletionUsagesController < ApplicationController
  
  before_action :find_open_ai_completion_usage, only: [:show, :update, :destroy]

  def index
    @open_ai_completion_usages = OpenAiCompletionUsage.all
  end

  def create
    @open_ai_completion_usage = OpenAiCompletionUsage.new(open_ai_completion_usage_params)

    if @open_ai_completion_usage.save
      render :show
    else
      render json: { errors: @open_ai_completion_usage.errors.full_messages }, 
      status: :unprocessable_entity
    end
  end

  def update
    if @open_ai_completion_usage.update(open_ai_completion_usage_params)
      render :show
    else
      render json: { errors: @open_ai_completion_usage.errors.full_messages }, 
      status: :unprocessable_entity
    end
  end

  def destroy
    @open_ai_completion_usage.destroy
  end

  private

  def find_open_ai_completion_usage
    @open_ai_completion_usage = OpenAiCompletionUsage.find(params[:id])
  end

  def open_ai_completion_usage_params
    params.require(:open_ai_completion_usage)
      .permit(
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
        :user_id,
        :open_ai_completion_usage_choices_attributes => [
          :text, 
          :index, 
          :logprobs,
          :finish_reason
        ])
  end
end