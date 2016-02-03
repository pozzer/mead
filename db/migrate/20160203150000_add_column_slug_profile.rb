class AddColumnSlugProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :slug, :string, uniq: true
  end
end
