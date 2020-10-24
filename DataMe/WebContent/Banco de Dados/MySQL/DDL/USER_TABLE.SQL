CREATE TABLE usuario (
	id_usuario INTEGER PRIMARY KEY AUTO_INCREMENT,
	foto_reconhecimento LONGBLOB DEFAULT NULL,
    uuid_usuario BINARY(16) UNIQUE DEFAULT NULL,
    email VARCHAR(200) UNIQUE DEFAULT 'none@none.none',
    senha VARCHAR(60) DEFAULT 'none_password',
    nickname VARCHAR(15) UNIQUE DEFAULT 'none_nickname',
    foto_perfil LONGBLOB DEFAULT NULL,
    
    bloqueio_inspecionar_elemento TINYINT DEFAULT 1, /* 0 >> liberado, 1 >> bloqueado */
    nivel INTEGER DEFAULT 1,
    bloqueado TINYINT DEFAULT 0, /* 0 >> desbloqueado, 1 >> bloqueado */
    
    status TINYINT DEFAULT 0 /* 0 >> offline, 1 >> online */
);