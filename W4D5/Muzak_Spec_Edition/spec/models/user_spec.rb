require 'rails_helper'

RSpec.describe User, type: :model do
  User.destroy_all

  subject(:user) { User.new(email: "some_email", password: "some_password") }

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe '#is_password?' do
    it 'verifies that password is correct' do
      expect(user.is_password?("some_password")).to be true
    end

    it 'verifies that password is incorrect' do
      expect(user.is_password?("wrong_password")).to be false
    end
  end

  describe '#reset_session_token!' do
    it 'assigns new session token' do
      current_token = user.session_token
      user.reset_session_token!
      expect(user.session_token).to_not eq(current_token)
    end
  end

  describe '::find_by_credentials' do
    user1 = User.new(email: "another_email", password: "another_pw")
    user2 = User.new(email: "yet_another_email", password: "yet_another_pw")
    user1.save
    user2.save

    context 'if user exists' do
      it 'finds the correct user' do
        expect(User.find_by_credentials("another_email", "another_pw")).to eq(user1)
        expect(User.find_by_credentials("yet_another_email", "yet_another_pw")).to eq(user2)
      end
    end

    context 'if user does not exist' do
      it 'returns nil' do
        expect(User.find_by_credentials("non_user", "non_pass")).to be nil
      end
    end
  end

end
