require 'rails_helper'

RSpec.feature "Visitor navigates to product detail page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset("apparel1.jpg"),
        quantity: 10,
        price: 64.99
      )
      
    end
  end

  scenario "They click on a product details button" do
    # ACT
    visit root_path

    click_link("Details", match: :first)
    #  DEBUG
    
    # VERIFY
    expect(current_path).to eql("/products/10")
    save_screenshot
    expect(page).to have_css 'article.product-detail', count: 1
  end
end
