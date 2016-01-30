class Dashboard::PcrconditionsController < Dashboard::DashboardController
  def new
    @pcr = Pcr.find(params[:pcr_id])
  end
  def create
    @pcr = Pcr.find(params[:pcr_id])
    @for = @pcr.create_for_primer(pcr_params)
    @rev = @pcr.create_rev_primer(pcr_params)
    @condition = @pcr.create_pcrcondition(pcr_params)
    if @pcr.save
      redirect_to dashboard_pcr_pcrcondition_path(@pcr, @pcr.pcrcondition)
    else
      render new_dashboard_gene_pcr_path(@gene)
    end
  end
  def show
    @pcrcondition = Pcrcondition.find(params[:id])
    @pcr = @pcrcondition.pcr
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

  private
  def pcr_params
      params.require(:pcr).permit(
      :pcrcondition_attributes => [
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
      :for_primer_attributes=>[
        :primer_label,
        :tm,
        :restrict_site,
        :sequence
      ],
      :rev_primer_attributes=>[
        :primer_label,
        :tm,
        :restrict_site,
        :sequence
      ]
  )
  end
end