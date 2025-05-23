### Execução alunomaven

antes de executar:
* futurepages.jar deve estar em repositório local ou remoto;
* arquivos de conf devem estar ajustados
* banco de dados mysql57 deve estar rodando

```
git clone https://github.com/luisedu-adf/alunomaven
```

```
mvn clean package
mvn cargo:run
```

*obs: futuramente futurepages.jar ou deve ser upado para um repositório remoto, ou o projeto futurepages deve ser migrado para maven e adicionado em alunoonline (ou outros) como módulo dependência*

### Notas sobre a migração e setup pra rodar

layout inicial do alunoonline:
```
├── src
│   ├── conf
│   ├── init
│   ├── install
│   │   └── escola
│   │       └── res
│   └── modules
│       └── escola
│           ├── actions
│           ├── beans
│           ├── dao
│           ├── enums
│           ├── install
│           └── validators
└── web
    ├── exceptions
    │   ├── dyn
    │   └── template
    ├── init
    ├── META-INF
    ├── modules
    │   └── escola
    ├── template
    └── WEB-INF
        └── tags
```

layout depois de adaptar para padrão Maven:  
```
src/
└── main
    ├── java
    │   ├── init
    │   ├── install
    │   │   └── escola
    │   └── modules
    │       └── escola
    │           ├── actions
    │           ├── beans
    │           ├── dao
    │           ├── enums
    │           ├── install
    │           └── validators
    ├── resources
    │   ├── conf
    │   └── install
    │       └── escola
    │           └── res
    └── webapp
        ├── exceptions
        │   ├── dyn
        │   └── template
        ├── init
        ├── META-INF
        ├── modules
        │   └── escola
        ├── template
        └── WEB-INF
            └── tags
```
*obs1: src/main/resource/install/ deve conter apenas as fotos, nada de .java*

*obs2: muitas pastas com o nome "install"*

adicionou-se pom.xml com a configuração adequada

*obs: precisa ajustar algumas dependências talvez*

roda db num docker:
```bash
docker run -d \
  --name mysql-db \
  -e MYSQL_ROOT_PASSWORD=rootpassword \
  -e MYSQL_DATABASE=alunoonlinebd \
  -e MYSQL_USER=myuser \
  -e MYSQL_PASSWORD=123 \
  -p 127.0.0.1:3306:3306 \
  mysql:5.7
```

ajusta hibernate.properties e app-params.xml apropriadamente

compila e rota tomcat:
```
mvn clean package
mvn cargo:run
```

*obs: tá com um bug de formatação do texto (UTF-8 provavelmente por parte da configuração do tomcat)*
