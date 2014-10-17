require 'spec_helper'

describe Sinatra::Checkr::Users do

  before :each do
    @user = User.new({ username: 'username',
                       password: 'password',
                       name:     'user',
                       email:    'user@test.com' })
    @user.save
  end

  after :each do
    Warden.test_reset!
  end

  context 'valid' do
    describe 'get username' do
      it 'expect user json' do
        get "/user/#{@user.username}"
        expect(last_response).to be_ok
        expect(last_response.body).to eq(@user.to_json)
      end
    end

    describe 'get current user after logging in' do
      it 'expect user json' do
        login_as @user
        get '/current_user'
        expect(last_response.body).to eq(@user.to_json)
      end
    end
  end

  context 'invalid' do
    describe 'get username' do
      it 'expect null' do
        get '/user/invalid-user'
        expect(last_response.body).to eq('null')
      end
    end

    describe 'get current user without logging in' do
      it 'expect null' do
        get '/current_user'
        expect(last_response.body).to eq('null')
      end
    end
  end

end