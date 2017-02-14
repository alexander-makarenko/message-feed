class MessagePolicy < ApplicationPolicy
  def permitted_attributes_for_create
    [:parent_id, :body]
  end
  
  def index?
    true
  end

  def create?
    signed_in?
  end

  def update?
    signed_in? && owner?
  end

  private

    def owner?
      record.user_id == user.id
    end
end