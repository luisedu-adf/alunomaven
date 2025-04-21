<%@taglib uri="futurepagesApp" prefix="fpg"%>
<%--@elvariable id="aluno" type="modules.escola.beans.Aluno"--%>

<div class="container">
    <h1 style="text-align: center;">Novo Aluno</h1>
    <br/>
    <br/>
    <fpg:hasError>
        <div style="color: red; border:solid 1px red">
            <fpg:error/>
        </div>
    </fpg:hasError>
        <br/>

    <form method="post" action="<fpg:contextPath/>/escola/Aluno-create" enctype="multipart/form-data">
        <div class="form-group" style="display: inline-flex">
            <div style="width: 50%; padding: 20px">
                <label for="nomeCompleto">Nome</label>
                <input class="form-control" id="nomeCompleto" name="nomeCompleto" value="${aluno.nomeCompleto}" />
            </div>
            <div style="width: 50%;padding: 20px">
                <label for="matricula">Matrícula</label>
                <input class="form-control" id="matricula" name="matricula" value="${aluno.matricula}" />
            </div>
            <div style="padding: 20px">
                <label for="turma">Turma</label>
                <fpg:Select id="turma"
                            list="turmas"
                            name="turma"
                            selected="${aluno.turma!=null?aluno.turma.id:0}"
                            showAttr="nome"
                            defaultText="- Sem turma -"
                            defaultValue=""
                            style="margin-top: 8px; margin-left: 5px;"
                />
            </div>

        </div>
        <div style="display: inline-flex">
            <div style="padding-left: 20px">
                <label for="foto">Foto 3x4</label>
                <input style="width: 390px" class="form-control" type="file" id="foto" name="foto"/>
            </div>
            <div style="padding-top: 32px; padding-left: 10px">
                <button type="submit" class="btn btn-primary" value="Salvar"> Salvar </button>
            </div>
        </div>

    </form>
</div>
