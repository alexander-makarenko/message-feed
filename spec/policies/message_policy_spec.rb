require 'rails_helper'

describe MessagePolicy do
  subject { described_class.new(user, message) }

  let(:message) { FactoryGirl.build_stubbed(:message) }

  context "for a visitor" do
    let(:user) { nil }

    it { is_expected.to permit_action(:index) }    
    it { is_expected.to forbid_action(:create) }
  end

  context "for a signed in user" do
    let(:user) { FactoryGirl.build_stubbed(:user) }
  
    context "when the message belongs to this user" do
      let(:message) { user.messages.build }

      it { is_expected.to permit_action(:index) }
      it { is_expected.to permit_action(:create) }
      it { is_expected.to permit_edit_and_update_actions }

      it { is_expected.to permit_mass_assignment_of(:parent_id).for_action(:create) }
      it { is_expected.to permit_mass_assignment_of(:body).for_action(:create) }
    end

    context "when the message belongs to someone else" do
      let(:another_user) { FactoryGirl.build_stubbed(:user) }
      let(:message) { another_user.messages.build }

      it { is_expected.to permit_action(:index) }
      it { is_expected.to permit_action(:create) }
      it { is_expected.to forbid_edit_and_update_actions }
      
      it { is_expected.to permit_mass_assignment_of(:parent_id).for_action(:create) }
      it { is_expected.to permit_mass_assignment_of(:body).for_action(:create) }
    end
  end
end