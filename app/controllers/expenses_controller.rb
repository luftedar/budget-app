class ExpensesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @expense = @group.expenses.all.order(created_at: :desc)
  end

  def new
    @group = Group.find(params[:group_id])
    @expense = @group.expense.new
  end

  def create
    @group = Group.find(expense_params[:group_id])
    @expense = @group.expense.create(name: expense_params[:name], amount: expense_params[:amount], user_id: current_user.id, group_id: @group.id)

    if @expense.save
      flash[:success] = 'Expense Created Successfuly'
      redirect_to groups_path
    else
      flash[:error] = 'Failed to Create Expense'
    end
  end

  private

  def expense_params 
    params.require(:expense).permit(:name, :amount)
  end
end
