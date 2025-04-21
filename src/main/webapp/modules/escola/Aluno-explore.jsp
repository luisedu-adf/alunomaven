<%@taglib uri="futurepagesApp" prefix="fpg" %>
<%--@elvariable id="turma" type="modules.escola.beans.Turma"--%>
<%--@elvariable id="tipoFiltro" type="modules.escola.enums.TipoFiltroAlunoTurmaEnum"--%>

<script type="text/javascript">
    function confirmaExclusao(id, nomeCompleto, matricula) {
        if(confirm("Deseja realmente apagar o aluno " + nomeCompleto + "\n(matricula: " + matricula + ")")) {
            document.location = '<fpg:contextPath/>/escola/Aluno-delete?id=' + id;
        }
    }
</script>

<div align="center">
	<h2>Listagem de Alunos</h2>
	<fpg:hasSuccess>
		<div style="text-align: center; width: 400px; color:green; border-color: green; background-color: greenyellow">
			<fpg:success/>
		</div>
		<br/>
		<br/>
	</fpg:hasSuccess>
	<a href="<fpg:contextPath/>/escola/Aluno?type=create">Novo Aluno</a>
	<br/>
	<br/>
    <form id="form-filtro-alunos" method="get" action="<fpg:contextPath/>/escola/Aluno-explore">

	    <fpg:Select list="turmas"
	                name="turmaId"
	                selected="${turma!=null? turma.id : 0}"
                    defaultText="- Filtrar por turma -"
                    onchange="$('#form-filtro-alunos').submit()"
                    showAttr="nome"
	    />

	    <fpg:Select list="opcoesFiltroTurma"
	                showAttr="rotulo"
	                name="tipoFiltroName"
	                selected="${tipoFiltro!=null? tipoFiltro.name() : ''}"
	                idName="id"
	                defaultValue=""
                    onchange="$('#form-filtro-alunos').submit()"
	                defaultText="- Lista Geral -"
	    />
    </form>
	<br/>
	<br/>
	<fpg:list value="alunos">
		<fpg:isEmpty>
		Nenhum aluno cadastrado.
		</fpg:isEmpty>
		<fpg:isEmpty negate="true">
			<div style="margin-left: 80px; margin-right: 80px">
				<table class="table table-bordered table-striped"
				       id="table"
				       data-toggle="table"
				       style="text-align: center;">
					<tr>
						<td data-field="id"><strong>ID</strong></td>
						<td><strong>Foto</strong></td>
						<td data-field="codigo"><strong>Nome</strong></td>
						<td data-field="codigo"><strong>Matrícula</strong></td>
						<td data-field="codigo"><strong>Turma</strong></td>
						<td colspan="2" style="text-align: center;"><strong>Ações</strong></td>
					</tr>
					<fpg:loop var="aluno">
						<fpg:aluno aluno="${aluno}" green="${aluno.turma!=null}"/>
					</fpg:loop>
				</table>
			</div>
		</fpg:isEmpty>
	</fpg:list>
	<br/>
	<br/>
</div>
