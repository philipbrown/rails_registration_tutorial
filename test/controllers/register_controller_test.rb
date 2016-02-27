class RegisterControllerTest < ActionController::TestCase
  test "should get register form" do
    get :new

    assert_response :success
  end

  test "should fail with invalid data" do
    post :create, register: {email: "", username: "", password: ""}

    assert_response 400
  end

  test "should register new user via html request" do
    create(:role, name: "guest")

    post :create, register: attributes_for(:user)

    assert_response 302
  end
end
