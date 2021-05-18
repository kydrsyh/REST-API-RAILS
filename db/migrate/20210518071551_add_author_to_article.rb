class AddAuthorToArticle < ActiveRecord::Migration[5.2]
  def change
    add_reference :articles, :author
  end
end
