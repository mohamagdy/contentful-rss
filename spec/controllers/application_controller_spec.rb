require "spec_helper"

describe ApplicationController do
  controller do
    def index
      render nothing: true
    end
  end

  let(:user) { FactoryGirl.create(:user) }

  def valid_params
    { user_id: user.id }
  end

  describe "current_user" do
    it "should return the current user" do
      get :index, valid_params

      expect(controller.current_user).to eq(user)
    end
  end
end