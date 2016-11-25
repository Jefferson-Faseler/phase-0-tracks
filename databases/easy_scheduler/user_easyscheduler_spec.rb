require_relative 'user_easyscheduler'

describe User do
# let(:user) { User.new('John Smith') }

  it 'add time to schedule' do
    temp = User.new('John Smith')
    expect(temp.add_to_schedule('Monday', 6, 4)).to eq {'Monday'}
  end
end