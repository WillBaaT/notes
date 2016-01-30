class Dashboard::PcrsController < Dashboard::DashboardController





  def new
    @gene = Gene.find(params[:gene_id])
  end
  def create
    @gene = Gene.find(params[:gene_id])
    @pcr = @gene.pcr.create(pcr_params)
    # @for = @gene.forprimer.create(pcr_params)
    if @pcr.save
      redirect_to dashboard_genes_path
    else
      render new_dashboard_gene_pcr_path(@gene)
    end
  end
  def show
  	@gene = Gene.find(params[:gene_id])
    @pcr = Pcr.find(params[:id])
    @for = @pcr.for_primer
    @rev = @pcr.rev_primer
    @condition = @pcr.pcr_condition
    # @forprimer = Forprimer.find(params[:id])

  end
  def edit
    @gene = Gene.find(params[:gene_id])
    @pcr = Pcr.find(params[:id])
  end
  def update
    @pcr = Pcr.find(params[:id])
    @pcr.update(pcr_params)
    redirect_to gene_pcr_path(@pcr.gene, @pcr)
  end
  def destroy
    @gene = Gene.find(params[:gene_id])
    @pcr = @gene.pcr.find(params[:id])
    @pcr.destroy
    if @gene.pcr.empty?
      @gene.destroy
    end
    redirect_to dashboard_genes_path
  end
  
def reload
    render new_pcr_path
  end
  private
  def pcr_params
      params.require(:pcr).permit(
      :id,
      :gene_id,
      :fragment_name, 
      :product_size,
      :final_vector,
      :machine,
      :enzyme,
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
      :cycles,
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
        ],
      :primer_attributes=>[
        :primer_label,
        :tm,
        :restrict_site,
        :sequence
      ]
  )
  end
end

