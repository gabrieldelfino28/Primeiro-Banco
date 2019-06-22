create database ficha_medica

CREATE TABLE Paciente (
	cod_paciente		integer,
	CPF					numeric(11) UNIQUE,
	RG					numeric(11) UNIQUE,
	nome				varchar(20),
	data_nasc			date,
	sexo				varchar(15),
	endereco			varchar(50),
	est_civil			varchar(15),
	convenio			varchar(25),
	tel					numeric(10),
	PRIMARY KEY(cod_paciente)	
)

CREATE TABLE PacienteConsulta (
	cod_paciente		integer,
	data_consulta		date,
	PRIMARY KEY(data_consulta),
	FOREIGN KEY(cod_paciente)REFERENCES	Paciente
)

CREATE TABLE PacienteExame (
	cod_paciente		integer,
	data_exame			date,
	PRIMARY KEY(data_exame),
	FOREIGN KEY(cod_paciente)REFERENCES	Paciente	
)

CREATE TABLE Consulta (
	cod_consulta			integer,
	data_consulta			date,
	diagnostico				varchar(30),
	medico					varchar(50),
	PRIMARY KEY(cod_consulta),	
	FOREIGN KEY(data_consulta)REFERENCES PacienteConsulta
)

CREATE TABLE Exame (
	cod_consulta			integer,
	cod_exame				integer,
	data_exame				date,
	resultado				varchar(20),
   PRIMARY KEY(cod_exame),	
   FOREIGN KEY(cod_consulta)REFERENCES Consulta,
   FOREIGN KEY(data_exame)REFERENCES PacienteExame
)
