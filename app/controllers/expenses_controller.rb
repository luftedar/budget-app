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
    @group = Group.find(params[:group_id])
    @expense = @group.expense.create(name: params[:name], amount: params[:amount], user_id: current_user.id, group_id: @group.id)

    if @expense.save
      flash[:success] = 'Expense Created Successfuly'
    else
      flash[:error] = 'Failed to Create Expense'
    end
  end
end
