class AddSecretWordToComments < ActiveRecord::Migration
  def change
    add_column :comments, :secret_word, :string
  end
end
