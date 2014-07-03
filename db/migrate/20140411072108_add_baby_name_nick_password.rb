class AddBabyNameNickPassword < ActiveRecord::Migration
  def change
  		add_column :babies, :nick, :string
		add_column :babies, :password_digest, :string
  end
end
