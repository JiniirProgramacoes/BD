CREATE SCHEMA IF NOT EXISTS db_escola;
USE db_escola;

create table Campus(

	id_campus int NOT NULL auto_increment primary key,
    nome_campus varchar(45) NOT NULL,
    tipo_campus varchar(45) NOT NULL
    
);

create table Curso(

	id_curso int NOT NULL auto_increment primary key,
    nome_curso varchar(45) NOT NULL,
    id_campus int NOT NULL,
    constraint fk_idcampus_curso foreign key(id_campus) references Campus(id_campus)

);

create table Professor(

	id_professor int NOT NULL auto_increment primary key,
    nome_professor varchar(45) NOT NULL,
    cpf_profesor varchar(45) NOT NULL

);

create table Disciplina(
	
	id_disciplina int NOT NULL auto_increment primary key,
    descricao_disciplina varchar(45) NOT NULL,
    id_professor int NOT NULL,
    constraint fk_idprofessor_disciplina foreign key(id_professor) references Professor(id_professor)

);

create table Turma(

	id_disciplina int NOT NULL,
    id_curso int NOT NULL,
    constraint fk_iddisciplina_turma foreign key(id_disciplina) references Disciplina(id_disciplina),
    constraint fk_idcurso_turma foreign key(id_curso) references Curso(id_curso),
    primary key(id_disciplina, id_curso)

);

create table Endereco(
	
    id_endereco int NOT NULL auto_increment primary key,
    rua_endereco varchar(45) NOT NULL,
    numeroCasa_endereco varchar(45) NOT NULL,
    bairro_endereco varchar(45) NOT NULL,
    cidade_endereco varchar(45) NOT NULL,
    estado_endereco varchar(45) NOT NULL,
    cep_endereco varchar(45) NOT NULL

);

alter table Professor add id_endereco int NOT NULL;
alter table Professor add constraint fk_idendereco_professor foreign key(id_endereco) references Endereco(id_endereco);

create table Aluno(

	id_aluno int NOT NULL auto_increment primary key,
    nome_aluno varchar(45) NOT NULL,
    matricula_aluno varchar(45) NOT NULL,
    rg_aluno varchar(45) NOT NULL,
    id_endereco int NOT NULL,
	constraint fk_idendereco_turma foreign key(id_endereco) references Endereco(id_endereco)
);

create table Nota(

	id_disciplina int NOT NULL,
    id_aluno int NOT NULL,
    nota int NOT NULL,
    constraint fk_iddisciplina_nota foreign key(id_disciplina) references Disciplina(id_disciplina),
    constraint fk_idaluno_nota foreign key(id_aluno) references Aluno(id_aluno),
    primary key(id_disciplina, id_aluno)

);

select * from Professor;

