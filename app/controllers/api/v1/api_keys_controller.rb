class Api::V1::ApiKeysController < ApplicationController
  before_action :set_api_key, only: [:destroy]
  before_action :ensure_authenticated_user

  def index
    @api_keys = current_user.api_keys
  end

  def create
    @api_key = current_user.api_keys.create!(token: SecureRandom.hex(32))
  end

  def destroy
    @api_key.destroy
    head :no_content
  end

  private

  def set_api_key
    @api_key = ApiKey.find_by(token: params[:id])
  end

  def ensure_authenticated_user
    head :unauthorized unless current_user
  end
end