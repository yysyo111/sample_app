class CreateLists < ActiveRecord::Migration[6.1]
  def change
    create_table :lists do |t|
      # 「t.データ型名 :カラム名」
      t.string :title #(タイトル)
      t.string :body #(本文)

      t.timestamps
    end
  end
end
