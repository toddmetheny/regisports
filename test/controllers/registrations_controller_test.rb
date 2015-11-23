require 'test_helper'

class RegistrationsControllerTest < ActionController::TestCase
  setup do
    @registration = registrations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:registrations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create registration" do
    assert_difference('Registration.count') do
      post :create, registration: { age: @registration.age, email: @registration.email, gender: @registration.gender, lastname: @registration.lastname, name: @registration.name, option_id: @registration.option_id, phone: @registration.phone, redeemcode: @registration.redeemcode, shirt: @registration.shirt, team: @registration.team }
    end

    assert_redirected_to registration_path(assigns(:registration))
  end

  test "should show registration" do
    get :show, id: @registration
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @registration
    assert_response :success
  end

  test "should update registration" do
    patch :update, id: @registration, registration: { age: @registration.age, email: @registration.email, gender: @registration.gender, lastname: @registration.lastname, name: @registration.name, option_id: @registration.option_id, phone: @registration.phone, redeemcode: @registration.redeemcode, shirt: @registration.shirt, team: @registration.team }
    assert_redirected_to registration_path(assigns(:registration))
  end

  test "should destroy registration" do
    assert_difference('Registration.count', -1) do
      delete :destroy, id: @registration
    end

    assert_redirected_to registrations_path
  end
end
