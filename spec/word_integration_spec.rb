require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a word path', {:type => :feature}) do
  it('adds a new word then goes back to the words page') do
    visit('/words')
    click_on('Add a New Word')
    fill_in('word', :with => 'Helmet')
    click_on('Submit')
    expect(page).to have_content('Helmet')
  end
end

describe('create a definition path',  {:type => :feature}) do
  it('adds a definition to a word') do
    word = Word.new('Helmet', nil)
    word.save
    visit("/words/#{word.id}")
    fill_in('definition', :with => 'protective head gear')
    click_on('Submit Definition')
    expect(page).to have_content('protective head gear')
  end
end
