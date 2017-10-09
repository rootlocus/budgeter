class GroupController < ApplicationController

  http_basic_authenticate_with name: "eric", password: "1234", except: [ :index, :show]
  def index
      @groups = Group.all
      #render json: {status: 'SUCCESS' , message: 'Loaded all group' , data:groups}, status: :ok
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
     @group = Group.new
  end

  def edit
     @group = Group.find(params[:id])
  end

#this is the post of new 
  def create
    @group = Group.new(group_params)  
    #if group.save is true , saved , else reload new again
    if @group.save
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
     @group.destroy
 
     redirect_to group_index_path
  end

  private
    def group_params      
      params.require(:group).permit( :group_id  , :groupname)
    end
end
