# frozen_string_literal: true

class RepositoryLoaderJob < ApplicationJob
  queue_as :default

  def perform(id)
    # Do something later
    repository = Repository.find id
    repository.fetch

    begin
      client = Octokit::Client.new
      repo_data = client.repo Octokit::Repository.from_url repository[:link]
    
      repository.update({
                          owner_name: repo_data[:owner][:login],
                          repo_name: repo_data[:full_name],
                          description: repo_data[:description],
                          default_branch: repo_data[:default_branch],
                          watchers_count: repo_data[:watchers],
                          language: repo_data[:language],
                          repo_created_at: repo_data[:created_at],
                          repo_updated_at: repo_data[:updated_at]
                        })     

     repository.complete_fetch                  

    rescue StandardError
      repository.fetch_failed
    ensure
      repository.save
    end
  end
end
