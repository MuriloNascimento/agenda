package com.m104.agenda.modelo.entidades;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class Contato {

	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	@NotEmpty(message="O nome deve ser preenchido")
	private String nome;
	
	@NotEmpty(message="O telefone deve ser preenchido")
	@Size(max=12, message="O telefone deve conter no máximo 12 caractéres")
	private String telefone;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	
}
