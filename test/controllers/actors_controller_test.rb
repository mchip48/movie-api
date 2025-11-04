require "test_helper"

class ActorsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/actors.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Actor.count, data.count
  end
end
