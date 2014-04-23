require 'spec_helper'

describe User do
  before do
    User.create!(:name => "taro", :password => "abc", :password_confirmation => "abc")
  end
  it "can create user and can authenticate" do
    user = User.find_by(:name => "taro")
    expect(user).not_to be_nil
    expect(user.authenticate('abc')).to be_true
  end
end
