class Dashboard::LigationsController < Dashboard::DashboardController
  def new
  	@pcr = Pcr.find(params[:pcr_id])
  end
end