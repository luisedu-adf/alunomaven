package modules.escola.enums;

import static org.futurepages.core.persistence.HQLProvider.*;

public enum TipoFiltroAlunoTurmaEnum {
	ALUNOS_COM_TURMA ("Alunos com turma", field("turma").isNotNull()),
	ALUNOS_SEM_TURMA ("Alunos sem turma", field("turma").isNull());

	private final String rotulo;
	private final String whereHQL;

	TipoFiltroAlunoTurmaEnum(String rotulo,String whereHQL) {
		this.rotulo = rotulo;
		this.whereHQL = whereHQL;
	}

	public String getRotulo() {
		return rotulo;
	}

	public String getWhereHQL() {
		return whereHQL;
	}

	public String getId(){
		return name();
	}

}
