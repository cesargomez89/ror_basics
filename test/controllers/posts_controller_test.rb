# frozen_string_literal: true

require 'test_helper'

# test for posts controller
class PostsControllerTest < ActionDispatch::IntegrationTest
  fixtures %i[posts]

  setup do
    @email = 'cesar@test'
    @user = User.create(email: @email, password: 'abc123')
    @post = posts(:one)
    sign_in @user
  end

  test 'should get index' do
    get posts_url
    assert_response :success
  end

  test 'should get new' do
    get new_post_url
    assert_response :success
  end

  test 'should create post' do
    post posts_url, params: { post: { title: @post.title } }
    assert_redirected_to post_url(Post.last)
  end

  test 'should not create post' do
    post posts_url, params: { post: { title: nil } }
    assert_equal response.status, 422
  end

  test 'should show post' do
    get post_url(@post)
    assert_response :success
  end

  test 'should get edit' do
    get edit_post_url(@post)
    assert_response :success
  end

  test 'should update post' do
    patch post_url(@post), params: { post: { title: @post.title } }
    assert_redirected_to post_url(@post)
  end

  test 'should destroy post' do
    assert_difference('Post.count', -1) do
      delete post_url(@post)
    end

    assert_redirected_to posts_url
  end
end
