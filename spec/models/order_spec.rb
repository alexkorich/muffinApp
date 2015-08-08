require 'rails_helper'

RSpec.describe Order, type: :model do
  it { expect(subject).to validate_presence_of(:user) }
  it { expect(subject).to validate_presence_of(:date) }
  it { expect(subject).to validate_uniqueness_of(:date) }
end
