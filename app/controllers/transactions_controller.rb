class TransactionsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]
  # GET /transactions
  # GET /transactions.json
  def index
      if (params[:month] && params[:year])
        
        @expense = Transaction.where(income: false).where("strftime('%Y', date) = ? and strftime('%m', date) = ?", params[:year], params[:month]).order(date: :desc) 
        @income = Transaction.where(income: true).where("strftime('%Y', date) = ? and strftime('%m', date) = ?", params[:year], params[:month]).order(date: :desc)
    
       
      else
        @expense = Transaction.where(income: false).order(date: :desc)
        @income = Transaction.where(income: true).order(date: :desc)
      end 
  end
  # GET /transactions/1
  # GET /transactions/1.json

  # Show an individial post (With id)
  def show
  end

  # GET /transactions/new
  #Displai a form to create a new post.
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  # displai a form for additing a post
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  # Form from the new action will submit to and safe post in DB
  def create
    @transaction = current_user.transactions.new(transaction_params)

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
        format.json { render action: 'show', status: :created, location: @transaction }
      else
        format.html { render action: 'new' }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  #uppdating a post. A  form in an edit page will submit to the update action an this will apdate that post in db.  
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  #distroy a post
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
      if @transaction.user_id != current_user.id
  redirect_to transactions_url, alert: 'You can edit only your own Transaction.'
      end
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def transaction_params
      params.require(:transaction).permit(:amount, :date, :comment, :account_id, :income, :category_id)
  end
end


