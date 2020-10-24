package Servlet;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.DatatypeConverter;

import Bean.AlterarBiometriaBean;
import Dao.AlterarBiometriaDao;
import Dao.UsuarioDao;

@WebServlet(urlPatterns = "/ProcessamentoAlterarImagemReconhecimento")
@MultipartConfig(maxFileSize = 16177215) // processa imagens at� 16 MB (valor informado em B)
public class ProcessamentoAlterarImagemReconhecimento extends HttpServlet {
	/*
	 * Classe respons�vel por receber e tratar o envio de imagens de reconhecimento pelos usu�rios
	 * Ap�s receber, ela ir� descriptar as partes do arquivo, uni-las em um �nico pacote
	 * e encaminhar ao banco de dados
	 * */
	private static final long serialVersionUID = 4L;
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	/*
    	 * Processamento de envio da imagem em m�todo POST
    	 * Assint�tica: O(1)
    	 * */
    	
        InputStream foto_reconhecimento = null;
        
        // captura da foto do usu�rio e convers�o em bytes
        String foto_usuario = request.getParameter("fotoReconhecimento");
        foto_usuario = foto_usuario.split(",")[1];
        byte[] foto_usuario_bytes = DatatypeConverter.parseBase64Binary(foto_usuario);
        
        String uuid_usuario = request.getParameter("uuid_usuario");
        
        // Caso a imagem foi encaminhada com sucesso � Servlet
        // Tal ser� processada e inserida no banco de dados
        if (foto_usuario != null) { 
        	// alterando foto no registro do usu�rio
            foto_reconhecimento = new ByteArrayInputStream(foto_usuario_bytes);
        	
            UsuarioDao usuario_dao = new UsuarioDao();
        	usuario_dao.AlterarFotoReconhecimento(uuid_usuario, foto_reconhecimento);
        	
        	// marcando link da biometria como usado e expirado
        	AlterarBiometriaBean alterar_biometria = new AlterarBiometriaBean();
        	AlterarBiometriaDao alterar_biometria_dao = new AlterarBiometriaDao();
        	
        	alterar_biometria.setUuidAlterarBiometria(request.getParameter("uuid_alterar_biometria"));
        	alterar_biometria_dao.UsarAlteracao(alterar_biometria);
        	
        	// salvando foto do usu�rio no servidor        				
			try {
	             
				String nickname = usuario_dao.SelecionarNickname(uuid_usuario);
				ByteArrayInputStream bais = new ByteArrayInputStream(foto_usuario_bytes);
				
				BufferedImage bImageFromConvert = ImageIO.read(bais);
				
				System.out.println(nickname);
				System.out.println("\n\n---------\n\n");
				System.out.println(bais);
				System.out.println("\n\n---------\n\n");
				System.out.println(bImageFromConvert);
				System.out.println("\n\n---------\n\n");
				
	            ImageIO.write(bImageFromConvert, "png", new File("C:\\Users\\gabri\\Desktop\\Faculdade\\APS\\Reconhecimento Facial\\assets\\imagensReconhecimento\\" + nickname + ".png"));
	            System.out.println("Images were written succesfully.");
	         } 
			catch (IOException e) { System.out.println("Exception occured :" + e.getMessage()); }			
        }
        response.sendRedirect("biometria-alterada.jsp");
    }
}
