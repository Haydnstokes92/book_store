require_relative 'lib/database_connection'
require_relative 'lib/book_repository'

DatabaseConnection.connect('book_store_test')

book_repository = BookRepository.new

book_repository.all.each do |book|
  p book
end