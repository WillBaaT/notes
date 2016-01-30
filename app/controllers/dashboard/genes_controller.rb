class Dashboard::GenesController < Dashboard::DashboardController
  def index
    @gene = Gene.all
    @pcr = Pcr.all
    @for = ForPrimer.all
    redirect_to new_dashboard_gene_path unless Gene.first

  end
  def new
    @gene = Gene.new
  end
  def create
    @gene = Gene.new(gene_params)
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
        ],
      :forprimer_attributes =>[
      	:id,
        :primer_label,
        :tm,
        :restrict_site,
        :sequence
      ],
      :revprimer_attributes =>[
      	:id,
        :primer_label,
        :tm,
        :restrict_site,
        :sequence
      ]
    )
  end
end
