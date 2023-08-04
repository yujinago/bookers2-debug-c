class RelationshipsController < ApplicationController
    
    def create
        @user = User.find(params[:user_id])
        current_user.follow(@user)
        @users = User.all
        respond_to do |format|
        format.html { redirect_to user_followers_path(current_user) }
        format.js
        end
    end
    
    def destroy
        @user = User.find(params[:user_id])
        current_user.unfollow(@user)
        @users = User.all
        respond_to do |format|
        format.html { redirect_to user_followings_path(current_user) }
        format.js
        end
    end
    
    def followings
        user = User.find(params[:user_id])
        @users = user.followings
    end
  
    def followers
        user = User.find(params[:user_id])
        @users = user.followers
    end

end
