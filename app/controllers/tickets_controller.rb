class TicketsController < ApplicationController

	before_action :set_project
	before_action :set_ticket, only: [ :show, :edit, :update, :destroy]

	def index
		
	end

	def new
		# byebug
		@ticket = @project.tickets.build
	end

	def create
		@ticket = @project.tickets.build(ticket_params)
		if @ticket.save
			# redircet to ticket page
			redirect_to project_ticket_path(@project, @ticket), notice: "Ticket created"
		else
			render 'new'
		end
	end

	def show
		# @ticket = @project.tickets.find(params[:id])
	end

	def edit
		
	end

	def update
		if @ticket.update_attributes(ticket_params)
			redirect_to project_ticket_path(@project, @ticket), notice: 'ticket updated'
		else
			render 'edit'
		end
	end

	def destroy
		@ticket.destroy
		redirect_to project_path(@project), alert: 'ticket destroyed'
	end

	private
		def set_project
			@project = Project.find(params[:project_id])
		end

		def set_ticket
			@ticket = @project.tickets.find(params[:id])
		end

		def ticket_params
			params.require(:ticket).permit(:title, :description)
		end
end
