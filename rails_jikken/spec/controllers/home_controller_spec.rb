require 'spec_helper'

describe HomeController do

  describe "GET 'top'" do
    it "returns http success" do
      get 'top'
      response.should be_success
    end
  end

  describe "POST 'login'" do
    before do
      @existed_user = FactoryGirl.create(:user)
    end
  end

  describe "GET 'my_page'" do
    it "returns http success" do
      get 'my_page'
      response.should be_success
    end
  end

end
