class RegistrationsController < Devise::RegistrationsController
  def update
    # required for settings form to submit when password is left blank
    if params[:designer][:password].blank?
      params[:designer].delete("password")
      params[:designer].delete("password_confirmation")
      params[:designer].delete("current_password")
    end

    @designer = Designer.find(current_designer.id)
    if @designer.update_attributes(params[:designer])
      set_flash_message :notice, :updated
      # Sign in the designer bypassing validation in case his password changed
      sign_in @designer, :bypass => true
      redirect_to after_update_path_for(@designer)
    else
      render "edit"
    end
  end
end