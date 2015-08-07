class AccountBooksController < ApplicationController
  before_action :set_account_book, only: [:show, :edit, :update, :destroy, :delete]
  respond_to :html, :js
  # GET /account_books
  # GET /account_books.json
  def index
    #@account_books = AccountBook.all
    param = params[:month]
    begin
      year = param[0, 4].to_i
      month = param[5, 6].to_i
      @today = Date.new(year, month)
    rescue
      @today = Date.today
    end
   # @today = Date.today unless @today.present?

    @year = @today.year
    @month = @today.month
    @firstDay = Date.new(@year, @month, 1)
    @lastDay = Date.new(@year, @month, -1)
    logger.debug(@firstDay)
    logger.debug(@lastDay)
    @account_books = AccountBook.order(:date, :id).where(date: @firstDay..@lastDay).group("category_id").group("date").sum("money")
    
    
  end

  # GET /account_books/1
  # GET /account_books/1.json
  def show
  end
  
  def weekly
    param = params[:month]
    begin
      year = param[0, 4].to_i
      month = param[5, 6].to_i
      @today = Date.new(year, month)
    rescue
      @today = Date.today
    end
    @today = Date.today unless @today.present?
    @year = @today.year
    @month = @today.month
    @firstDay = Date.new(@year, @month, 1)
    @lastDay = Date.new(@year, @month, -1).day
    @wday = @firstDay.wday
    @weeks = (@wday + @lastDay + 6) / 7

    @weeks.times do |t|
      var = "@week"
      start_day = "@start"
      end_day = "@end"
      week_count ="@count"
      if t == 0
        @start = @today.beginning_of_month
        @end = @today.beginning_of_month.end_of_week(:sunday)
        ac = AccountBook.where('date >= ? and date <= ?',@start,@end)
        eval("#{var + t.to_s} = ac")
        eval("#{start_day + t.to_s} = @start")
        eval("#{end_day + t.to_s} = @end")
      else
        @start = @end+ 1.days
        @end = @start.end_of_week(:sunday)
        if @end > @today.end_of_month
          @end = @today.end_of_month
          ac = AccountBook.where('date >= ? and date <= ?',@start,@today.end_of_month)
          eval("#{var + t.to_s} = ac")
          eval("#{start_day + t.to_s} = @start")
          eval("#{end_day + t.to_s} = @end")
        else
          @end
          ac = AccountBook.where('date >= ? and date <= ?',@start,@end)
          eval("#{var + t.to_s} = ac")
          eval("#{start_day + t.to_s} = @start")
          eval("#{end_day + t.to_s} = @end")
        end
      end
        count = (t + 1).to_s
        eval("#{week_count + t.to_s} = count")
    end
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
    @account_book = AccountBook.create(account_book_params)
    set_after_account_book
  end

  # PATCH/PUT /account_books/1
  # PATCH/PUT /account_books/1.json
  def update
    @account_book.update(account_book_params)
    set_after_account_book
  end

  def delete
    set_after_account_book
  end
  # DELETE /account_books/1
  # DELETE /account_books/1.json
  def destroy
    @account_book.destroy
    set_after_account_book
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account_book
      @account_book = AccountBook.find(params[:id])
    end

    def set_after_account_book
      if @account_book.try(:date).present?
        @today = @account_book.date
      else
        @today = Time.now
      end
      @year = @today.year
      @month = @today.month
      @firstDay = Date.new(@year, @month, 1)
      @lastDay = Date.new(@year, @month, -1)
      @account_books = AccountBook.order(:date, :id).where(date: @firstDay..@lastDay).group("category_id").group("date").sum("money")
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_book_params
      params.require(:account_book).permit(:date, :category_id, :money, :description, :out, :in, :memo, :status, :month)
    end
end
