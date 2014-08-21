require 'test_helper'

class AccountBooksControllerTest < ActionController::TestCase
  setup do
    @account_book = account_books(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:account_books)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create account_book" do
    assert_difference('AccountBook.count') do
      post :create, account_book: { category: @account_book.category, date: @account_book.date, description: @account_book.description, in: @account_book.in, memo: @account_book.memo, money: @account_book.money, out: @account_book.out, status: @account_book.status }
    end

    assert_redirected_to account_book_path(assigns(:account_book))
  end

  test "should show account_book" do
    get :show, id: @account_book
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @account_book
    assert_response :success
  end

  test "should update account_book" do
    patch :update, id: @account_book, account_book: { category: @account_book.category, date: @account_book.date, description: @account_book.description, in: @account_book.in, memo: @account_book.memo, money: @account_book.money, out: @account_book.out, status: @account_book.status }
    assert_redirected_to account_book_path(assigns(:account_book))
  end

  test "should destroy account_book" do
    assert_difference('AccountBook.count', -1) do
      delete :destroy, id: @account_book
    end

    assert_redirected_to account_books_path
  end
end
