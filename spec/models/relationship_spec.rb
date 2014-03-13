require 'spec_helper'

describe Relationship do

  let(:follower) { FactoryGirl.create(:user) }
  let(:followed) { FactoryGirl.create(:user) }
  let(:relationship) { follower.relationships.build(followed_id: followed.id) }

  subject { relationship }

  it { should be_valid }

  describe "follower methods" do
    it { should respond_to(:follower) }
    it { should respond_to(:followed) }
    its(:follower) { should eq follower }
    its(:followed) { should eq followed }
  end

  describe "when followed id is not present" do
    before { relationship.followed_id = nil }
    it { should_not be_valid }
  end

  describe "when follower id is not present" do
    before { relationship.follower_id = nil }
    it { should_not be_valid }
  end

  # 

  # describe "relationship association" do
  #   let(:other_user) { FactoryGirl.create(:user) }
  #   before do
  #     @user.save
  #     @user.follow!(other_user)
  #     other_user.follow!(@user)
  #   end

  #   it "should destroy associated relationships" do
  #     relationships = @user.relationships
  #     @user.destroy
  #     expect(should).not_to be_empty
  #     relationships.each do |relationship|
  #       expect(Relationship.where(id: relationship.id)).to be_empty
  #     end
  #   end

  #   it "should destroy associated reverse relationships" do
  #     reverse_relationships = @user.reverse_relationships
  #     @user.destroy
  #     reverse_relationships.present?.should be_false
  #   end

  # end
end


    