require 'test_helper'

class GamesTest < ActionController::IntegrationTest
  should 'create new game' do
    post api_games_url, :format => :json
    assert_response :success
  end
end
