require "rails_helper"

describe "Edit paper page" do
  it "should be reachable without errors" do
    paper = Paper.create({title: "Titel", venue: "Potsdam", year: 2000})
    visit edit_paper_path(paper)
  end

  it "should update made changes accordingly" do
    paper = Paper.create({title: "Titel", venue: "Potsdam", year: 2000})
    visit edit_paper_path(paper)
    page.fill_in 'paper[title]', with: 'TestTitel'
    find('input[type="submit"]').click
    expect(Paper.find(paper.id).title).not_to eq(paper.title)
  end
end