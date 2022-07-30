# frozen_string_literal: true

require 'application_system_test_case'

# system test for posts
class PostsTest < ApplicationSystemTestCase
  fixtures :posts

  setup do
    @user = User.create(email: 'juve@test.com', password: 'abc123')
    @post = posts(:one)
    login @user
  end

  test 'should create post' do
    visit posts_url
    assert_selector 'h1', text: 'Posts'
    click_on 'New post'

    fill_in 'Title', with: @post.title
    click_on 'Create Post'

    assert_text 'Post was successfully created'
    click_on 'Back'
  end

  test 'should update Post' do
    visit post_url(@post)
    click_on 'Edit this post', match: :first

    fill_in 'Title', with: @post.title
    click_on 'Update Post'

    assert_text 'Post was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Post' do
    visit post_url(@post)
    click_on 'Destroy this post', match: :first

    assert_text 'Post was successfully destroyed'
  end
end
