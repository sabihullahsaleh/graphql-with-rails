module Types
  class QueryType < Types::BaseObject
    field :authors, [Types::AuthorType], null: false
    def authors
      Author.all
    end

    field :author, Types::AuthorType, null: false do
      argument :id, ID, required: false
      argument :name, String, required: false
    end
    def author(id: nil, name: nil)
      if id.present?
        Author.find(id)
      else
        Author.find_by(name: name)
      end
    end

    # query($authorName: String!) {
    #   author(name: $authorName) {
    #     name
    #     books {
    #       title
    #
    #       # Include any other book fields you want to retrieve
    #     }
    #   }
    # }

    field :books, [Types::BookType], null: false do
      argument :author_id, ID, required: true
    end
    def books(author_id:)
      Author.find(author_id).books
    end

    field :searchName, [Types::AuthorType], null: false do
      argument :field, String, required: true
      argument :value, String, required: true
    end
    def searchName(field:, value:)
      case field
      when 'name'
        Author.where(name: value)
      when 'id'
        Author.where(id: value)
      # Add more cases for other searchable fields
      else
        []
      end
    end
    # query {
    #   searchName(field: "name", value: "Elfrieda Tromp CPA") {
    #     id
    #     name
    #     books {
    #       title
    #     }
    #     # Include any other author fields you want to retrieve
    #   }
    # }

    field :searchDOB, [Types::AuthorType], null: false do
      argument :yearNumber, Integer, required: true
    end
    def searchDOB(yearNumber:)
      Author.where("date_of_birth < ?" , yearNumber.years.ago)
    end
    # query($yearName: Int!) {
    #   searchDOB(yearNumber: $yearName) {
    #     id
    #     name
    #     # Include any other author fields you want to retrieve
    #   }
    # }


  end
end
