package com.loschanchos.api_escolhasolidaria.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.loschanchos.api_escolhasolidaria.example.demo.model.Doacao;
import com.loschanchos.api_escolhasolidaria.example.demo.repository.DoacaoRepository;
import org.springframework.stereotype.Service;


@Service
public class DoacaoService {
    
       @Autowired
    private DoacaoRepository doacaoRepository;

    public Doacao salvarDoacao(Doacao doacao) {
        return doacaoRepository.save(doacao);
    }


}
