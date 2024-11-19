create database revisao;
use revisao;

create table funcionarios (
    codigo int primary key,
    primeiroNome varchar(50),
    segundoNome varchar(50),
    ultimoNome varchar(50),
    dataNasci date,
    cpf varchar(14),
    rg varchar(12),
    endereco varchar(100),
    cep varchar(9),
    cidade varchar(50),
    fone varchar(15),
    codigoDepartamento int,
    funcao varchar(50),
    salario decimal(10,2)
);

create table departamentos (
    codigo int primary key,
    nome varchar(50),
    localizacao varchar(100),
    codigoFuncionarioGerente int
);

insert into departamentos (codigo, nome, localizacao, codigoFuncionarioGerente) values
(1, 'Recursos Humanos', 'Prédio 1 - Andar 2', 1),
(2, 'TI', 'Prédio 2 - Andar 3', 2),
(3, 'Financeiro', 'Prédio 1 - Andar 1', 3);

insert into funcionarios (codigo, primeiroNome, segundoNome, ultimoNome, dataNasci, cpf, rg, endereco, cep, cidade, fone, codigoDepartamento, funcao, salario) values
(1, 'Ana', 'Paula', 'Silva', '1985-03-10', '123.456.789-10', 'MG-1234567', 'Rua A, 123', '12345-678', 'Belo Horizonte', '31999999999', 1, 'Gerente', 8000.00),
(2, 'Carlos', null, 'Pereira', '1990-06-15', '987.654.321-20', 'SP-9876543', 'Rua B, 456', '54321-987', 'São Paulo', '11988888888', 2, 'Supervisor', 5000.00),
(3, 'Mariana', 'Fernanda', 'Souza', '1995-09-25', '456.789.123-30', 'RJ-4567891', 'Rua C, 789', '67890-123', 'Rio de Janeiro', '21977777777', 3, 'Analista', 3500.00),
(4, 'Pedro', null, 'Almeida', '2000-01-01', '111.222.333-40', 'PR-1233214', 'Rua D, 321', '11122-333', 'Recife', '81966666666', 2, 'Telefonista', 2000.00),
(5, 'Joana', 'Carla', 'Santos', '1980-12-05', '333.444.555-50', 'BA-3211234', 'Rua E, 654', '33344-555', 'Recife', '81955555555', 1, 'Telefonista', 1800.00);

-- a) listar nome e sobrenome ordenado por sobrenome
select primeiroNome, ultimoNome
from funcionarios
order by ultimoNome;

-- b) listar todos os campos de funcionários ordenados por cidade
select *
from funcionarios
order by cidade;

-- c) liste os funcionários que têm salário superior a r$ 1.000,00 ordenados pelo nome completo
select primeiroNome, segundoNome, ultimoNome
from funcionarios
where salario > 1000
order by primeiroNome, ultimoNome;

-- d) liste a data de nascimento e o primeiro nome dos funcionários ordenados do mais novo para o mais velho
select dataNasci, primeiroNome
from funcionarios
order by dataNasci desc;

-- e) liste os funcionários como uma listagem telefônica
select primeiroNome, segundoNome, ultimoNome, fone
from funcionarios;

-- f) liste o total da folha de pagamento
select sum(salario) as totalFolhaPagamento
from funcionarios;

-- g) liste o nome, o nome do departamento e a função de todos os funcionários
select funcionarios.primeiroNome, funcionarios.ultimoNome, departamentos.nome as nomeDepartamento, funcionarios.funcao
from funcionarios
join departamentos on funcionarios.codigoDepartamento = departamentos.codigo;

-- h) liste todos departamentos com seus respectivos gerentes
select departamentos.nome as nomeDepartamento, funcionarios.primeiroNome, funcionarios.ultimoNome as nomeGerente
from departamentos
join funcionarios on departamentos.codigoFuncionarioGerente = funcionarios.codigo;

-- i) liste o valor da folha de pagamento de cada departamento (nome)
select departamentos.nome as nomeDepartamento, sum(funcionarios.salario) as totalFolha
from departamentos
join funcionarios on departamentos.codigo = funcionarios.codigoDepartamento
group by departamentos.nome;

-- j) liste os departamentos dos funcionários que têm a função de supervisor
select distinct departamentos.nome as nomeDepartamento
from funcionarios
join departamentos on funcionarios.codigoDepartamento = departamentos.codigo
where funcionarios.funcao = 'supervisor';

-- k) liste a quantidade de funcionários desta empresa
select count(*) as quantidadeFuncionarios
from funcionarios;

-- l) liste o salário médio pago pela empresa
-- Para calcular a média fora da consulta, você pode pegar a soma e a quantidade de funcionários e fazer a média manualmente
select sum(salario) as somaSalarios, count(*) as quantidadeFuncionarios
from funcionarios;

-- m) liste os nomes dos funcionários que moram em recife e que exerçam a função de telefonista
select primeiroNome, segundoNome, ultimoNome
from funcionarios
where cidade = 'recife' and funcao = 'telefonista';

-- n) liste o nome do departamento e do funcionário ordenados por departamento e funcionário
select departamentos.nome as nomeDepartamento, funcionarios.primeiroNome, funcionarios.ultimoNome
from departamentos
join funcionarios on departamentos.codigo = funcionarios.codigoDepartamento
order by nomeDepartamento, funcionarios.primeiroNome, funcionarios.ultimoNome;

-- o) liste o nome completo de todos os funcionários que não tenham segundo nome
select primeiroNome, ultimoNome
from funcionarios
where segundoNome is null or segundoNome = '';

-- p) liste o menor salário pago pela empresa em cada departamento
select departamentos.nome as nomeDepartamento, min(funcionarios.salario) as menorSalario
from departamentos
join funcionarios on departamentos.codigo = funcionarios.codigoDepartamento
group by departamentos.nome;
