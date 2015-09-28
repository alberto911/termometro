class Estado < ActiveRecord::Base

  def self.contar_votos
    Hash[ Estado.all.map{ |e| [e.nombre, e.votos] } ]
  end	

end
