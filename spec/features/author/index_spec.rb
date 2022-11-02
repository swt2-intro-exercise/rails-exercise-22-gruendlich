require "rails_helper"

describe "Authors list page" do
  it "should display all stored authors" do

  end

  it "should provide a link to the authors creation page" do
    visit '/authors'
    expect(page).to have_link 'Create new Author', href: new_author_path
  end
end

