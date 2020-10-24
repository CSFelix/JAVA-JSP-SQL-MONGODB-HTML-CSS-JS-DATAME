CREATE TABLE salt (
	id_salt INTEGER PRIMARY KEY AUTO_INCREMENT,
    uuid_usuario BINARY(16) DEFAULT NULL UNIQUE,
    salt VARCHAR(7) DEFAULT 'none_st',
    
    CONSTRAINT fk_salt_uuid_usuario
    FOREIGN KEY (uuid_usuario) 
        REFERENCES usuario(uuid_usuario)
);