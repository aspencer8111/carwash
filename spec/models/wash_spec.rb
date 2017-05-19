require 'rails_helper'

RSpec.describe Wash, type: :model do
  it { should have_db_column(:vehicle_id) }
  it { should have_db_column(:charge) }
end
