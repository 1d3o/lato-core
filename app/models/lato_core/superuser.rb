module LatoCore
  class Superuser < ActiveRecord::Base

    include ModelSuperuserHelpers

    has_secure_password

    # Validations:

    validates :name, presence: true, length: { maximum: 50 }

    validates :surname, presence: true, length: { maximum: 50 }

    validates :username, presence: true, length: { minimum: 4, maximum: 50 },
    uniqueness: { case_sensitive: false }

    validates :email, presence: true, length: { maximum: 255 },
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
    uniqueness: { case_sensitive: false }

    validates :password, presence: true, length: { minimum: 6, maximum: 50 },  on: :create

    validates :permission, presence: true, inclusion: { in: CORE_SUPERUSERS_PERMISSIONS }

    # Callbacks:

    before_save do
      username.downcase!
      email.downcase!
    end

  end
end
