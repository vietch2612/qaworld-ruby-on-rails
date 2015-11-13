class CreateComment < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string        :commenter
      t.text          :body
      t.references    :article, index: true, foreigin_key: true
      t.timestamp      null: false
    end
  end
end
