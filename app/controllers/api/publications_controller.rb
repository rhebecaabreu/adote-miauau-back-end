class Api::PublicationsController < ApplicationController
  before_action :authenticate_user_from_token!, except: [:index]

  def index
    pet_kind_filter = params[:kind].presence || 'cat'
    category_filter = params[:category].presence || Category.find_by(name: "Adoção").id

    publications = Publication.joins(:pet, :category)
      .where(pet: { kind: pet_kind_filter }, category: { id: category_filter })
      .order(created_at: :desc)

    render_success(publications)
  end

  def create
    address_params = JSON.parse(params[:address]).deep_symbolize_keys
    pet_params = JSON.parse(params[:pet]).deep_symbolize_keys

    publication = CreatePublication.new(publication_params, address_params, pet_params, current_user).create

    render_success(publication)
  rescue ActiveRecord::RecordInvalid => e
    render_unprocessable_entity_error(e)
  end

  private

  def publication_params
    params.permit(:title, :description, :category_id,
                  images: {})
  end

end
