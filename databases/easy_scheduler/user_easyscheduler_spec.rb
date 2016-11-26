# RSPEC FILE NOT WORKING
# Discover reason later


require_relative 'user_easyscheduler'

describe User do
let(:user) { User.new('John Smith') }

  it 'adds day and times to schedule' do
    expect(user.add_to_schedule('Monday',6,4)).to eq 
  end

  it 'does something' do
    # expect(user.something).to eq 'something else'
  end

end
