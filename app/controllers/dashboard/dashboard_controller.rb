class Dashboard::DashboardController < ApplicationController
  before_action :authenticate_geek!
  
end
