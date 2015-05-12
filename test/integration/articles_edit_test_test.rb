require 'test_helper'

class ArticlesEditTestTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @article = articles(:firstarticle)
  end

  test 'unsuccessful edit' do
    # get edit_article_path(@article)

    # assert_template 'articles/edit'

    #  patch article_edit_path(@article), article:{
    #                                title: "  ",
    #                                body: "  ",
    #                                user_id: 1
    #                                  }

    # assert_template 'articles/edit'
  end
end
