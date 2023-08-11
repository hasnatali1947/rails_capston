class GroupsController < ApplicationController
  def index
    @groups = current_user.groups.order(created_at: :desc)
  end

  def new; end

  def create
    @group = current_user.groups.new(category_params)
    if @group.save
      redirect_to groups_path, notice: 'category created successfuly'
    else
      redirect_to new_group_path, alert: 'Oops something went wrong'
    end
  end

  def login_page; end

  private

  def category_params
    params.required(:group).permit(:name, :icon)
  end
end
