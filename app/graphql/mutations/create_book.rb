class Mutations::CreateBook < Mutations::BaseMutation
  argument :title, String, required: true
  argument :pages, Integer, required: true
  argument :year_published, Integer, required: false

  type Types::BookType

  def resolve(title:, pages:, year_published:)
    Book.new(
      title: title,
      pages: pages,
      year_published: year_published)
  end
end
