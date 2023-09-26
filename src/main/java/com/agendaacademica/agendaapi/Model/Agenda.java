package com.agendaacademica.agendaapi.Model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Entity
public class Agenda {

    @Id
    private Long id;

    private String nome;

    private List<String> calendarioAcademico;
    private List<String> datasDeProvas;
    private List<String> datasDeTrabalhos;
    private List<String> atividadesExtracurriculares;

    private Map<String, String> lembretes;

    private Map<String, String> datasImportantesProfessor;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void sincronizarCalendarioAcademico(List<String> novoCalendario) {
        this.calendarioAcademico = novoCalendario;
    }

    public void configurarLembrete(String data, String lembrete) {
        this.lembretes.put(data, lembrete);
    }

    public void inserirDataImportanteProfessor(String disciplina, String data) {
        this.datasImportantesProfessor.put(disciplina, data);
    }

    // ... (outros getters e setters para os novos atributos)

    public List<String> getCalendarioAcademico() {
        return calendarioAcademico;
    }

    public void setCalendarioAcademico(List<String> calendarioAcademico) {
        this.calendarioAcademico = calendarioAcademico;
    }

    public List<String> getDatasDeProvas() {
        return datasDeProvas;
    }

    public void setDatasDeProvas(List<String> datasDeProvas) {
        this.datasDeProvas = datasDeProvas;
    }

    public List<String> getDatasDeTrabalhos() {
        return datasDeTrabalhos;
    }

    public void setDatasDeTrabalhos(List<String> datasDeTrabalhos) {
        this.datasDeTrabalhos = datasDeTrabalhos;
    }

    public List<String> getAtividadesExtracurriculares() {
        return atividadesExtracurriculares;
    }

    public void setAtividadesExtracurriculares(List<String> atividadesExtracurriculares) {
        this.atividadesExtracurriculares = atividadesExtracurriculares;
    }

    public Map<String, String> getLembretes() {
        return lembretes;
    }

    public void setLembretes(Map<String, String> lembretes) {
        this.lembretes = lembretes;
    }

    public Map<String, String> getDatasImportantesProfessor() {
        return datasImportantesProfessor;
    }

    public void setDatasImportantesProfessor(Map<String, String> datasImportantesProfessor) {
        this.datasImportantesProfessor = datasImportantesProfessor;
    }

}
