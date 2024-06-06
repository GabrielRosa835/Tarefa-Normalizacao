-- CREATE DATABASE db_normalizacao;
USE db_normalizacao;

DROP TABLE IF EXISTS tbl_locacoes;
DROP TABLE IF EXISTS tbl_veiculos;
DROP TABLE IF EXISTS tbl_clientes;

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
CREATE TABLE IF NOT EXISTS tbl_locacoes (
    Locacao_Codigo INT PRIMARY KEY,
    Locacao_Veiculo_Placa VARCHAR(20),
    Locacao_Cliente_CPF VARCHAR(20),
    Locacao_TotalDias INT,
    FOREIGN KEY (Locacao_Veiculo_Placa)
        REFERENCES tbl_veiculos (Veiculo_Placa),
    FOREIGN KEY (Locacao_Cliente_CPF)
        REFERENCES tbl_clientes (Cliente_CPF)
);

CREATE OR REPLACE VIEW vw_locacoes_detalhes AS
	SELECT
		tbl_locacoes.Locacao_Codigo AS "Código",
		tbl_locacoes.Locacao_TotalDias AS "Total de Dias",
        tbl_locacoes.Locacao_TotalDias * tbl_veiculos.Veiculo_Diaria AS "Valor Final",
        tbl_veiculos.Veiculo_Modelo AS "Modelo do Veículo",
        tbl_veiculos.Veiculo_Cor AS "Cor do Veículo",
        tbl_veiculos.Veiculo_Placa AS "Placa do Veículo",
        tbl_veiculos.Veiculo_Diaria AS "Diária do Veículo",
        tbl_clientes.Cliente_CPF AS "CPF do CLiente",
        CONCAT(tbl_clientes.Cliente_Nome, tbl_clientes.Cliente_Sobrenome) AS "Nome do Cliente",
        tbl_clientes.Cliente_DataDeNascimento AS "Data de Nascimento do Cliente"
    FROM tbl_locacoes 
    JOIN tbl_veiculos
		ON tbl_locacoes.Locacao_Veiculo_Placa = tbl_veiculos.Veiculo_Placa
	JOIN tbl_clientes
		ON tbl_locacoes.Locacao_Cliente_CPF = tbl_clientes.Cliente_CPF
	;
    
INSERT INTO tbl_clientes VALUES
("123.456.789-01", "Ariano", "Suassuna", "1022-05-21"),
("543.765.987-23", "Grace", "Hopper", "2002-04-29"),
("987.654.231-90", "Richard", "Feyman", "2001-10-12"),
("432.765.678-67", "Edgar", "Poe", "1998-12-14"),
("927.384.284-44", "Gordon", "Freeman", "1022-05-21");

INSERT INTO tbl_veiculos VALUES
("WER-3456", "Fusca", "Preto", 30),
("FDS-8384", "Variante", "Rosa", 60),
("CVB-9933", "Comodoro", "Preto", 20),
("FGH-2256", "Deloriam", "Azul", 80),
("DDI-3948", "Brasília", "Amarela", 45);

INSERT INTO tbl_locacoes VALUES
(101, "WER-3456", "123.456.789-01", 3),
(102, "FDS-8384", "543.765.987-23", 7),
(103, "CVB-9933", "987.654.231-90", 1),
(104, "FGH-2256", "432.765.678-67", 3),
(105, "DDI-3948", "927.384.284-44", 7);

SELECT * FROM vw_locacoes_detalhes;