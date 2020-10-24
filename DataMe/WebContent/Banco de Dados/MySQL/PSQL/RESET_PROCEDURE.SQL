DELIMITER $$

CREATE PROCEDURE ResetDataMe()
BEGIN
    /* exclusão da todos os registros do banco de dados */
    DELETE FROM noticia_post WHERE id_noticia < 99999;
	DELETE FROM salt WHERE id_salt < 99999;
    DELETE FROM alterar_senha WHERE id_alterar_senha < 99999;
    DELETE FROM alterar_biometria WHERE id_alterar_biometria < 99999;
    DELETE FROM usuario WHERE id_usuario < 99999;
    
    /* redefinição das sequências das primary keys */
    ALTER TABLE noticia_post AUTO_INCREMENT = 1;
    ALTER TABLE salt AUTO_INCREMENT = 1;
    ALTER TABLE alterar_senha AUTO_INCREMENT = 1;
    ALTER TABLE alterar_biometria AUTO_INCREMENT = 1;
    ALTER TABLE usuario auto_increment = 1;
END$$
DELIMITER ;