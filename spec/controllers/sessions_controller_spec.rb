require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'GET #new' do
    render_views

    before(:each) do
      get(:new)
    end

    it 'renders the :login template with layout' do
      expect(response).to render_template('sessions/new')
      expect(response).to render_template('layouts/short_layout')
    end

    it 'renders with success' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders with content' do
      expect(response.body).to have_content('Login    ')
    end
  end

  describe 'POST #create' do
    render_views

    describe 'with invalid data' do
      before(:each) { post(:create, session: { login: 'bad login', password: 'bad password' }) }

      it 'render new template' do
        expect(response).to render_template('sessions/new')
        expect(response).to render_template('layouts/short_layout')
        expect(response).to have_http_status(:ok)
        expect(response.body).to have_content('Login')
      end
      it 'has flash error message' do
        expect(response.body).to have_content('Invalid')
      end
    end

    describe 'with valid data' do
      let!(:owner) { FactoryGirl.create(:owner) }
      before(:each) { post(:create, session: { login: owner.login, password: owner.password }) }

      it 'creates valid remember token' do
        expect(Owner.digest(session[:remember_token])).to eq owner.reload.remember_token
      end

      it 'render redirects to root_url' do
        expect(response).to redirect_to(root_path)
      end

      it 'has flash welcome message' do
        expect(flash[:success]).to eq "Welcome #{owner.login} !!!"
      end
    end
  end

  describe 'DESTROY #destroy' do
    let!(:owner) { FactoryGirl.create(:owner) }

    it 'clears session remember_token' do
      expect(session[:remember_token]).to be nil
      rspec_log_in(owner)
      expect(session[:remember_token]).not_to be nil
      delete(:destroy)
      expect(session[:remember_token]).to be nil
    end

    it 'has flash success message' do
      rspec_log_in(owner)
      delete(:destroy)
      expect(flash[:success]).to eq "#{owner.login} Logged out!!!"
    end
  end
end
