class DashboardController < ApplicationController
	
	before_action :authenticate_user!
	#before_action :create_company

	layout 'dashboard'
	
	def index

		#if is_manager?
			#@accounts = Account.all
			
		#end

		@total_arrival_mails = ArrivalMail.all.count
		@total_departure_mails = DepartureMail.all.count
		@total_tasks = Task.all.count
		@total_correspondents = Correspondent.all.count




		
	end

	def unauthorize
		render layout: 'unauthorize'
	end

	def create_company
		company = Company.all
		#if  company.blank? && is_admin?
			#redirect_to new_company_path
		#end
	end

	
	
	

	
	

end