require "test_helper"

class ActorsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/actors.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Actor.count, data.count
  end
  
  test "show" do
    get "/actors/#{Actor.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "first_name", "last_name", "known_for"], data.keys
  end

  test "create" do

    assert_difference "Actor.count", 1 do
      post "/actors.json", params: { first_name: "Matthew", last_name: "Chipkin", known_for: "Actualize" }
      assert_response 201
    end
    
    assert_difference "Actor.count", 0 do
      post "/actors.json", params: {}
      assert_response 422
    end
  end

  test "update" do

    actor = Actor.first
    patch "/actors/#{actor.id}.json", params: { first_name: "Updated First Name" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated First Name", data["first_name"]

    patch "/actors/#{actor.id}.json", params: { first_name: "" }
    assert_response 422
  end

  test "destroy" do
    assert_difference "Actor.count", -1 do
      delete "/actors/#{Actor.first.id}.json"
      assert_response 200
    end
  end
end
