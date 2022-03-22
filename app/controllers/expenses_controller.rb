class ExpensesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @expense = @group.expenses.all.order(created_at: :desc)
  end

  def new
  end

  def create
  end
end
