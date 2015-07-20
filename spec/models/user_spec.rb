require 'rails_helper'

RSpec.describe User, type: :model do
	before { @user = User.new(email: "nerdsville@example.com", password: "password") }
	subject { @user }
	it { should respond_to(:pins) }
end
