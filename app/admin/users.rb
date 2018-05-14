ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

permit_params :email, :password, :password_confirmation, :first_name, :last_name, :username, :bio, :business_name, :address, :website, :gender, :company_address, :dateofbirth, :admin, :moderator, :editor, :banned, :status, :superadmin

  index do
    selectable_column
    id_column
    column :email
    column :first_name
    column :last_name
    column :username
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :first_name
  filter :last_name
  filter :username
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :username
      f.input :first_name
      f.input :last_name
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

  show do |t|
		attributes_table do
			row :first_name
			row :last_name
			row :username
			# row :image do
			# 	project.image? ? image_tag(project.image.url, height: '100') : content_tag(:span, "No Image yet")
			# end
		end
	end

end
