require "administrate/base_dashboard"

class RestaurantDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    budget: Field::BelongsTo,
    mood: Field::BelongsTo,
    taggings: Field::HasMany,
    tags: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    address: Field::String,
    latitude: Field::Number.with_options(decimals: 2),
    longitude: Field::Number.with_options(decimals: 2),
    primary_phone: Field::String,
    secondary_phone: Field::String,
    description: Field::Text,
    lunch_service_opening_at: Field::String,
    lunch_service_closing_at: Field::String,
    dinner_service_opening_at: Field::String,
    dinner_service_closing_at: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :name,
    :address,
    :user,
    :budget,
    :mood,
    :taggings,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :user,
    :budget,
    :mood,
    :taggings,
    :tags,
    :name,
    :address,
    # :latitude,
    # :longitude,
    :primary_phone,
    :secondary_phone,
    :description,
    :lunch_service_opening_at,
    :lunch_service_closing_at,
    :dinner_service_opening_at,
    :dinner_service_closing_at,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :budget,
    :mood,
    :taggings,
    :tags,
    :name,
    :address,
    # :latitude,
    # :longitude,
    :primary_phone,
    :secondary_phone,
    :description,
    :lunch_service_opening_at,
    :lunch_service_closing_at,
    :dinner_service_opening_at,
    :dinner_service_closing_at,
  ].freeze

  # Overwrite this method to customize how restaurants are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(restaurant)
    "#{restaurant.id}. #{restaurant.name}"
  end
end
