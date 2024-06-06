-- CREATE DATABASE db_normalizacao;
USE db_normalizacao;

CREATE TABLE IF NOT EXISTS tbl_locacoes (
    Locacao_Codigo INT PRIMARY KEY,
    Locacao_Veiculo_Placa VARCHAR(20),
    Locacao_Cliente_CPF VARCHAR(20),
    Locacao_TotalDias INT,
    Locacao_ValorFinal FLOAT,
    FOREIGN KEY (Locacao_Veiculo_Placa)
        REFERENCES tbl_veiculos (Veiculo_Placa),
    FOREIGN KEY (Locacao_Cliente_CPF)
        REFERENCES tbl_cliente (Cliente_CPF)
);

CREATE TABLE IF NOT EXISTS tbl_veiculos (
	Veiculo_Placa VARCHAR(20) PRIMARY KEY,
	Veiculo_Modelo VARCHAR(20),
    Veiculo_Cor VARCHAR(20),
    Veiculo_Diaria FLOAT
);

CREATE TABLE IF NOT EXISTS tbl_clientes (
	Cliente_CPF VARCHAR(20) PRIMARY KEY,
	Cliente_Nome VARCHAR(20),
    Cliente_Sobrenome VARCHAR(20),
    Cliente_DataDeNascimento DATE
);