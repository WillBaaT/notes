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
  
  def destroy
    @gene = Gene.find(params[:gene_id])
    @pcr = @gene.pcr.find(params[:id])
    @pcr.destroy
    if @gene.pcr.empty?
      @gene.destroy
    end
    redirect_to dashboard_genes_path
  end
  def show
    @pcr = Pcr.find(params[:id])
  end
  def edit
    @pcr = Pcr.find(params[:id])
  end
  
  def update
    @pcr = Pcr.find(params[:id])
    @pcr.update(pcr_params)
    redirect_to dashboard_gene_pcr_path(@pcr.gene, @pcr)
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
      :for_primer_attributes => [
        :for_primer_label,
        :for_tm,
        :for_sequence,
        :for_restrict_site,
      ],
      :rev_primer_attributes => [
        :rev_primer_label,
        :rev_tm,
        :rev_sequence,
        :rev_restrict_site,
      ]
  )
  end
end

