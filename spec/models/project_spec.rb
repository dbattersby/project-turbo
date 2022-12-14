require 'rails_helper'

RSpec.describe Project, type: :model do
  before(:each) do
    @project = create(:project)
  end

  it "is using valid attributes by default" do
    expect(@project).to be_valid
  end

  it "name should be present" do
    project = build(:project, name: nil)
    expect(project).to_not be_valid
  end

  it "description should be present" do
    project = build(:project, name: "Website Design", description: nil)
    expect(project).to_not be_valid
  end
end
