class GroupController < ApplicationController

#  http_basic_authenticate_with name: "eric", password: "1234", except: [ :index, :show]
  before_action :authenticate_user!, except: [:index ,:show]
  def index
      @groups = Group.all
      @usergroups = UserGroup.all
      #render json: {status: 'SUCCESS' , message: 'Loaded all group' , data:groups}, status: :ok
  end

  def show
    @usergroups = UserGroup.all
    @group = Group.find(params[:id])
  end

  def new
#     @group = Group.new
    @group = current_user.group.build
  end

  def edit
     @group = Group.find(params[:id])
  end

#this is the post of new 
  def create
    @group =  current_user.group.build(group_params)
    #if group.save is true , saved , else reload new again
    if @group.save
      @usergroup = UserGroup.create( :user_id => current_user.id , :group_id => @group.id)
      redirect_to @group
    else
      render 'new'
    end
  end

  def update
     @group = Group.find(params[:id])
 
     if @group.update(group_params)
       redirect_to @group
     else
       render 'edit'
     end
  end

  def destroy
     @group = Group.find(params[:id])
     
#     begin
#        @usergroup = UserGroup.find_by_group_id(params[:id])
#        if @usergroup.present?
#           @usergroup.destroy
#        end
#     end while @usergroup.present? 
     if @group.present?
        @group.destroy
     end
#     @usergroup = UserGroup.find_by_group_id(params[:id])
#     if @usergroup.present?
#        @usergroup.destroy
#     end

#     @usergroup = UserGroup.create( :user_id => current_user.id , :group_id => @group.id) 
     redirect_to group_index_path
  end

  private
    def group_params      
      params.require(:group).permit( :group_id  , :groupname)
    end
end
