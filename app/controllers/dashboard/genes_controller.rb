class Dashboard::GenesController < Dashboard::DashboardController
  def index
    @gene = Gene.all
    @pcr = Pcr.all
    redirect_to new_dashboard_gene_path unless Gene.first

  end
  def new
    @gene = Gene.new
    @pcr = Pcr.new(:gene => @gene)
  end
  def create
    @gene = Gene.new(gene_params)
    @pcr = Pcr.new(pcr_params)
    # if  Gene.find_by_gene_name(@gene.gene_name)
    #   @gene.pcrs.gene_id = Gene.find(Gene.find_by_gene_name(@gene.gene_name).id)
    #   end
    if @gene.save
      redirect_to dashboard_genes_path
    else
      render new_dashboard_gene_path
    end
  end
  def show
    @gene = Gene.find(params[:id])
  end
  def edit
    @gene = Gene.find(params[:id])
  end
  def update
    @gene = Gene.find(params[:id])
    @gene.update(gene_params)
    redirect_to dashboard_gene_path(@gene)
  end
  

  private
  def gene_params
    params.require(:gene).permit(
      :id,
      :species,
      :number,
      :gene_name,
      :size,
      :sequence,
      :pcr_attributes => [
        :id,
        :gene_id,
        :forprimer_id,
        :revprimer_id,
        :fragment_name, 
        :product_size,
        :final_vector,
        :machine,
        :enzyme,
        ]
    )
  end
  def pcr_params
    params.require(:pcr).permit(
      :id,
      :gene_id,
      :forprimer_id,
      :revprimer_id,
      :fragment_name, 
      :product_size,
      :final_vector,
      :machine,
      :enzyme,
        :for_primer_attributes =>[
          :id,
          :for_primer_label,
          :for_tm,
          :for_restrict_site,
          :for_sequence
        ],
        :rev_primer_attributes =>[
          :id,
          :rev_primer_label,
          :rev_tm,
          :rev_restrict_site,
          :rev_sequence
        ],
        :pcr_condition_attributes => [
        :usable_id,
        :usable_type,
        :machine,
        :break,
        :break_t,
        :denature,
        :denature_t,
        :annealing,
        :annealing_t,
        :elongation,
        :elongation_t,
        :polya,
        :polya_t,
        :cycles
        ]
    )
  end
end
