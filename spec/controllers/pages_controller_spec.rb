require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'GET #start' do
    render_views

    before(:each) do
      get(:start)
    end

    it 'renders the :start template with layout' do
      expect(response).to render_template('pages/start')
      expect(response).to render_template('layouts/application')
    end

    it 'renders with success' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders with content' do
      expect(response.body).to have_content('Murarius')
    end
  end
end
