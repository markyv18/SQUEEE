class WelcomeController < ApplicationController
  def index
    @presenter = WelcomePresenter.new(params)
  end
end
