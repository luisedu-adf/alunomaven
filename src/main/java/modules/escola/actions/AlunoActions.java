package modules.escola.actions;

import install.Resources;
import modules.escola.beans.Aluno;
import modules.escola.beans.Turma;
import modules.escola.dao.AlunoDao;
import modules.escola.dao.TurmaDao;
import modules.escola.enums.TipoFiltroAlunoTurmaEnum;
import modules.escola.validators.AlunoValidator;
import org.apache.commons.fileupload.FileItem;
import org.futurepages.core.persistence.Dao;
import org.futurepages.core.persistence.annotations.Transactional;
import org.futurepages.enums.PathTypeEnum;
import org.futurepages.menta.actions.CrudActions;
import org.futurepages.util.Is;
import org.futurepages.util.The;

import java.io.File;
import java.util.List;

/**
 * Esta é uma CRUD Action. Para entender seu funcionamento,
 * estude o método execute da super classe org.futurepages.CrudActions.
 */
public class AlunoActions extends CrudActions {

    /*
     * É a execução da ação de criação. quando chama-se Aluno.create.fpg
     */
	@Transactional
    public String create() throws Exception {
		Aluno aluno = (Aluno) input.getValue("aluno");
		FileItem foto = (FileItem) input.getValue("foto");
		validate(AlunoValidator.class).createOrUpdate(aluno, foto, CREATE);
        Dao.getInstance().save(aluno);
		gravaFoto(aluno,foto);
        return success("Aluno criado com sucesso");
    }

	/*
		 * Ação de atualização do aluno.  Aluno.create.fpg
		*/
	@Transactional
	public String update() throws Exception {
		Aluno aluno = (Aluno) input.getValue("aluno");
		FileItem foto = (FileItem) input.getValue("foto");
		validate(AlunoValidator.class).createOrUpdate(aluno, foto, UPDATE);
		Dao.getInstance().update(aluno);
		gravaFoto(aluno,foto);
		return success("Aluno atualizado com sucesso.");
	}

	/*
	 * Ação de deleção. Aluno.delete.fpg
	 */
	@Transactional
	public String delete() {
		Aluno aluno = (Aluno) input.getValue("aluno");
		aluno = AlunoDao.getById(aluno.getId());
		Dao.getInstance().delete(aluno);
		return success("Aluno excluído com sucesso.");
	}


	/*
	 * É a execução da filtragem.
	 *
	 * É executado quando chamamos Aluno.explore.fpg?turmaId=99
	 */
	public String explore(int turmaId, String tipoFiltroName) {
		TipoFiltroAlunoTurmaEnum tipoFiltro = null;
		try {
			tipoFiltro = TipoFiltroAlunoTurmaEnum.valueOf(tipoFiltroName);
		}catch (Exception ignored){}
		Turma turma = Is.selected(turmaId)? Dao.getInstance().get(Turma.class, turmaId) : null;

		List<Aluno> alunos = AlunoDao.listByTurmaIdAndTipoFiltro(turma, tipoFiltro);

		List<Turma> turmas = TurmaDao.listAll();
		TipoFiltroAlunoTurmaEnum[] opcoesFiltroTurma = TipoFiltroAlunoTurmaEnum.values();

		// lista principal...
		output("alunos", alunos);

		// dependencias de filtragem
		output("turmas", turmas);
		output("opcoesFiltroTurma", opcoesFiltroTurma);

		//filtros selecionados
		output("turma", turma); //turma filtrada
		output("tipoFiltro", tipoFiltro); //filtro tipo turma realizado

		return SUCCESS;
	}


	private void gravaFoto(Aluno aluno, FileItem foto) throws Exception {
		if(foto!=null){
			String uploadsPath = Resources.getUploadsPath(PathTypeEnum.REAL);
			String path = The.concat(uploadsPath, "/alunos/", String.valueOf(aluno.getId()),".jpg");
			File file = new File(path);
			foto.write(file);
		}
	}

	/*
	 * listObjects() é a filtragem padrão da listagem.
	 * É o filtro default da listagem. Entenda quando é chamado em CrudActions.execute()
	 * É quando executado quando chama-se Aluno.fpg?type=explore
	 */
    @Override
    protected void listObjects() {
        explore(0,null);
    }

    /*
     * método que implementamos com a restauração do objeto do banco para a visão.
     */
    @Override
    protected void restoreObject() {
	    Aluno aluno = (Aluno) input.getValue("aluno");

	    aluno = AlunoDao.getById(aluno.getId());
        output("aluno", aluno);
    }

	/*
	 * Lista de dependências necessárias para telas de criação e atualização.
	 */
	@Override
	protected void listDependencies() {

		//quando tem erro no formulário, para recarregar a tela, deve-se colocar novamente o objeto no output.
		if(hasError()) {
//			Aluno aluno = (Aluno) input.getValue("aluno");
//			output.setValue("aluno", aluno);
			// as duas linhas em cima correspondem a isto:
			fwdValue("aluno");
		}

		List<Turma> turmas = TurmaDao.listAll();
		output("turmas", turmas);
	}

}
