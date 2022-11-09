require 'rails_helper'

describe "Paper details page" do
  it "should display the full name of a papers author" do
    author = Author.create({first_name: 'Alan', last_name: 'Turing', homepage:'https://wikipedia.org/Alan_Turing'})
    paper = Paper.create({title: "Titel", venue: "Potsdam", year: 2000, authors: [author]})
    visit paper_path(paper)
    expect(page).to have_text(author.name)
  end
end