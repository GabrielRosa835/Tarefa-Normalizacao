-- CREATE DATABASE db_normalizacao;
USE db_normalizacao;

CREATE TABLE IF NOT EXISTS tbl_locacoes (
	Locacao_Codigo INT PRIMARY KEY,
    Locacao_Veiculo VARCHAR(40),
    Locacao_Veiculo_Cor VARCHAR(40),
    Locacao_Veiculo_Placa VARCHAR(10),
    Locacao_Veiculo_Diaria FLOAT,
    Locacao_Cliente_Nome VARCHAR(20),
    Locacao_Cliente_Sobrenome VARCHAR(20),
    Locacao_Cliente_CPF VARCHAR(20),
    Locacao_Cliente_Nascimento DATE,
    Locacao_TotalDias INT,
    Locacao_ValorFinal FLOAT
);