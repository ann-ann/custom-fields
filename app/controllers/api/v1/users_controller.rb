# frozen_string_literal: true

class API::V1::UsersController < ApplicationController
  # TODO: extract update logic to service when/if more logic added
  def update
    if user.update(user_params)
      render :update, status: 200
    else
      render_errors(user)
    end
  end

  private

  def user
    @user ||= User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :email,
      custom_field_values_attributes: [:custom_field_id, :value, :_destroy,]
    )
  end
end
