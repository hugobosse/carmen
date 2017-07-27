require "administrate/base_dashboard"

class DemandDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    budget: Field::BelongsTo,
    tags: Field::String,
    status: Field::BelongsTo,
    pings: Field::HasMany,
    id: Field::Number,
    number_of_people: Field::Number,
    comment: Field::Text,
    location: Field::String,
    scheduled_at: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    phone: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :user,
    :budget,
    :tags,
    :status,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :user,
    :phone,
    :budget,
    :tags,
    :status,
    :pings,
    :number_of_people,
    :comment,
    :location,
    :scheduled_at,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :budget,
    :tags,
    :status,
    :pings,
    :number_of_people,
    :comment,
    :location,
    :scheduled_at,
    :phone,
  ].freeze

  # Overwrite this method to customize how demands are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(demand)
  #   "Demand ##{demand.id}"
  # end
end
