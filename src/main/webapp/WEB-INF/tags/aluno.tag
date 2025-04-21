<%@tag pageEncoding="UTF-8" %>
<%@taglib uri="futurepagesApp" prefix="fpg"%>
<%--@elvariable id="params" type="java.util.Map"--%>

<%@attribute name="aluno" type="modules.escola.beans.Aluno"  required="true"%>
<%@attribute name="green" type="java.lang.Boolean"  required="true"%>

<tr ${green? 'style="color:green"':'style="color:red"'}>
	<td>${aluno.id}</td>
	<td style="text-align: center"><img src="${params.UPLOADS_URL_PATH}/alunos/${aluno.id}.jpg" style="width: 24px;"/></td>
	<td>${aluno.nomeCompleto}</td>
	<td>${aluno.matricula}</td>
	<td>${aluno.turma.nome}</td>
	<td colspan="2">
		<a class="btn btn-warning" href="<fpg:contextPath/>/escola/Aluno?type=update&id=${aluno.id}">editar</a>
		<a class="btn btn-danger" href="javascript:confirmaExclusao('${aluno.id}', '${aluno.nomeCompleto}', '${aluno.matricula}');" >apagar</a>
	</td>
</tr>