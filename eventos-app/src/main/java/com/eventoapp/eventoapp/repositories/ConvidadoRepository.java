package com.eventoapp.eventoapp.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.eventoapp.eventoapp.models.Convidado;
import com.eventoapp.eventoapp.models.Evento;

@Repository
public interface ConvidadoRepository extends CrudRepository<Convidado, Integer>{
	
	List<Convidado> findByEvento(Evento evento);
	
	Convidado findByRg(String rg);
}
