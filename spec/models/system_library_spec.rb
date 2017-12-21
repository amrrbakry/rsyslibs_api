require 'rails_helper'

RSpec.describe SystemLibrary, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:os) }
  it { should validate_presence_of(:os) }
  it { should validate_length_of(:name).is_at_least(2).is_at_most(70) }
  it { should validate_length_of(:os).is_at_least(2).is_at_most(70) }
end
