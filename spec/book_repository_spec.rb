require 'book_repository'

RSpec.describe BookRepository do
  def reset_book_table
    seed_sql = File.read('spec/seeds_books.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_book_table
  end

  it 'returns and list of books' do
    repo = BookRepository.new

    books = repo.all

    expect(books.length).to eq(2) # => 2
    expect(books.first.title).to eq('Noddy') # => 'Noddy'
    expect(books.first.author_name).to eq('Jack Galvin') # => 'Jack Galvin'
  end
end