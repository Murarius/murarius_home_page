require 'rails_helper'

RSpec.feature 'LoginsAndLogouts', type: :feature do
  let!(:owner) { FactoryGirl.create(:owner) }

  describe 'login' do
    before(:all) { visit root_path }

    it 'is visible login button in root_page' do
      expect(page).to have_link('', href: login_path)
    end

    it 'there is no visible logout button' do
      expect(page).not_to have_link('', href: logout_path)
    end
  end

  describe 'after login click' do
    before(:each) { visit root_path }

    it 'renders login form' do
      click_link('', href: login_path, match: :first)
      expect(page).to have_content('Login')
      expect(page).to have_content('Password')
    end

    describe 'after submitt login form' do
      describe 'with invalid data' do
        before(:each) do
          click_link('', href: login_path, match: :first)
          fill_in('session_login', with: 'bad_login')
          fill_in('session_password', with: 'bad_password')
          click_button('Log in')
        end

        it 'flashes error with wrong email/password' do
          expect(page).to have_content('Invalid login/password combination')
        end

        it 'renders form again' do
          expect(page).to have_content('Login')
          expect(page).to have_content('Password')
        end
      end

      describe 'with valid data' do
        before(:each) do
          click_link('', href: login_path, match: :first)
          fill_in('session_login', with: owner.login)
          fill_in('session_password', with: owner.password)
          click_button('Log in')
        end

        it 'redirects to root with valid email/password with flash message' do
          expect(page).to have_content('MURARIUS')
          expect(page).to have_content("Welcome #{owner.login} !!!")
        end

        it 'there is no visible login button' do
          expect(page).not_to have_link('', href: login_path)
        end

        it 'is visible logout button' do
          expect(page).to have_link('', href: logout_path)
        end
      end
    end
  end

  describe 'logout' do
    before(:each) do
      visit root_path
      click_link('', href: login_path, match: :first)
      fill_in('session_login', with: owner.login)
      fill_in('session_password', with: owner.password)
      click_button('Log in')
    end

    it 'there is no visible login button' do
      expect(page).not_to have_link('', href: login_path)
    end

    it 'is visible logout button' do
      expect(page).to have_link('', href: logout_path)
    end

    describe 'after logout click' do
      before(:each) { click_link('', href: logout_path, match: :first) }

      it 'is visible login button in root_page' do
        expect(page).to have_link('', href: login_path)
      end

      it 'there is no visible logout button' do
        expect(page).not_to have_link('', href: logout_path)
      end
    end
  end
end
