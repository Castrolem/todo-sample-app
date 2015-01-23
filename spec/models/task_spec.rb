require 'rails_helper'

RSpec.describe Task, :type => :model do

  let(:user) { FactoryGirl.create(:user) }
  let(:task) { Task.new(content: "Lorem ipsum", user_id: user.id) }

  subject { task }

  it { expect(task).to respond_to(:content) }
  it { expect(task).to respond_to(:user_id) }

  it { expect(task).to be_valid }

  describe "when user_id is not present" do
    before { task.user_id = nil }

    it { expect(task).to_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Task.new(user_id: user.id)
      end
    end
  end

  describe "with blank content" do
    before { task.content = " " }
    it { expect(task).to_not be_valid }
  end

  describe "with content that is too long" do
    before { task.content = "a" * 301 }
    it { expect(task).to_not be_valid }
  end
end
