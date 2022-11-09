require 'rails_helper'

RSpec.describe Author, type: :model do
  it 'should store an authors firstname, lastname and homepage' do
    author = Author.create({first_name: 'Alan', last_name: 'Turing', homepage:'http://wikipedia.org/Alan_Turing'})
    expect(author.first_name).to eq('Alan')
    expect(author.last_name).to eq('Turing')
    expect(author.homepage).to eq('http://wikipedia.org/Alan_Turing')
  end

  it 'should be able to return the concatenated name' do
    author = Author.create({first_name: 'Alan', last_name: 'Turing', homepage:'http://wikipedia.org/Alan_Turing'})
    expect(author.name).to eq('Alan Turing')
  end

  it "should make sure that an author has a lastname" do
    a = Author.create({first_name: 'Alan', last_name: '', homepage:'http://wikipedia.org/Alan_Turing'})
    expect(a).to_not be_valid
    a.last_name = 'Turing'
    expect(a).to be_valid
  end

  it "should make sure that an author has a firstname" do
    a = Author.create({first_name: '', last_name: 'Kowalski', homepage:'https://website.de'})
    expect(a).to_not be_valid
    a.first_name = '-'
    expect(a).to be_valid
  end

  it "should have an empty list of papers" do
    a = Author.create({first_name: 'P', last_name: 'Kowalski', homepage:'https://website.de'})
    expect(a.papers).to be_empty
  end
end
