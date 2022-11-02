require "rails_helper"

describe "Authors list page" do
  it "should display all stored authors" do
    visit '/authors'

    # Test doesn't work!

    Author.all.each { |a|
      puts a
      expect(page).to have_css('table', text: 'pappnase')
      # within 'table' do
      #   expect(page).to have_text a.first_name.to_s
      #   expect(page).to have_text a.last_name.to_s
      #   expect(page).to have_text a.homepage.to_s
      #
      # end
    }
  end

  it "should provide a link to the authors creation page" do
    visit '/authors'
    expect(page).to have_link 'Create new Author', href: new_author_path
  end

  it "should provide a link to each authors index page" do
    visit '/authors'
    # Doesn't work
    Author.all.each { |a|
      expect(page).to have_link "Show", href: a.id
    }
    # within 'table' do
    #   expect(page).to have_link "Show", href:
    # end
  end
end

