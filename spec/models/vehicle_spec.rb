require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  it { should have_db_column(:plate) }
  it { should have_db_column(:style) }
  it { should have_db_column(:mud_in_bed) }
  it { should have_db_column(:bed_up) }

  it { should validate_presence_of(:plate) }
  it { should validate_presence_of(:style) }

  it { should have_many(:charges) }
  it { should have_many(:washes).through(:charges) }
end
