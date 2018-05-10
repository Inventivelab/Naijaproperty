ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :first_name, :last_name, :username, :bio, :business_name, :address, :website, :gender, :company_address, :dateofbirth, :admin, :moderator, :editor, :banned, :status, :superadmin

  form do |f|
    f.inputs "User Details" do
      f.input :first_name
      f.input :last_name
      f.input :username
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :bio
      f.input :address
      f.input :gender
      f.input :dateofbirth
      f.input :business_name
      f.input :company_address
      f.input :website
      f.input :superadmin, :label => "Super Administrator"
      f.input :admin, :label => "Admin"
      f.input :moderator, :label => "Moderator"
      f.input :editor, :label => "Editor"
      f.input :banned, :label => "Banned"
    end
    f.actions
  end
  
  # form do |f|
  # f.inputs do
  #   if f.object.new_record?
  #     f.input :name
  #   end
  # end
  # create_or_edit = Proc.new {
  #   @user            = User.find_or_create_by(params[:id])
  #   @user.superadmin = params[:user][:superadmin]
  #   # @user.attributes = params[:user].delete_if do |k, v|
  #   #   (k == "superadmin") ||
  #   #   (["password", "password_confirmation"].include?(k) && v.empty? && !@user.new_record?)
  #   # end
  #   if @user.save
  #     redirect_to :action => :show, :id => @user.id
  #   else
  #     render active_admin_template((@user.new_record? ? 'new' : 'edit') + '.html.erb')
  #   end
  # }
  # member_action :create, :method => :post, &create_or_edit
  # member_action :update, :method => :put, &create_or_edit

end
