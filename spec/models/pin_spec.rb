require 'rails_helper'

RSpec.describe Pin, type: :model do
  before { @pin = Pin.new(description: "Test") }
  subject { @pin }
  it { should respond_to :description }
  it { should respond_to :user_id }

  describe "when content is empty" do
    before { @pin.description = nil }
    it { should_not be_valid }
  end

  describe "when content is too short" do
    before { @pin.description = "a" * 19 }
    it { should_not be_valid }
  end

  describe "when content is too long" do
    before { @pin.description = "a" * 201 }
    it{ should_not be_valid }
  end
end
