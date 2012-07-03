require 'helper'

describe Twitter::User do

  describe "#==" do
    it "returns true when objects IDs are the same" do
      user = Twitter::User.new(:id => 1, :screen_name => "foo")
      other = Twitter::User.new(:id => 1, :screen_name => "bar")
      (user == other).should be_true
    end
    it "returns false when objects IDs are different" do
      user = Twitter::User.new(:id => 1)
      other = Twitter::User.new(:id => 2)
      (user == other).should be_false
    end
    it "returns false when classes are different" do
      user = Twitter::User.new(:id => 1)
      other = Twitter::Identity.new(:id => 1)
      (user == other).should be_false
    end
  end

  describe "#created_at" do
    it "returns a Time when created_at is set" do
      user = Twitter::User.new(:id => 7505382, :created_at => "Mon Jul 16 12:59:01 +0000 2007")
      user.created_at.should be_a Time
    end
    it "returns nil when created_at is not set" do
      user = Twitter::User.new(:id => 7505382)
      user.created_at.should be_nil
    end
  end

  describe "#status" do
    it "returns a Status when status is set" do
      status = Twitter::User.new(:id => 7505382, :status => {:id => 25938088801}).status
      status.should be_a Twitter::Status
    end
    it "returns nil when status is not set" do
      status = Twitter::User.new(:id => 7505382).status
      status.should be_nil
    end
    it "includes a User when user is set" do
      status = Twitter::User.new(:id => 7505382, :screen_name => 'sferik', :status => {:id => 25938088801}).status
      status.user.should be_a Twitter::User
      status.user.screen_name.should eq 'sferik'
    end
  end

end
