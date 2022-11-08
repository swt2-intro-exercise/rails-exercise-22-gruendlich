require 'rails_helper'

describe "Delete Author" do
  it "deletes the selected author" do
    author = Author.create({first_name: 'TestUser', last_name: 'T', homepage:'http://hpi.de'})
    expect(Author.find(author.id)).to eq(author)
    visit author_path(author)
    find_link('Delete').click
    expect {Author.find(author.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end