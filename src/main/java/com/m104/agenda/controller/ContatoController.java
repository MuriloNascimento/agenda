package com.m104.agenda.controller;

import java.util.List;

import javax.inject.Inject;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.m104.agenda.modelo.entidades.Contato;
import com.m104.agenda.modelo.repositorios.ContatoDAO;

@Controller
@RequestMapping("/contato")
public class ContatoController {
	
	@Inject
	private ContatoDAO repo;

	@RequestMapping(value="/consulta")
	public String consulta(Model model,String palavra){
		if(palavra != null){
			List<Contato> contatos = repo.buscarPorPalvraChave(palavra);
			model.addAttribute("contatos",contatos);
		} else {
			List<Contato> contatos = repo.buscartodos();
			model.addAttribute("contatos",contatos);
		}
		model.addAttribute("pageName","Consulta de contatos");
		return "consulta";	
	}
	
	@RequestMapping(value="/cadastro")
	public String cadastro(Model model){
		model.addAttribute("contato",new Contato());
		model.addAttribute("pageName","Cadastro de contatos");
		return "cadastro";	
	}
	
	@RequestMapping(value="/cadastrar",method=RequestMethod.POST)
	public String cadastrar(@Valid Contato contato, BindingResult result, Model model){
		if(result.hasErrors()) {
			model.addAttribute("msgm","não foi possivel cadastrar");
			return "forward:cadastro";
		}
		model.addAttribute("msgm","cadastrado com sucesso");
		this.repo.salvar(contato);
		return "forward:cadastro";
	}
	
	@RequestMapping("/alteracao/{id}")
	public String alteracao(Model model,@PathVariable("id") int id){
		Contato contato = repo.buscarPorId(id);
		model.addAttribute("contato",contato);
		model.addAttribute("pageName","Alteracao de contatos");
		return "cadastro";
	}
	
	@RequestMapping("/deletar/{id}")
	public String deletar(@PathVariable("id") int id){
		Contato contato = repo.buscarPorId(id);
		repo.excluir(contato);
		return "redirect:http://localhost:8080/agenda/contato/consulta";
	}

}
