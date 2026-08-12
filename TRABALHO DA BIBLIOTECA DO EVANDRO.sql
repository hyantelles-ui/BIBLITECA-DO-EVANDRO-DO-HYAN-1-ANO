-- Apaga o banco anterior se ele já existir para evitar o erro 1007
DROP DATABASE IF EXISTS biblioteca_escolar;

-- 1. Criar o banco de dados do zero
CREATE DATABASE biblioteca_escolar;
USE biblioteca_escolar;

-- 2. Criar tabela de Autores
CREATE TABLE autores (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(50)
);

-- 3. Criar tabela de Livros
CREATE TABLE livros (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    ano_publicacao INT,
    isbn VARCHAR(20) UNIQUE,
    id_autor INT,
    FOREIGN KEY (id_autor) REFERENCES autores(id_autor) ON DELETE SET NULL
);

-- 4. Criar tabela de Usuários (Leitores)
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    data_adesao DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 5. Criar tabela de Empréstimos (Relacionamento N:M)
CREATE TABLE emprestimos (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    id_livro INT,
    id_usuario INT,
    data_emprestimo DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_devolucao_prevista DATE NOT NULL,
    data_devolucao_real DATE,
    FOREIGN KEY (id_livro) REFERENCES livros(id_livro) ON DELETE CASCADE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE
);



