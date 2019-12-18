require 'rails_helper'

feature 'Visitor open home page' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_content('Arubaito')
    expect(page).to have_content('Nós podemos te ajudar a conseguir emprego nas seguintes empresas:')
  end
end
