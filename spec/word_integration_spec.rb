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