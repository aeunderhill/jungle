class CreateUsers < ActiveRecord::migrations
  def change
    create_table :users do |n|
      n.string :name
      n.string :email
      n.string :password_digest
      n.timestamps null: false
    end
  end
end