create database db_Escola;
use db_Escola;

-- ----------------------------------

CREATE TABLE Aluno (
  cod_aluno INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  nome_aluno VARCHAR(50) NOT NULL,
  endereco VARCHAR(50) NOT NULL,
  numero INT NOT NULL,
  cidade VARCHAR(20) NOT NULL,
  cep INT NOT NULL,
  telefone INT NOT NULL,
  cpf INT NOT NULL,
  nome_responsavel VARCHAR(50) NOT NULL,
  telefone_responsavel INT NOT NULL
  );

INSERT INTO  Aluno  (nome_aluno, endereco, numero, cidade, cep, telefone, cpf, nome_responsavel, telefone_responsavel)
	VALUES ('Rodrigo', 'Almirante Alvim', 20, 'Floripa', 88010150, 999119911, 1234567891, 'Pai Rodrigo', 987559911);
INSERT INTO  Aluno  (nome_aluno, endereco, numero, cidade, cep, telefone, cpf, nome_responsavel, telefone_responsavel)
	VALUES ('João', 'Gama Deça', 30, 'Floripa', 88010600, 995335544, 0102030405, 'Pai Joao', 988443322);

-- -----------------------------------

CREATE TABLE Historico (
  cod_historico INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  cod_aluno INT NOT NULL,
			FOREIGN KEY (cod_aluno) REFERENCES Aluno(cod_aluno)
            ON UPDATE CASCADE ON DELETE RESTRICT,
  cod_aluno INT NOT NULL,
			FOREIGN KEY (cod_turma) REFERENCES Turma(cod_turma)
            ON UPDATE CASCADE ON DELETE RESTRICT,          
  nota DECIMAL NULL,
  faltas INT NULL,
  sit_aprovacao VARCHAR(1) NULL DEFAULT 'a = aprovado / r = reprovado'
 );
 
-- -------------------------------------

CREATE TABLE Chefe_Depto (
	cod_chefe INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	nome_chefe VARCHAR(45) NOT NULL
);

INSERT INTO  Chefe_Depto  (nome_chefe) VALUES ('Cirimbelli');
INSERT INTO  Chefe_Depto  (nome_chefe) VALUES ('Moretto');

-- --------------------------------

CREATE TABLE Departamento (
  cod_depto INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  nome_depto VARCHAR(45) NOT NULL,
  cod_chefe INT NOT NULL,
			FOREIGN KEY (cod_chefe) REFERENCES Chefe_Depto(cod_chefe)
			ON UPDATE CASCADE ON DELETE RESTRICT
);

INSERT INTO  Departamento (nome_depto, cod_chefe) VALUES ('Turismo', 2);
INSERT INTO  Departamento (nome_depto, cod_chefe) VALUES ('Administração', 1);

-- -------------------------------

CREATE TABLE Disciplina (
cod_disciplina INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nome_disciplina VARCHAR(45) NOT NULL,
cod_horario INT NOT NULL,
			FOREIGN KEY (cod_horario) REFERENCES Horario(cod_horario)
			ON UPDATE CASCADE ON DELETE RESTRICT,
cod_depto INT NOT NULL,
		  FOREIGN KEY (cod_depto) REFERENCES Departamento(cod_depto)
		  ON UPDATE CASCADE ON DELETE RESTRICT,
cod_professor INT NOT NULL,
			  FOREIGN KEY (cod_professor) REFERENCES Professores(cod_professor)
			  ON UPDATE CASCADE ON DELETE RESTRICT
  );
 
 -- --------------------------------

CREATE TABLE Funcionarios (
  num_matricula_funcionario INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  nome_funcionario VARCHAR(50) NOT NULL,
  cod_depto INT NOT NULL,
			FOREIGN KEY (cod_depto) REFERENCES Departamento(cod_depto)
			ON UPDATE CASCADE ON DELETE RESTRICT
);

INSERT INTO  Funcionarios (nome_funcionario, cod_depto) VALUES ('Machadinho', 2);
INSERT INTO  Funcionarios (nome_funcionario, cod_depto) VALUES ('Nazareno', 1);

-- --------------------------

CREATE TABLE Horario (
  cod_horario INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  horario VARCHAR(12) NOT NULL
);
  
  INSERT INTO  Horario (horario) VALUES ('Matutino');
  INSERT INTO  Horario (horario) VALUES ('Vespertino');
  INSERT INTO  Horario (horario) VALUES ('Noturno');

-- ----------------------------

CREATE TABLE Professores (
  cod_professor INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  nome_professor VARCHAR(50) NOT NULL,
  endereco VARCHAR(50) NULL,
  numero INT NULL,
  cidade VARCHAR(20) NULL,
  cep INT NULL,
  telefone INT NULL,
  cpf VARCHAR(45) NOT NULL
  );

INSERT INTO  Professores  (nome_professor, endereco, numero, cidade, cep, telefone, cpf)
VALUES ('Mussi', 'Delminda da Silveira', 132, 'Biguaçu', 88010333, 988776655, 1987654321);
INSERT INTO  Professores  (nome_professor, endereco, numero, cidade, cep, telefone, cpf)
VALUES ('Cortella', 'Oscar Freire', 253, 'Sao Paulo', 88015444, 988553322, 5432168795);


-- -------------------------

CREATE TABLE Turma (
  cod_turma INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  cod_depto INT NOT NULL,
			FOREIGN KEY (cod_depto) REFERENCES Departamento(cod_depto)
			ON UPDATE CASCADE ON DELETE RESTRICT,
  cod_disciplina INT NOT NULL,
				FOREIGN KEY (cod_disciplina) REFERENCES Disciplina(cod_disciplina)
				ON UPDATE CASCADE ON DELETE RESTRICT,
  cod_professor INT NOT NULL,
				FOREIGN KEY (cod_professor) REFERENCES Professores(cod_professor)
				ON UPDATE CASCADE ON DELETE RESTRICT
);
   

 