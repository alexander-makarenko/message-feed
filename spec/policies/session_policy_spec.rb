require 'rails_helper'

describe SessionPolicy do
  subject { described_class.new(user, session) }

  let(:session) { Object.new }

  context "for a visitor" do
    let(:user) { nil }

    it { is_expected.to permit_new_and_create_actions }
    it { is_expected.to forbid_action(:destroy) }
  end

  context "for a signed in user" do
    let(:user) { FactoryGirl.build_stubbed(:user) }
  
    it { is_expected.to forbid_new_and_create_actions }
    it { is_expected.to permit_action(:destroy) }
  end
end