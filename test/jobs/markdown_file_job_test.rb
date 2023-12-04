# test/jobs/markdown_file_job_test.rb
require 'test_helper'

class MarkdownFileJobTest < ActiveSupport::TestCase
  def setup
    WebMock.disable_net_connect!(allow: ['raw.githubusercontent.com'])
    VCR.use_cassette('markdown_file_job') do
      @job = MarkdownFileJob.new
      @article = Article.learning_resources
    end
  end

  test 'job updates article' do
    assert_changes -> { [@article.title, @article.content.body.to_s] } do
      @job.perform
      @article.reload
    end
  end

  test 'job updates article and removes the first H2 tag' do
    @job.perform
    @article.reload

    saved_html_content = @article.content
    assert_not @article.content.body.to_s.include?('<h2>')
  end

  test 'job does not update article if no changes' do
    @job.perform
    @article.reload
    initial_title = @article.title
    initial_content = @article.content.body.to_s

    # Perform the job again
    @job.perform
    @article.reload

    assert_equal initial_title, @article.title
    assert_equal initial_content, @article.content.body.to_s
  end
end
