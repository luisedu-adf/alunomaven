<%@taglib uri="futurepagesApp" prefix="fpg" %>

<div style="text-align: center;">
    <h2>Editar Turma</h2>
    <br/>
    <br/>
    <fpg:hasError>
        <!-- imprime estre pedaço somente se houver erro na página -->
        <div style="color: red; border: solid 1px red;">
            <fpg:error/>
        </div>
    </fpg:hasError>
    <br />
    <br />
    <a href="<fpg:contextPath />">Voltar ao início</a>
    <br />
    <br />
    <form method="post" action="<fpg:contextPath/>/escola/Turma-update" enctype="multipart/form-data">
        <%--@elvariable id="turma" type="modules.escola.beans.Turma"--%>
        <input name="id" value="${turma.id}" type="hidden" />
        Código: <input id="codigo" name="codigo" value="${turma.codigo}" />
        <br />
        <br />
        Nome: <input id="nome" name="nome" value="${turma.nome}" />
        <br />
        <br />
        Tipo: <fpg:Select list="tipos" defaultText="" name="tipo" selected="${turma.tipo.id}" showAttr="nome"/>
        <br />
        <br />
        Representante:
        <fpg:Select list="alunos" name="representante" defaultText="Selecione..." defaultValue="0" selected="${turma.representante.id}" showAttr="nomeCompleto"/>
        <br />
        <br />
        <input type="submit" value="Atualizar" />
    </form>
</div>
