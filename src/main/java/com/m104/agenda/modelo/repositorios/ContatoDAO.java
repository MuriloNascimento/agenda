package com.m104.agenda.modelo.repositorios;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.m104.agenda.modelo.entidades.Contato;

@Repository
public class ContatoDAO {

	@PersistenceContext
	EntityManager em;
	
	@Transactional
	public void salvar(Contato contato){
		em.merge(contato);
	}
	
	@Transactional
	public void excluir(Contato contato){
		Contato contatoTmp = buscarPorId(contato.getId());
		em.remove(contatoTmp);
	}
	
	public Contato buscarPorId(int id){
		return em.find(Contato.class, id);
	}
	
	@SuppressWarnings("unchecked")
	public List<Contato> buscartodos(){
		Query consulta = em.createNativeQuery("{call buscar_todos}",Contato.class);
		return consulta.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Contato> buscarPorPalvraChave(String palavra){
		Query consulta = em.createQuery("SELECT c FROM Contato c WHERE c.nome like :palavra");
		consulta.setParameter("palavra", "%"+palavra+"%");
		return consulta.getResultList();
	}
	
}