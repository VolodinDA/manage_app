class UsersController < ApplicationController
	before_action :signed_in_user, only: [:edit, :show, :update, :destroy]
	before_action :correct_user, only: [:edit, :update]
	before_action :admin_user, only: :destroy
	
	def new
		@user=User.new
		@speech=@user.speeches.build
	end 
	
   def create
		@user=User.new(user_params)
		if @user.save
			sign_in @user
      @language=Language.find(params[:languages][:id])
      @user.learn_language!(@language)
			flash[:success]="Welcome to the Management App!"
			redirect_to @user
		else
			render 'new'
		end
	end 
	
	def show
		@user=User.find(params[:id])
		@users=User.paginate(page: params[:page])
		@speech=@user.speeches.build
		@new_langs=current_user.new_langs
		@new_rewards=@user.new_rewards
		@merit=@user.merits.build
		@characteristic=@user.characteristics.build
		@language_items=@user.lang_feed
	end

	def edit

	end
	
	def update
		if @user.update_attributes(user_params)
			flash[:success]="Profile updated"
			redirect_to @user
		else
			render 'edit'
		end
	end

	def index
		@users=User.paginate(page: params[:page])
		@departments=Department.all
	end
	
	def destroy
		User.find(params[:id]).destroy
		flash[:success]="User deleted."
		redirect_to users_url
	end

	def to_errand
		@user=User.find(params[:user][:id])
		@errand_id=Errand.find(params[:errands][:id]).id
		@user.update_attribute(:errand_id, @errand_id)
		flash[:success]="Errand assigned"
		redirect_to @user
	end
	
	private
	
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
		
	def correct_user
		@user=User.find(params[:id])
		redirect_to(root_url) unless current_user?(@user)
	end
  
	def admin_user
		redirect_to(root_url) unless current_user.admin?
	end 
end
