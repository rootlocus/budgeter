class ExpensesController < ApplicationController

  http_basic_authenticate_with name: "eric", password: "1234", only: :destroy

  def create
    @group = Group.find(params[:group_id])
   # @expense = @group.expenses.create(expense_params)
    @userid = current_user.id
    @expense = @group.expenses.create(expense_params)
    redirect_to group_path(@group)
  end

  def destroy
    @group = Group.find(params[:group_id])
    @expense = @group.expenses.find(params[:id])
    @expense.destroy
    redirect_to group_path(@group)
  end
 
  private
    def expense_params
      params.require(:expense).permit( :expense , :user_id )
    end
end
