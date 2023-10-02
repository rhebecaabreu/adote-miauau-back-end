class CreatePublication

  def initialize(publication_params, address_params, pet_params, current_user)
    @publication_params = publication_params
    @pet_params = pet_params
    @address_params = address_params
    @current_user = current_user
  end

  def create
    category = find_category
    return category if category.errors.present?

    ActiveRecord::Base.transaction do
      publication = create_publication(category)
      create_address(publication)
      pet = create_pet(publication)
      create_images(pet)
      publication
    end
  end

  private

  attr_reader :publication_params, :pet_params, :address_params, :current_user

  def find_category
    Category.find_by(id: publication_params[:category_id])
  end

  def create_publication(category)
    current_user.publications.create!(
      title: publication_params[:title], description: publication_params[:description], category: category
    )
  end

  def create_address(publication)
    Address.create!(
      addressable: publication, state: address_params[:state], city: address_params[:city],
      cep: address_params[:cep], street: address_params[:street],
      number: address_params[:number], complement: address_params[:complement]
    )
  end

  def create_pet(publication)
    Pet.create!(
      publication: publication, kind: pet_params[:kind], age: pet_params[:age],
      vaccinated: pet_params[:vaccinated], castrated: pet_params[:castrated],
      vermifugated: pet_params[:vermifugated], coat_color: pet_params[:coat_color],
      status: pet_params[:status], size: pet_params[:size]
    )
  end

  def create_images(pet)
    publication_params[:images].each do |key, image|
      Image.create!(file: image, imageable: pet)
    end
  end

end