require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user) { create(:user) }

  describe  "Logind" do
    before do
      sign_in user
    end

    describe 'GET #show' do
      subject { get(user_path(user_id)) }

      context 'ユーザーが存在するとき' do
        let(:user) { create(:user) }
        let(:user_id) { user.id }

        it 'リクエストが成功する' do
          subject
          expect(response).to have_http_status(:ok)
        end

        it 'name が表示されている' do
          subject
          expect(response.body).to include user.name
        end

        it 'objective が表示されている' do
          subject
          expect(response.body).to include user.objective
        end

        context ':idに対応するユーザーが存在しないとき' do
          let(:user_id) { 1 }

          it 'エラーが発生する' do
            expect { subject }.to raise_error ActiveRecord::RecordNotFound
          end
        end
      end
    end
  end
end