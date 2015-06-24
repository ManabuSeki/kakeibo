class AccountBooksController < ApplicationController
  before_action :set_account_book, only: [:show, :edit, :update, :destroy]

  # GET /account_books
  # GET /account_books.json
  def index
    #@account_books = AccountBook.all
    @account_books = AccountBook.order(:date).group("category_id").group("date").sum("money")
    
  end

  # GET /account_books/1
  # GET /account_books/1.json
  def show
  end
  
  def weekly
    today = Date.today
    startDate = today.beginning_of_week
    endDate = today.end_of_week
    @account_books = AccountBook.where("date >= ? and date <= ?",startDate, endDate)
  end

  # GET /account_books/new
  def new
    @account_book = AccountBook.new
  end

  # GET /account_books/1/edit
  def edit
  end

  # POST /account_books
  # POST /account_books.json
  def create
    @account_book = AccountBook.new(account_book_params)

    respond_to do |format|
      if @account_book.save
        format.html { redirect_to @account_book, notice: 'Account book was successfully created.' }
        format.json { render action: 'show', status: :created, location: @account_book }
      else
        format.html { render action: 'new' }
        format.json { render json: @account_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /account_books/1
  # PATCH/PUT /account_books/1.json
  def update
    respond_to do |format|
      if @account_book.update(account_book_params)
        format.html { redirect_to @account_book, notice: 'Account book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @account_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account_books/1
  # DELETE /account_books/1.json
  def destroy
    @account_book.destroy
    respond_to do |format|
      format.html { redirect_to account_books_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account_book
      @account_book = AccountBook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_book_params
      params.require(:account_book).permit(:date, :category_id, :money, :description, :out, :in, :memo, :status)
    end
end
