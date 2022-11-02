require 'rails_helper'

def createTestAuthor
  visit new_author_path
  page.fill_in 'author[first_name]', with: 'Alan'
  page.fill_in 'author[last_name]', with: 'Turing'
  page.fill_in 'author[homepage]', with: 'http://wikipedia.org/Alan_Turing'
  find('input[type="submit"]').click
end

describe "New author page", type: :feature do
  it "should exist at 'new_author_path' and render without error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    visit new_author_path
  end

  it "should have text inputs for an author's first name, last name, and homepage" do
    visit new_author_path
    # these are the standard names given to inputs by the Rails form builder
    expect(page).to have_field('author[first_name]')
    expect(page).to have_field('author[last_name]')
    expect(page).to have_field('author[homepage]')
  end

  it "should allow the creation of a new user in the database" do
    author = Author.create({first_name: 'Alan', last_name: 'Turing', homepage:'http://wikipedia.org/Alan_Turing'})
    createTestAuthor
    expect(Author.find_by_last_name('Turing')).to eq(author)
  end

  it "should only save the new author if his entries are valid" do
    visit new_author_path
    page.fill_in 'author[first_name]', with: 'Alan'
    page.fill_in 'author[last_name]', with: ''
    page.fill_in 'author[homepage]', with: 'http://wikipedia.org/Alan_Turing'
    find('input[type="submit"]').click
    expect(page.current_path).to eq("/authors/new")
  end
end