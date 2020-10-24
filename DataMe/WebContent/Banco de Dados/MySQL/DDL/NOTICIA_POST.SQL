CREATE TABLE noticia_post(
   id_noticia INTEGER PRIMARY KEY AUTO_INCREMENT,
   uuid_noticia BINARY(16) DEFAULT NULL,
   uuid_usuario BINARY(16) DEFAULT NULL,
   status INTEGER DEFAULT 0,
   nivel INTEGER DEFAULT 1,
   
   data_hora_postagem DATETIME DEFAULT NOW(),
   titulo LONGTEXT NOT NULL,
   descricao LONGTEXT NOT NULL,

   CONSTRAINT fk_noticia_post_uuid_usuario
   FOREIGN KEY (uuid_usuario)
   		REFERENCES usuario(uuid_usuario)
);