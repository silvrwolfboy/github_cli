# frozen_string_literal: true

require_relative '../api'

module GithubCLI
  class Key
    extend API

    def self.all(user, repo, params, options)
      output options do
        github_api(options).repos.keys.list user, repo, params
      end
    end

    def self.get(user, repo, id, params, options)
      output options do
        github_api(options).repos.keys.get user, repo, id, params
      end
    end

    def self.create(user, repo, params, options)
      output options do
        github_api(options).repos.keys.create user, repo, params
      end
    end

    def self.edit(user, repo, id, params, options)
      output options do
        github_api(options).repos.keys.edit user, repo, id, params
      end
    end

    def self.delete(user, repo, id, params, options)
      output options do
        github_api(options).repos.keys.delete user, repo, id, params
      end
    end
  end # Key
end # GithubCLI
