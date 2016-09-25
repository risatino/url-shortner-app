class AddVisitCountToLinks < ActiveRecord::Migration[5.0]
  def change
    add_column :links, :visit_count, :integer
  end
end
