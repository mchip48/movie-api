require "test_helper"

class ActorsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/actors.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Actor.count, data.count
  end
  
  test "show" do
    post "/users.json", params: { name: "Test", email: "test@email.com", password: "password", password_confirmation: "password" }
    post "/sessions.json", params: { email: "test@email.com", password: "password" }
    get "/actors/#{Actor.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "first_name", "last_name", "known_for", "created_at", "updated_at", "movie_id"], data.keys
  end

  test "create" do
    assert_difference "Actor.count", 1 do
      post "/users.json", params: { name: "Test", email: "test@email.com", password: "password", password_confirmation: "password" }
      post "/sessions.json", params: { email: "test@email.com", password: "password" }
      post "/actors.json", params: { first_name: "Matthew", last_name: "Chipkin", known_for: "Actualize"}
      assert_response 201
    end
    
    assert_difference "Actor.count", 0 do
      post "/actors.json", params: {}
      assert_response 422
    end
  end

  test "update" do
    post "/users.json", params: { name: "Test", email: "test@email.com", password: "password", password_confirmation: "password" }
    post "/sessions.json", params: { email: "test@email.com", password: "password" }
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
      post "/users.json", params: { name: "Test", email: "test@email.com", password: "password", password_confirmation: "password" }
      post "/sessions.json", params: { email: "test@email.com", password: "password" }
      delete "/actors/#{Actor.first.id}.json"
      assert_response 200
    end
  end
end
