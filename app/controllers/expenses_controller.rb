class ExpensesController < ApplicationController

  http_basic_authenticate_with name: "eric", password: "1234", only: :destroy

  def create
    @userid = current_user.id
    @group = Group.find(params[:group_id])
    if is_number?(params.require(:expense)[:expense])
       @expense = @group.expenses.create(expense_params)
    end
    redirect_to group_path(@group)
  end

  def destroy
    @group = Group.find(params[:group_id])
    @expense = @group.expenses.find(params[:id])
    @expense.destroy
    redirect_to group_path(@group)
  end

  def is_number? string
    true if Float(string) rescue false
  end
 
  private
    def expense_params
      params.require(:expense).permit( :expense , :user_id )
    end
end
