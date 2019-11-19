require 'rails_helper'

RSpec.feature "VIsitor tries to login", type: :feature, js: true do

  # SETUP
  before :each do
    # @category = Category.create! name: 'Apparel'

    # 10.times do |n|
    #   @category.products.create!(
    #     name:  Faker::Hipster.sentence(3),
    #     description: Faker::Hipster.paragraph(4),
    #     image: open_asset("apparel1.jpg"),
    #     quantity: 10,
    #     price: 64.99
    #   )
      User.create!(name: "Jason Doe", email: "json.doe@gmail.com", password: "12345678", password_confirmation: "12345678")
    
  end

  scenario "They login from the page" do
    # ACT
    visit login_path

    fill_in "email", with: "json.doe@gmail.com"
    fill_in "password", with: "12345678"
    click_button("Submit")
    #  DEBUG
    
    # VERIFY
    save_screenshot
    expect(page).to have_content("Signed in as Jason Doe")
  end
end
