namespace :markdown_files do
  desc "Migrate message bodies to save formatted HTML in the database."
  task update_if_changed: :environment do
    MarkdownFileJob.perform_later
  end
end
