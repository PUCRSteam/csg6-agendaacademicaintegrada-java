package com.agendaacademica.agendaapi.controller;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import java.util.Arrays;
import java.util.HashMap;
// import java.util.List;

import com.agendaacademica.agendaapi.Model.Agenda;

@RestController
@RequestMapping(value = "/agenda")
public class AgendaController {

    @GetMapping
    public Agenda getAgendaObject() {

        // Criar um novo objeto Agenda
        Agenda agenda = new Agenda();

        // Inicializar o nome
        agenda.setNome("Wilton Pereira Sampaio");

        // Inicializar o calendário acadêmico, datas de provas, trabalhos e atividades
        // extracurriculares
        agenda.sincronizarCalendarioAcademico(Arrays.asList("01/01/2023 - Início do semestre", "15/06/2023 - Fim do semestre"));
        agenda.setDatasDeProvas(Arrays.asList("15/02/2023 - Matemática", "20/02/2023 - História"));
        agenda.setDatasDeTrabalhos(Arrays.asList("10/02/2023 - Projeto de Ciências", "25/02/2023 - Redação"));
        agenda.setAtividadesExtracurriculares(Arrays.asList("Futebol às quartas", "Clube de xadrez às sextas"));

        // Inicializar lembretes personalizados
        HashMap<String, String> lembretes = new HashMap<>();
        lembretes.put("14/02/2023", "Estudar para a prova de Matemática");
        lembretes.put("19/02/2023", "Revisar para a prova de História");
        agenda.setLembretes(lembretes);

        // Professores podem inserir datas importantes
        HashMap<String, String> datasImportantesProfessor = new HashMap<>();
        datasImportantesProfessor.put("Matemática", "15/02/2023 - Prova");
        datasImportantesProfessor.put("História", "20/02/2023 - Prova");
        agenda.setDatasImportantesProfessor(datasImportantesProfessor);
        System.out.println("tudo funcionando");
        return agenda;
    }

    @ResponseStatus(HttpStatus.OK)
    public void ping() {
        System.out.println("funfa_controller");
    }
}
