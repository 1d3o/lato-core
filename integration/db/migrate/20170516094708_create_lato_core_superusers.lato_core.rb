# This migration comes from lato_core (originally 20160224181217)
class CreateLatoCoreSuperusers < ActiveRecord::Migration[5.1]
  def change

    create_table :lato_core_superusers do |t|
      t.string :name
      t.string :surname
      t.text :biography
      t.string :username
      t.string :email
      t.integer :permission

      t.datetime :last_login_datetime
      t.string :last_login_ip_address

      t.string :password_digest

      t.timestamps null: false
    end

  end
end
