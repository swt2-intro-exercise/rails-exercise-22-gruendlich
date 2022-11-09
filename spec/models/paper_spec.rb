require 'rails_helper'

RSpec.describe Paper, type: :model do
  it 'should store a papers title, venue and year of publication' do
    paper = Paper.create({title: "Titel", venue: "Potsdam", year: 2000})
    expect(paper.title).to eq('Titel')
    expect(paper.venue).to eq('Potsdam')
    expect(paper.year).to eq(2000)
  end

  it "should make sure that a paper has a title" do
    paper = Paper.create({title: "", venue: "Potsdam", year: 2000})
    expect(paper).to_not be_valid
    paper.title = 'Ja'
    expect(paper).to be_valid
  end

  it "should make sure that a paper has a venue" do
    paper = Paper.create({title: "Titel", venue: "", year: 2000})
    expect(paper).to_not be_valid
    paper.venue = 'Stadt'
    expect(paper).to be_valid
  end

  it "should make sure that a paper has a year of publication given as an integer" do
    paper = Paper.create({title: "Titel", venue: "Stadt"})
    expect(paper).to_not be_valid
    paper.year = "A"
    expect(paper).to_not be_valid
    paper.year = 0
    expect(paper).to be_valid
  end
end
