require 'rails_helper'

describe "Delete Paper" do
  it "deletes the selected paper" do
    paper = Paper.create({title: "Titel", venue: "Potsdam", year: 2000})
    expect(Paper.find(paper.id)).to eq(paper)
    visit paper_path(paper)
    find_button('Destroy this paper').click
    expect {Paper.find(paper.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end