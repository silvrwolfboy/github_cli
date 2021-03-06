# frozen_string_literal: true

RSpec.describe GithubCLI::Commands::Collaborators do
  let(:format) { {"format" => "table"} }
  let(:owner)  { "peter-murach" }
  let(:repo)   { "github_cli" }
  let(:user)   { "github" }
  let(:api_class) { GithubCLI::Collaborator }

  it "invokes collab:list" do
    expect(api_class).to receive(:all).with(owner, repo, {}, format)
    subject.invoke "collab:list", [owner, repo]
  end

  it "invokes collab:add" do
    expect(api_class).to receive(:add).with(owner, repo, user, {}, format)
    subject.invoke "collab:add", [owner, repo, user]
  end

  it "invokes collab:collab" do
    expect(api_class).to receive(:collaborator?).with(owner, repo, user, {}, format)
    subject.invoke "collab:collab", [owner, repo, user]
  end

  it "invokes collab:collab" do
    expect(api_class).to receive(:remove).with(owner, repo, user, {}, format)
    subject.invoke "collab:remove", [owner, repo, user]
  end
end
