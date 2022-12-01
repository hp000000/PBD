# Comandos de criação das tabelas:

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
`

` 
ALTER TABLE Contem ADD CONSTRAINT FK_Contem_1
    FOREIGN KEY (fk_Materiais_Id_Material)
    REFERENCES Materiais (Id_Material)
    ON DELETE RESTRICT;
`

`
ALTER TABLE Contem ADD CONSTRAINT FK_Contem_2
    FOREIGN KEY (fk_Materias_Utilizados_Id_Utilizados)
    REFERENCES Materias_Utilizados (Id_Utilizados)
    ON DELETE SET NULL;
`

# Inserção nas tabelas:

$query = sprintf ("SELECT * FROM 'os_servico' WHERE os_servico.fk_Servico_Id_Servico = '".$cliente."'");
        $dados = mysqli_query($conn, $query); // conecta ao banco e guarda os dados na variavel $dados
        $linha = mysqli_fetch_assoc($dados); // guarda a primeira linha da tabela
        $total = mysqli_num_rows($dados); //retorna o numero de linhas
        $query1 = sprintf ("SELECT * FROM 'todos_servico_t' WHERE todos_servico_t.'ID Serviço' = '".$cliente."'");
        $dados1 = mysqli_query($conn, $query1); // conecta ao banco e guarda os dados na variavel $dados
        $linha1 = mysqli_fetch_assoc($dados1); // guarda a primeira linha da tabela
      
/*Esse comando compara o id de serviço  com a chave estrangeira  na tabela os_servico   
/*Além disso, ele consulta a tabela de visualização  todos_servico_t e compara com id de serviço e guarda na variável quer1 para gerar a descrição da os


$query1 = sprintf("SELECT * FROM `materias`"); // consulta a tabela materias
        $dados1 = mysqli_query($conn, $query1); // conecta ao banco e guarda os dados na variavel $dados
        $linha1 = mysqli_fetch_assoc($dados1); // guarda a primeira linha da tabela
        $total1 = mysqli_num_rows($dados1); //retorna o numero de linhas



// guarda os valores resebidos por post nas tabelas materiais utilizados e na tabela contem
                        $query1 = sprintf(" INSERT INTO `materias_utilizados` (`Quantidade`,  `fk_OS_Servico_Id_OS_Servico`) VALUES ($quantidade[$i],  $id_os)");
                            $sql = mysqli_query($conn, $query1);
                             $query = sprintf ("SELECT * FROM `materias_utilizados` WHERE `Id_Utilizados` = LAST_INSERT_ID()");
                             $dados = mysqli_query($conn, $query);
                            $linha = mysqli_fetch_assoc($dados);
                            $aux=$linha["Id_Utilizados"];


                         mysqli_query($conn,"insert into contem values('$valor[$i]','$material[$i]','$aux')");

/*o for a seguir guarda os valores dos vetores enviados da tabela de cadastro de sub serviço e adiciona linha a linha

for($i=0;$i<count($descricao);$i++)
                  {
                      if($valor[$i]!="")
                     {

                         mysqli_query($conn,"insert into sub_servico values('$valor[$i]','NULL','$horas[$i]','$age','$descricao[$i]' )");  
                       }
                  }
  
            
/*esse comando adiciona valores a tabela os_servico e usando a função LAST_INSERT_ID() obtém o valor da nova os

$query1 = sprintf("INSERT INTO `os_servico` ( `Data`, `Descricao_OS`, `fk_Servico_Id_Servico`) VALUES ('$data', '$descricao', '$idservico');");
            $sql = mysqli_query($conn, $query1);
            $query = sprintf ("SELECT * FROM `os_servico` WHERE `Id_OS_Servico` = LAST_INSERT_ID()");
            $dados = mysqli_query($conn, $query);
            $linha = mysqli_fetch_assoc($dados);

/*essa parte adiciona materiais:

$query1 = sprintf("INSERT INTO `materias` (`descricao`, `valor`, `local`) VALUES ( '$descricao', '$valor', '$local');");
            $sql = mysqli_query($conn, $query1);

/*essa parte faz a  conexão com banco

<?php
$servername = "localhost";
$username = "Geison";
$password = "12345";
// Cria a conexao
if(!($conn = mysqli_connect($servername, $username, $password))) {
  echo "<p align=\"center\"><big><strong>Não foi possível estabelecer uma conexão   com o gerenciador MySQL. Favor Contactar o Administrador.
  </strong></big></p>";
  exit;
}

//2º passo - Seleciona o Banco de Dados
if(!($db = mysqli_select_db($conn,"lab"))) {
  echo " <p align=\"center\"><big><strong>Não foi possível estabelecer uma conexão   com o gerenciador MySQL. Favor Contactar o Administrador.
  </strong></big></p>";
  exit;
}
?>

/*essa Views relaciona todos os matérias utilizados com a tabela contem e a tabela materiais

select `lab`.`contem`.`Valor_Efetivo` AS `Valor_Efetivo`,`lab`.`contem`.`fk_Materiais_Id_Material` AS `fk_Materiais_Id_Material`,`lab`.`contem`.`fk_Materias_Utilizados_Id_Utilizados` AS `fk_Materias_Utilizados_Id_Utilizados`,`lab`.`materias_utilizados`.`Quantidade` AS `Quantidade`,`lab`.`materias_utilizados`.`Id_Utilizados` AS `Id_Utilizados`,`lab`.`materias_utilizados`.`fk_OS_Servico_Id_OS_Servico` AS `fk_OS_Servico_Id_OS_Servico`,`lab`.`materias`.`id_Material` AS `id_Material`,`lab`.`materias`.`descricao` AS `descricao`,`lab`.`materias`.`valor` AS `valor`,`lab`.`materias`.`local` AS `local` from `lab`.`contem` join `lab`.`materias_utilizados` join `lab`.`materias` where `lab`.`contem`.`fk_Materiais_Id_Material` = `lab`.`materias`.`id_Material` and `lab`.`contem`.`fk_Materias_Utilizados_Id_Utilizados` = `lab`.`materias_utilizados`.`Id_Utilizados`

// essa View relaciona todas as tabelas relacionadas a os

select `tb4`.`Id_Servico` AS `Id_Servico`,`tb4`.`Id_OS_Servico` AS `Id_OS_Servico`,`tb4`.`Descricao_OS` AS `Descricao_OS`,`tb4`.`Data` AS `Data`,group_concat(distinct concat(`tb4`.`Descricao`,'| Horas = ',`tb4`.`Horas`,'| Valor',`tb4`.`Valor`,'| R$') separator '\n') AS `servicos` from ((select `tb3`.`Quantidade` AS `Quantidade`,`tb3`.`Id_Utilizados` AS `Id_Utilizados`,`tb3`.`Valor` AS `Valor`,`tb3`.`Id_Sub_Servico` AS `Id_Sub_Servico`,`tb3`.`Horas` AS `Horas`,`tb3`.`Descricao` AS `Descricao`,`tb3`.`Id_Servico` AS `Id_Servico`,`tb3`.`Id_OS_Servico` AS `Id_OS_Servico`,`tb3`.`Data` AS `Data`,`tb3`.`Descricao_OS` AS `Descricao_OS`,`tb3`.`fk_Servico_Id_Servico` AS `fk_Servico_Id_Servico`,`lab`.`contem`.`Valor_Efetivo` AS `Valor_Efetivo`,`lab`.`contem`.`fk_Materiais_Id_Material` AS `fk_Materiais_Id_Material`,`lab`.`contem`.`fk_Materias_Utilizados_Id_Utilizados` AS `fk_Materias_Utilizados_Id_Utilizados` from ((select `lab`.`materias_utilizados`.`Quantidade` AS `Quantidade`,`lab`.`materias_utilizados`.`Id_Utilizados` AS `Id_Utilizados`,`tb2`.`Valor` AS `Valor`,`tb2`.`Id_Sub_Servico` AS `Id_Sub_Servico`,`tb2`.`Horas` AS `Horas`,`tb2`.`Descricao` AS `Descricao`,`tb2`.`Id_Servico` AS `Id_Servico`,`tb2`.`Id_OS_Servico` AS `Id_OS_Servico`,`tb2`.`Data` AS `Data`,`tb2`.`Descricao_OS` AS `Descricao_OS`,`tb2`.`fk_Servico_Id_Servico` AS `fk_Servico_Id_Servico` from (`lab`.`materias_utilizados` join (select `lab`.`sub_servico`.`Valor` AS `Valor`,`lab`.`sub_servico`.`Id_Sub_Servico` AS `Id_Sub_Servico`,`lab`.`sub_servico`.`Horas` AS `Horas`,`lab`.`sub_servico`.`fk_OS_Servico_Id_OS_Servico` AS `fk_OS_Servico_Id_OS_Servico`,`lab`.`sub_servico`.`Descricao` AS `Descricao`,`tb1`.`Id_Servico` AS `Id_Servico`,`tb1`.`Id_OS_Servico` AS `Id_OS_Servico`,`tb1`.`Data` AS `Data`,`tb1`.`Descricao_OS` AS `Descricao_OS`,`tb1`.`fk_Servico_Id_Servico` AS `fk_Servico_Id_Servico` from (`lab`.`sub_servico` join (select `lab`.`servico`.`Id_Servico` AS `Id_Servico`,`lab`.`os_servico`.`Id_OS_Servico` AS `Id_OS_Servico`,`lab`.`os_servico`.`Data` AS `Data`,`lab`.`os_servico`.`Descricao_OS` AS `Descricao_OS`,`lab`.`os_servico`.`fk_Servico_Id_Servico` AS `fk_Servico_Id_Servico` from (`lab`.`servico` join `lab`.`os_servico` on(`lab`.`os_servico`.`fk_Servico_Id_Servico` = `lab`.`servico`.`Id_Servico`))) `tb1` on(`tb1`.`Id_OS_Servico` = `lab`.`sub_servico`.`fk_OS_Servico_Id_OS_Servico`))) `tb2` on(`lab`.`materias_utilizados`.`fk_OS_Servico_Id_OS_Servico` = `tb2`.`Id_OS_Servico`))) `tb3` join `lab`.`contem` on(`lab`.`contem`.`fk_Materias_Utilizados_Id_Utilizados` = `tb3`.`Id_Utilizados`))) `tb4` join `lab`.`materias` on(`lab`.`materias`.`id_Material` = `tb4`.`fk_Materiais_Id_Material`))

