# frozen_string_literal: true

RSpec.describe GithubCLI::Commands::Milestones do
  let(:format) { {"format" => "table"} }
  let(:user)   { "piotrmurach" }
  let(:repo)   { "github_cli" }
  let(:api_class) { GithubCLI::Milestone }

  it "invokes milestone:list" do
    expect(api_class).to receive(:all).with(user, repo,
      {"state"=>"open", "sort"=>"due_date", "direction"=>"desc"}, format)
    subject.invoke "milestone:list", [user, repo]
  end

  it "invokes milestone:list --state" do
    expect(api_class).to receive(:all).with(user, repo,
      {"state"=>"closed", "sort"=>"due_date", "direction"=>"desc"}, format)
    subject.invoke "milestone:list", [user, repo], :state => "closed"
  end

  it "invokes milestone:get" do
    expect(api_class).to receive(:get).with(user, repo, 1, {}, format)
    subject.invoke "milestone:get", [user, repo, 1]
  end

  it "invokes milestone:create --title" do
    expect(api_class).to receive(:create).with(user, repo, {"title" => "new"}, format)
    subject.invoke "milestone:create", [user, repo], :title => "new"
  end

  it "invokes milestone:create --title" do
    opts = {
      "title" => "v1.0",
      "state" => "open",
      "desc" => "Tracking milestone for version 1.0",
      "due_on" => "2012-10-09T23:39:01Z"
    }
    copy_opts = opts.dup
    copy_opts["description"] = copy_opts.delete("desc")
    expect(api_class).to receive(:create).with(user, repo, copy_opts, format)
    subject.invoke "milestone:create", [user, repo], opts
  end

  it "invokes milestone:update" do
    expect(api_class).to receive(:update).with(user, repo, 1, {}, format)
    subject.invoke "milestone:update", [user, repo, 1]
  end

  it "invokes milestone:update --title" do
    opts = {
      "title" => "v1.0",
      "state" => "open",
      "desc" => "Tracking milestone for version 1.0",
      "due_on" => "2012-10-09T23:39:01Z"
    }
    copy_opts = opts.dup
    copy_opts["description"] = copy_opts.delete("desc")
    expect(api_class).to receive(:update).with(user, repo, 1, copy_opts, format)
    subject.invoke "milestone:update", [user, repo, 1], opts
  end

  it "invokes milestone:delete" do
    expect(api_class).to receive(:delete).with(user, repo, 1, {}, format)
    subject.invoke "milestone:delete", [user, repo, 1]
  end
end
