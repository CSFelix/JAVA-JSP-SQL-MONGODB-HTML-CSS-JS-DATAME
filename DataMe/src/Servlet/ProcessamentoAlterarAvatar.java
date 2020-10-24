package Servlet;

import java.io.IOException;
import java.io.InputStream;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import Dao.UsuarioDao;
 
@WebServlet(urlPatterns = "/ProcessamentoAlterarAvatar")
@MultipartConfig(maxFileSize = 16177215) // processa imagens até 16 MB (valor informado em B)
// @MultipartConfig(maxFileSize = 4294967296) // caso um dia eu queira aumentar o limite para 4 GB
public class ProcessamentoAlterarAvatar extends HttpServlet {
	/*
	 * Classe responsável por receber e tratar o envio de imagens de perfil pelos usuários
	 * Após receber, ela irá descriptar as partes do arquivo, uni-las em um único pacote
	 * e encaminhar ao banco de dados
	 * */
	private static final long serialVersionUID = 4L;
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	/*
    	 * Processamento de envio da imagem em método POST
    	 * Assintótica: O(1)
    	 * */
    	
        InputStream avatar = null;
        Part partes_avatar = request.getPart("avatar");
        
        // Caso a imagem foi encaminhada com sucesso à Servlet
        // Tal será processada e inserida no banco de dados
        if (partes_avatar != null) { 
            avatar = partes_avatar.getInputStream();
            UsuarioDao usuario_dao = new UsuarioDao();
        	usuario_dao.AlterarAvatar(request.getParameter("uuid_usuario"), avatar);
        }
        response.sendRedirect("painel.jsp");
    }
}