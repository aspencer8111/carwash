require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it { should have_db_column(:vehicle_id) }
  it { should have_db_column(:wash_id) }
  it { should have_db_column(:charge) }
end
