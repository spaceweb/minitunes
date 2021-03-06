require 'spec_helper'

describe FriendshipsController do

  describe "#create" do
    include Devise::TestHelpers
    fixtures :users

    it "when not logged in redirect to the login page" do
      post :create
      assert_response :redirect
      assert_redirected_to login_path
    end

    context "when logged in" do
      before(:each) do
        sign_in users(:charlie)
      end

      it "with no friend_id redirect to the site root" do
        post :create
        assert_redirected_to root_path
      end

      context "with a valid friend_id" do
        before(:each) do
          post :create, friend_id: users(:bilbo).id
        end

        it "assign a variable @friend" do
          assert_equal users(:bilbo), assigns(:friend)
        end

        it "assign a friendship" do
          assert_equal users(:charlie), assigns(:friendship).user
          assert_equal users(:bilbo), assigns(:friendship).friend
        end

        it "create a friendship" do
          assert users(:charlie).friends.include?(users(:bilbo))
        end

        it "redirect to the profile page of the friend" do
          assert_response :redirect
          assert_redirected_to profile_path(users(:bilbo).profile_name)
        end

        it "set the flash success message" do
          assert flash[:notice]
          assert_equal "You are now following #{users(:bilbo).name}", flash[:notice]
        end
      end
    end
  end

  describe "#destroy" do
    include Devise::TestHelpers
    fixtures :users

    it "when not logged in redirect to the login page" do
      delete :destroy
      assert_response :redirect
      assert_redirected_to login_path
    end

    context "when logged in" do
      before(:each) do
        sign_in users(:charlie)
      end

      it "with no friend_id redirect to the site root" do
        delete :destroy
        assert_redirected_to root_path
      end

      context "with a valid friend_id" do
        before(:each) do
          users(:charlie).friendships.new(friend: users(:bilbo)).save
          delete :destroy, friend_id: users(:bilbo).id
        end

        it "assign a variable @friend" do
          assert_equal users(:bilbo), assigns(:friend)
        end

        it "assign a friendship" do
          assert_equal users(:charlie), assigns(:friendship).user
          assert_equal users(:bilbo), assigns(:friendship).friend
        end

        it "destroy a friendship" do
          assert !users(:charlie).friends.include?(users(:bilbo))
        end

        it "redirect to the profile page of the unfriend" do
          assert_response :redirect
          assert_redirected_to profile_path(users(:bilbo).profile_name)
        end

        it "set the flash success message for destroy friendship" do
          assert flash[:notice]
          assert_equal "You are not following #{users(:bilbo).name}", flash[:notice]
        end
      end
    end
  end
end
