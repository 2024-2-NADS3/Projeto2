package com.loschanchos.api_escolhasolidaria.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.loschanchos.api_escolhasolidaria.example.demo.model.Doacao;
import com.loschanchos.api_escolhasolidaria.example.demo.service.DoacaoService;

import org.springframework.web.bind.annotation.*;


import com.loschanchos.api_escolhasolidaria.example.demo.service.UsuarioService;
import api.entity.Usuario;

@RestController
@RequestMapping("/api/doacao")
public class DoacaoController {

    @Autowired
    private DoacaoService doacaoService;

    @Autowired
    private UsuarioService usuarioService;

    @PostMapping("/criar/{userId}")
    public Doacao criarDoacao(@PathVariable Long userId, @RequestBody Doacao doacao) {
        Usuario usuario = usuarioService.buscarUsuarioPorId(userId);
        doacao.setUsuario(usuario);
        return doacaoService.salvarDoacao(doacao);
    }
}
