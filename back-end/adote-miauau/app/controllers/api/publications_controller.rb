class Api::PublicationsController < ApplicationController
  before_action :authenticate_user_from_token!, except: [:index]

  def index
    publications = Publication.all

    render_success(publications)
  end

  def create
    category = Category.find_by(id: publication_params[:category_id])

    if category.present?
      publication = current_user.publications.create(
        title: publication_params[:title], description: publication_params[:description], category: category
      )

      if publication.present?
        address = Address.create(addressable: publication, state: publication_params[:address][:state], city: publication_params[:address][:city],
                                 cep: publication_params[:address][:cep], street: publication_params[:address][:street], number: publication_params[:address][:number], complement: publication_params[:address][:complement])
        pet = Pet.create(
          publication: publication, kind: publication_params[:pet][:kind], age: publication_params[:pet][:age],
          vaccinated: publication_params[:pet][:vaccinated], castrated: publication_params[:pet][:castrated], vermifugated: publication_params[:pet][:vermifugated],
          coat_color: publication_params[:pet][:coat_color], status: publication_params[:pet][:status], size: publication_params[:pet][:size])

        if pet.present?
          publication_params[:pet][:images].each do |image|
            Image.create(remote_file_url: image, imageable: pet)
          end
        end

        return render_unprocessable_entity_error unless pet.present? && address.present?

        render_success(publication)
      else
        render_not_found_error
      end
    else
      render_not_found_error
    end
  end

  private

  def publication_params
    params.permit(:title, :description, :category_id,
                  pet: [:kind, :age, :vaccinated, :castrated, :vermifugated, :coat_color, :status, :size, :sex, images: []],
                  address: [:state, :city, :cep, :street, :number, :complement])
  end

end
