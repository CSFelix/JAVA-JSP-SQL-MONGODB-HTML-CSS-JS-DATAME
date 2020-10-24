CREATE TABLE alterar_biometria(
	id_alterar_biometria INTEGER PRIMARY KEY AUTO_INCREMENT,
    uuid_alterar_biometria BINARY(16) DEFAULT NULL,
    hash_alterar_biometria VARCHAR(60) DEFAULT 'none_hash',
    uuid_usuario BINARY(16) DEFAULT NULL,
    usado TINYINT DEFAULT 0, /* 0 >> não usado, 1 >> usado */
    expirado TINYINT DEFAULT 0, /* 0 >> não expirado, 1 >> expirado */
    
    CONSTRAINT fk_alterar_biometria_uuid_usuario
    FOREIGN KEY (uuid_usuario)
		REFERENCES usuario(uuid_usuario)
);