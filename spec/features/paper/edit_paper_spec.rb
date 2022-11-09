require "rails_helper"

describe "Edit paper page" do
  paper = Paper.create({title: "Titel", venue: "Potsdam", year: 2000})


  it "should be reachable without errors" do
    visit edit_paper_path(paper)
  end

  it "should update made changes accordingly" do
    visit edit_paper_path(paper)
    page.fill_in 'paper[title]', with: 'TestTitel'
    find('input[type="submit"]').click
    expect(Paper.find(paper.id).title).not_to eq(paper.title)
  end

  it "should have an author select box" do
    visit edit_paper_path(paper)
    expect(page).to have_select
  end

  it "should allow the selection of a previously created author" do
    visit edit_paper_path(paper)
    expect(page).to have_select("paper[author_ids][]", with_options:["Test Man"])
  end

  it "should store the selected authors" do
    author = Author.create({first_name: 'Test', last_name: 'Man', homepage:'https://website.de'})
    visit edit_paper_path(paper)
    select "Test Man", from: "paper[author_ids][]", match: :first
    find('input[type="submit"]').click
    expect(paper.authors.first.name).to eq(author.name)
    # author.delete
  end
end