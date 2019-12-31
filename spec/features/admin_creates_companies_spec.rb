require 'rails_helper'

feature 'Admin register companies' do
  scenario 'successfully' do

    user = User.create!(email: 'teste@test.com', password: '123456',
                       role: :admin)
   login_as(user, scope: :user)

   visit root_path
   click_on 'Registrar nova Empresa'

   fill_in 'Nome', with: 'Sony'

   click_on 'Enviar'

   expect(page).to have_content('Empresa cadastrada com sucesso')
   expect(page).to have_css('h2', text: 'Sony')

  end
end
