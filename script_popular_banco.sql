USE delphi;

INSERT INTO Usuario (login, nome_completo, cpf, indicador_administrador, indicador_usuario_ativo)
VALUES 
('admin', 'Administrador do Sistema', '12345678901', TRUE, TRUE),
('johndoe', 'John Doe', '98765432100', FALSE, TRUE),
('janedoe', 'Jane Doe', '12312312312', FALSE, TRUE);

INSERT INTO Estado (nome, sigla, codigo_usuario)
VALUES 
('São Paulo', 'SP', 1),
('Rio de Janeiro', 'RJ', 1),
('Minas Gerais', 'MG', 1);

INSERT INTO Cidade (nome, populacao, codigo_estado, codigo_usuario)
VALUES 
('São Paulo', 12300000, 1, 1),
('Rio de Janeiro', 6718903, 2, 1),
('Belo Horizonte', 2513451, 3, 1);

INSERT INTO Instituicao (nome, cnpj, responsavel, codigo_cidade, codigo_usuario)
VALUES 
('Instituição ABC', '12345678000101', 'Maria Silva', 1, 2),
('Instituição XYZ', '98765432000199', 'Carlos Souza', 2, 2);

INSERT INTO TipoItem (descricao, codigo_usuario)
VALUES 
('Alimentos', 2),
('Roupas', 2);

INSERT INTO Item (descricao, unidade, codigo_tipo_item, data_validade, codigo_usuario)
VALUES 
('Arroz', 'kg', 1, '2025-12-31', 3),
('Feijão', 'kg', 1, '2024-12-31', 3),
('Camiseta', 'unidade', 2, '2026-12-31', 3);

INSERT INTO Doacao (data, codigo_instituicao, codigo_usuario)
VALUES 
('2024-06-01', 1, 2),
('2024-06-02', 2, 2);

INSERT INTO ItemDoacao (codigo_doacao, codigo_item, quantidade, peso, valor)
VALUES 
(1, 1, 100, 1000, 500.00),
(1, 2, 200, 2000, 1000.00),
(2, 3, 50, 50, 750.00);
