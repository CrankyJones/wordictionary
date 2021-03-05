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

describe('create a word deletion path',  {:type => :feature}) do
  it('deletes a word') do
    visit('/words')
    click_on('Helmet')
    click_on('Delete Word')
    expect(page).not_to have_content('Helmet')
  end
end

describe('create a definition path',  {:type => :feature}) do
  it('adds a definition to a word') do
    word = Word.new('Hat', nil)
    word.save
    visit("/words/#{word.id}")
    fill_in('definition', :with => 'protective head gear')
    click_on('Submit Definition')
    expect(page).to have_content('protective head gear')
  end
end

describe('create an update definition path', {:type => :feature}) do
  it('updates an existing definition') do
    visit('/words')
    click_on('Hat')
    click_on('protective head gear')
    fill_in('definition', :with => 'stylish head wear')
    click_on('Update Definition')
    expect(page).to have_content('stylish head wear')
  end
end

describe('create a delete defintion path', {:type => :feature}) do
  it('deletes an existing definition') do
    visit('/words')
    click_on('Hat')
    click_on('stylish head wear')
    click_on('Delete Definition')
    expect(page).to have_content('There are currently no definitions.')
  end
end



