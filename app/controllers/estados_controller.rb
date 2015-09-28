class EstadosController < ApplicationController
	before_action :require_session, only: [:resultados, :reset]
  
	def index
    @estados = Estado.all
  end

	def votar
		if params[:estado]
			estado = Estado.find(params[:estado][:estado_id])
			estado.votos += 1
			estado.save
			redirect_to root_url, notice: '¡Gracias por tu voto!'
		else
			redirect_to root_url, alert: 'Debes seleccionar un estado de ánimo.'
		end
	end

  def resultados
    @votos = Estado.contar_votos
  end

	def reset
		Estado.update_all(votos: 0)
    redirect_to root_url, notice: 'El contador de votos se ha reiniciado'
	end
end
