require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  it { should have_db_column(:plate) }
  it { should have_db_column(:type) }
  it { should have_db_column(:mud_in_bed) }
  it { should have_db_column(:bed_up) }
end
