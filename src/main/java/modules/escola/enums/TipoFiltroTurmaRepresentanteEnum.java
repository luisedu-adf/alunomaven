package modules.escola.enums;

import static org.futurepages.core.persistence.HQLProvider.field;

public enum TipoFiltroTurmaRepresentanteEnum {
		TURMA_SEM_REPRESENTANTE("Turma sem representante", field("representante").isNull()),
		TURMA_COM_REPRESENTANTE("Turma com representante", field("representante").isNotNull());

		private final String rotulo;
		private final String whereHQL;

		TipoFiltroTurmaRepresentanteEnum(String rotulo,String whereHQL) {
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
