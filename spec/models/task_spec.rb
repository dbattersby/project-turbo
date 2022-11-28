require 'rails_helper'

RSpec.describe Task, type: :model do
  before(:all) do
    Task.destroy_all
    @task = create(:task, project_id: Project.first.id, user_id: User.first.id)
  end

  it "is using valid attributes by default" do
    expect(@task).to be_valid
  end

  it "name should be present" do
    task = build(:task, name: nil)
    expect(task).to_not be_valid
  end

  it "description should be present" do
    task = build(:task, description: nil)
    expect(task).to_not be_valid
  end

  it "status should have a value" do
    task = build(:task, status: nil)
    expect(task).to_not be_valid
  end

  it "should belong to a project" do
    task = build(:task, project_id: nil)
    expect(task).to_not be_valid
  end

  it "should belong to a user" do
    task = build(:task, user_id: nil)
    expect(task).to_not be_valid
  end

end
