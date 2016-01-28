class AddColumnSlugQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :slug, :string, uniq: true
  end
end
