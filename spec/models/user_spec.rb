require 'rails_helper'

# Validates , user_name, password, presence
# validates , user_name, unique
# validates , session_token, presence
RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  ### Validations
  it { should validate_presence_of(:user_name) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }



  ### Methods
  let(:user) { User.new(user_name: 'asem', password: '123456') }
  
  it 'validates getting the right user' do
    user.save!
    expect(User.find_by_credentials('asem', '123456')).to eq(user)
  end
end


