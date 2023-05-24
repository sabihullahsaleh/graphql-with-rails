# frozen_string_literal: true

module Types
  class AuthorType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :date_of_birth, GraphQL::Types::ISO8601DateTime
    field :place_of_birth, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :books, [Types::BookType], null: false

    # field :author_books, [Types::BookType], null: false  # Add this line
    #
    # def author_books
    #   object.books  # Assuming the association method is called 'books'
    # end
  end
end
