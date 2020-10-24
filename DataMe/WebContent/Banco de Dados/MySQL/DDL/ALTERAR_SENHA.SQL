CREATE TABLE alterar_senha(
	id_alterar_senha INTEGER PRIMARY KEY AUTO_INCREMENT,
    uuid_alterar_senha BINARY(16) DEFAULT NULL,
    hash_alterar_senha VARCHAR(60) DEFAULT 'none_hash',
    uuid_usuario BINARY(16) DEFAULT NULL,
    usado TINYINT DEFAULT 0, /* 0 >> não usado, 1 >> usado */
    expirado TINYINT DEFAULT 0, /* 0 >> não expirado, 1 >> expirado */
    
    CONSTRAINT fk_alterar_senha_uuid_usuario
    FOREIGN KEY (uuid_usuario)
		REFERENCES usuario(uuid_usuario)
);