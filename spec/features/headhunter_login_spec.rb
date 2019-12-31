require 'rails_helper'

feature 'headhunter sign in' do
  scenario 'from home page' do
    headhunter = Headhunter.create!(email: 'headhunter@test.com', password: '123456')


    visit root_path

    click_on 'Ofereço uma vaga'

    fill_in 'Email', with: headhunter.email
    fill_in 'Senha', with: headhunter.password

    within ('form') do
    click_on 'Log in'
    end

    expect(current_path). to eq(root_path)
    expect(page).to have_content("Olá #{headhunter.email}")
  end

  scenario 'does not see Quero uma vaga link and Ofereço uma vaga link' do
    headhunter = Headhunter.create!(email: 'headhunter@test.com', password: '123456')


    visit root_path

    click_on 'Ofereço uma vaga'

    fill_in 'Email', with: headhunter.email
    fill_in 'Senha', with: headhunter.password

    within ('form') do
    click_on 'Log in'
  end
  expect(page).not_to have_content('Quero uma vaga')
  expect(page).not_to have_content('Ofereço uma vaga')

  end



  scenario 'and logout' do
    headhunter = Headhunter.create!(email: 'headhunter@test.com', password: '123456')

    visit root_path
    click_on 'Ofereço uma vaga'

    fill_in 'Email', with: headhunter.email
    fill_in 'Senha', with: headhunter.password
    click_on 'Log in'
    click_on 'Sair'

    expect(page).to have_content('Signed out successfully')
    expect(current_path).to eq root_path
    expect(page).not_to have_link('Sair')
    expect(page).to have_link('Quero uma vaga')
    expect(page).to have_link('Ofereço uma vaga')
  end
end
