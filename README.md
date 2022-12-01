# Comandos de criação e inserção das tabelas:

/* Lógico_1: */

`
CREATE TABLE Servico (
    Id_Servico int(11) PRIMARY KEY
);
`
`
CREATE TABLE OS_Servico (
    Id_OS_Servico int(11) PRIMARY KEY,
    Data date,
    Descricao_OS varchar(500),
    fk_Servico_Id_Servico int(11)
);
`
`
CREATE TABLE Materiais (
    Id_Material int(11) PRIMARY KEY,
    Descricao varchar(300),
    Valor flaot,
    Local varchar(200)
);
`
`
CREATE TABLE Sub_Servico (
    Descricao_Sub_Servico varchar(300),
    Valor float,
    Horas int(11),
    Id_Sub_Servico int(11) PRIMARY KEY,
    fk_OS_Servico_Id_OS_Servico int(11)
);
`
`
CREATE TABLE Materias_Utilizados (
    Quantidade int(11),
    Id_Utilizados int(11) PRIMARY KEY,
    fk_OS_Servico_Id_OS_Servico int(11)
);
`
`
CREATE TABLE Contem (
    fk_Materiais_Id_Material int(11),
    fk_Materias_Utilizados_Id_Utilizados int(11),
    valorEfetivo flaot
);
`
` 
ALTER TABLE OS_Servico ADD CONSTRAINT FK_OS_Servico_2
    FOREIGN KEY (fk_Servico_Id_Servico)
    REFERENCES Servico (Id_Servico)
    ON DELETE CASCADE;
`
` 
ALTER TABLE Sub_Servico ADD CONSTRAINT FK_Sub_Servico_2
    FOREIGN KEY (fk_OS_Servico_Id_OS_Servico)
    REFERENCES OS_Servico (Id_OS_Servico)
    ON DELETE RESTRICT;
`
` 
ALTER TABLE Materias_Utilizados ADD CONSTRAINT FK_Materias_Utilizados_2
    FOREIGN KEY (fk_OS_Servico_Id_OS_Servico)
    REFERENCES OS_Servico (Id_OS_Servico)
    ON DELETE CASCADE;
`` 
ALTER TABLE Contem ADD CONSTRAINT FK_Contem_1
    FOREIGN KEY (fk_Materiais_Id_Material)
    REFERENCES Materiais (Id_Material)
    ON DELETE RESTRICT;
 
ALTER TABLE Contem ADD CONSTRAINT FK_Contem_2
    FOREIGN KEY (fk_Materias_Utilizados_Id_Utilizados)
    REFERENCES Materias_Utilizados (Id_Utilizados)
    ON DELETE SET NULL;
`

# Inserção:
`
$query = sprintf ("SELECT * FROM 'os_servico' WHERE os_servico.fk_Servico_Id_Servico = '".$cliente."'");
        $dados = mysqli_query($conn, $query); // conecta ao banco e guarda os dados na variavel $dados
        $linha = mysqli_fetch_assoc($dados); // guarda a primeira linha da tabela
        $total = mysqli_num_rows($dados); //retorna o numero de linhas
        $query1 = sprintf ("SELECT * FROM 'todos_servico_t' WHERE todos_servico_t.'ID Serviço' = '".$cliente."'");
        $dados1 = mysqli_query($conn, $query1); // conecta ao banco e guarda os dados na variavel $dados
        $linha1 = mysqli_fetch_assoc($dados1); // guarda a primeira linha da tabela
 `       
(esse comando compara o id de serviço  com a chave estrangeira  na tabela os_servico)   
