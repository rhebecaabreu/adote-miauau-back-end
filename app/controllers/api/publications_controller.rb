class Api::PublicationsController < ApplicationController
  before_action :authenticate_user_from_token!, except: [:index]

  def index
    publications = Publication.all.order(created_at: :desc)

    render_success(publications)
  end

  def create
    address = JSON.parse(params[:address])
    pet = JSON.parse(params[:pet])
    publish_params = publication_params.merge(address: address, pet: pet)

    category = Category.find_by(id: publish_params[:category_id])

    if category.present?
      publication = current_user.publications.create(
        title: publish_params[:title], description: publish_params[:description], category: category
      )
      if publication.present?
        address = Address.create(addressable: publication, state: publish_params[:address][:state], city: publish_params[:address][:city],
                                 cep: publish_params[:address][:cep], street: publish_params[:address][:street], number: publish_params[:address][:number], complement: publish_params[:address][:complement])
        pet = Pet.create(
          publication: publication, kind: publish_params[:pet][:kind], age: publish_params[:pet][:age],
          vaccinated: publish_params[:pet][:vaccinated], castrated: publish_params[:pet][:castrated], vermifugated: publish_params[:pet][:vermifugated],
          coat_color: publish_params[:pet][:coat_color], status: publish_params[:pet][:status], size: publish_params[:pet][:size])

        if pet.present?
          publish_params[:images].each do |key, image|
            Image.create(file: image, imageable: pet)
          end
        end

        return render_unprocessable_entity_error unless pet.present? && address.present?

        render_success(publication)
      else
        render_unprocessable_entity_error(publication.errors)
      end
    else
      render_not_found_error
    end
  end

  private

  def publication_params
    params.permit(:title, :description, :category_id,
                  images: {},
                  pet: [:kind, :age, :vaccinated, :castrated, :vermifugated, :coat_color, :status, :size, :sex ],
                  address: [:state, :city, :cep, :street, :number, :complement])
  end

end
