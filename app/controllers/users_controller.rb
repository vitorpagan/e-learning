class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show
  def search_address
    head(:forbidden) and return if !request.xhr?

    address_service = AddressService.new
    address = address_service.find_address_by_zipcode(params[:zipcode])

    if address
      render json: address.to_json
    else
      render json: {}, status: 404
    end
  end

  def show
  end
end
