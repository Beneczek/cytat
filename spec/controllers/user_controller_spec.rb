require 'spec_helper'

describe UserController do
render_views

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end

    it "should has right title" do
        get 'new'
        response.should have_selector("title", :content=> "Rejestracja")
    end

  end

end
