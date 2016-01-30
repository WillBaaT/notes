class InitCloning < ActiveRecord::Migration
  def change
    create_table :genes do |t|
      t.string :species
      t.string :number
      t.string :gene_name
      t.string :size
      t.text :sequence
      t.timestamps :null => false
    end
    create_table :pcrs do |t|
      t.integer :gene_id, :null => false
      t.string :fragment_name
      t.string :product_size
      t.string :final_vector
      t.string :enzyme
      t.timestamps :null => false
    end
    add_index :pcrs, [:gene_id]
    create_table :pcr_conditions do |t|
      t.integer :usable_id
      t.string :usable_type
      t.string :machine
      t.integer :break
      t.integer :break_t
      t.integer :denature
      t.integer :denature_t
      t.integer :annealing
      t.integer :annealing_t
      t.integer :elongation
      t.integer :elongation_t
      t.integer :polya
      t.integer :polya_t
      t.integer :cycles
      t.timestamps :null => false
    end
    create_table :for_primers do |t|
      t.integer :pcr_id
      t.string :for_primer_label
      t.float :for_tm
      t.string :for_sequence
      t.string :for_restrict_site
    end
    create_table :rev_primers do |t|
      t.integer :pcr_id
      t.string :rev_primer_label
      t.float :rev_tm
      t.string :rev_sequence
      t.string :rev_restrict_site
    end
    create_table :primer_pairs do |t|
      t.integer :for_primer_id, :null => false
      t.integer :rev_primer_id, :null => false
    end
    create_table :colonypcrs do |t|
      t.integer :pcr_id, :null => false
      t.integer :forprimer_id, :null => false
      t.integer :revprimer_id, :null => false
    end
    create_table :ligations do |t|
      t.integer :ligatable_id
      t.string :ligatable_type
      t.float :insert_volume
      t.string :vector
      t.float :vector_volume
      t.string :ligase
      t.string :temperature
      t.string :during_time
      t.timestamps :null => false
    end
    create_table :transformations do |t|
      t.integer :ligation_id
      t.string :bacteria
      t.time :chill_time
      t.time :heat_shock_time
      t.time :recovery_time
      t.integer :plating_volume
      t.timestamps :null => false
    end
  end
end
