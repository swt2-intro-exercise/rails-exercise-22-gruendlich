require "rails_helper"

describe "Edit Author page" do
  it "should be reachable without errors" do
    author = Author.create({first_name: 'TestUser', last_name: 'T', homepage:'http://hpi.de'})
    visit edit_author_path(author)
  end

  it "should update made changes accordingly" do
    author = Author.create({first_name: 'TestUser', last_name: 'T', homepage:'http://hpi.de'})
    visit edit_author_path(author)
    page.fill_in 'author[first_name]', with: 'TestAlan'
    find('input[type="submit"]').click
    expect(Author.find(author.id).first_name).not_to eq(author.first_name)
  end
end