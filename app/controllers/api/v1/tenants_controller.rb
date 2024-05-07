# frozen_string_literal: true

class API::V1::TenantsController < ApplicationController

  # TODO: extract update logic to service when/if more logic added
  def update_custom_fields
    if tenant.update(custom_fields_params)
      render :update_custom_fields, status: 200
    else
      render_errors(tenant)
    end
  end

  private

  def tenant
    @tenant ||= Tenant.find(params[:id])
  end

  def custom_fields_params
    params.require(:tenant).permit(
      custom_fields_attributes: [:name, :label, :field_type, :user_id, available_values: []]
    )
  end
end
