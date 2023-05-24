module Types
  class MutationType < Types::BaseObject
    field :create_book, mutation: Mutations::CreateBook
    # mutation {
    #   createBook(input: {title: "The Hobbit", pages: 306, yearPublished: 1937}) {
    #   title
    #   publishedThisYear
    #   }
    # }
  end
end
