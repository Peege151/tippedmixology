require 'test_helper'

class MailSubscribersControllerTest < ActionController::TestCase
  setup do
    @mail_subscriber = mail_subscribers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mail_subscribers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mail_subscriber" do
    assert_difference('MailSubscriber.count') do
      post :create, mail_subscriber: { email: @mail_subscriber.email, name: @mail_subscriber.name }
    end

    assert_redirected_to mail_subscriber_path(assigns(:mail_subscriber))
  end

  test "should show mail_subscriber" do
    get :show, id: @mail_subscriber
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mail_subscriber
    assert_response :success
  end

  test "should update mail_subscriber" do
    patch :update, id: @mail_subscriber, mail_subscriber: { email: @mail_subscriber.email, name: @mail_subscriber.name }
    assert_redirected_to mail_subscriber_path(assigns(:mail_subscriber))
  end

  test "should destroy mail_subscriber" do
    assert_difference('MailSubscriber.count', -1) do
      delete :destroy, id: @mail_subscriber
    end

    assert_redirected_to mail_subscribers_path
  end
end
