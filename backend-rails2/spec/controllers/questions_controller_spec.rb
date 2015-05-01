require 'spec_helper'

describe "GET#index" do
  it "should render index page" do
    get :index
    expect(response).to render_template :index
  end
end



