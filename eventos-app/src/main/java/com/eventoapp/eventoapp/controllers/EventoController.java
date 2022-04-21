package com.eventoapp.eventoapp.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.eventoapp.eventoapp.models.Convidado;
import com.eventoapp.eventoapp.models.Evento;
import com.eventoapp.eventoapp.repositories.ConvidadoRepository;
import com.eventoapp.eventoapp.repositories.EventoRepository;

@RestController
@RequestMapping(value="/eventos")
public class EventoController {
	
	@Autowired
	private EventoRepository er;
	
	@Autowired
	private ConvidadoRepository cr;
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView listaEventos() {		
		Iterable<Evento> eventos = er.findAll();
		
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("eventos", eventos);
		
		return mv;
	}

	@RequestMapping(value="/cadastrar", method=RequestMethod.GET)
	public ModelAndView form() {
		return new ModelAndView("evento/formEvento");
	}
	
	@RequestMapping(value="/cadastrar", method=RequestMethod.POST)
	public ModelAndView form(@Valid Evento evento, BindingResult result, RedirectAttributes attributes){
		
		if(result.hasErrors()) {
			attributes.addFlashAttribute("mensagem", "Verifique os campos!");
			return new ModelAndView("redirect:/eventos/cadastrar");
		}
		
		er.save(evento);
		
		return new ModelAndView("redirect:/eventos/" + evento.getCodigo());
	}
	
	@RequestMapping(value="/{codigo}", method=RequestMethod.GET)
	public ModelAndView detalhesEvento(@PathVariable Integer codigo) {
		Evento evento = er.findByCodigo(codigo);
		
		ModelAndView mv = new ModelAndView("evento/detalhesEvento");
		mv.addObject("evento", evento);
		
		Iterable<Convidado> convidados = cr.findByEvento(evento);
		mv.addObject("convidados", convidados);
		
		return mv;
	}
	
	@RequestMapping(value="/deletar")
	public ModelAndView deletarEvento(Integer codigo, RedirectAttributes attributes) {
		
		Evento evento = er.findByCodigo(codigo);

		List<Convidado> convidados = cr.findByEvento(evento);
		if(convidados.size() > 0) {
			cr.delete(convidados);
		}
		
		er.delete(evento);
		
		attributes.addFlashAttribute("mensagem", "Evento excluido com sucesso!");
		
		return new ModelAndView("redirect:/eventos");
	}
	
	@RequestMapping(value="/{codigo}", method=RequestMethod.POST)
	public ModelAndView detalhesEventoPost(@PathVariable Integer codigo, @Valid Convidado convidado, BindingResult result, RedirectAttributes attributes) {
		if(result.hasErrors()) {
			attributes.addFlashAttribute("mensagem", "Verifique os campos!");
			return new ModelAndView("redirect:/eventos/{codigo}");
		}
		
		Evento evento = er.findByCodigo(codigo);
		
		convidado.setEvento(evento);
		convidado.setCodigo(null);
		cr.save(convidado);
		
		attributes.addFlashAttribute("mensagem", "Convidado adicionado com Sucesso!");
		
		return new ModelAndView("redirect:/eventos/{codigo}");
	}
	
	@RequestMapping(value="/deletarConvidado")
	public ModelAndView deletarConvidado(String rg, RedirectAttributes attributes) {
		Convidado convidado = cr.findByRg(rg);
		cr.delete(convidado);
		
		attributes.addFlashAttribute("mensagem", "Convidado removido com Sucesso!");
		
		return new ModelAndView("redirect:/eventos/" + convidado.getEvento().getCodigo());
	}
}
