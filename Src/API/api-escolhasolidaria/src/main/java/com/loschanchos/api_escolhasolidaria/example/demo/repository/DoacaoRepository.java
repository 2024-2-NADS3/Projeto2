package com.loschanchos.api_escolhasolidaria.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.loschanchos.api_escolhasolidaria.example.demo.model.Doacao;

public interface DoacaoRepository extends JpaRepository<Doacao, Long> {
}