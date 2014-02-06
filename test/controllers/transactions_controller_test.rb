require 'test_helper'


class TransactionsControllerTest < ActionController::TestCase

include Devise::TestHelpers
 
 

  setup do
    @user = users(:one)
    @transaction = transactions(:one)
  end

  test "should get index" do
    sign_in @user
    get :index
    assert_response :success
    assert_not_nil assigns(:transactions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transaction" do
    assert_difference('Transaction.count') do
      post :create, transaction: { account_id: @transaction.account_id, amount: @transaction.amount, category_id: @transaction.category_id, comment: @transaction.comment, date: @transaction.date, income: @transaction.income }
    end

    assert_redirected_to transaction_url
  end

  test "should show transaction" do
    get :show, id: @transaction
    assert_response :success
  end

  
  

  test "should get edit" do
    get :edit, id: @transaction
    assert_response :success
  end

  test "should update transaction" do
    patch :update, id: @transaction, transaction: { account_id: @transaction.account_id, amount: @transaction.amount, category_id: @transaction.category_id, comment: @transaction.comment, date: @transaction.date, income: @transaction.income }
    assert_redirected_to transaction_path(assigns(:transaction))
  end

  test "should destroy transaction" do
    assert_difference('Transaction.count', -1) do
      delete :destroy, id: @transaction
    end

    assert_redirected_to transactions_path
  end
end
