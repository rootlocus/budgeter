class UserGroupsController < ApplicationController
  http_basic_authenticate_with name: "eric", password: "1234", only: :destroy

  def new
  end
  def create
    @group = Group.find(params.require(:user_group)[:group_id])
    @usergroup = UserGroup.create(usergroup_params)
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
    def usergroup_params
      params.require(:user_group).permit( :user_id , :group_id )
    end

end
