CREATE TABLE [Usuario] (
	[id] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Nome] nvarchar(50) NOT NULL,
	PRIMARY KEY ([id])
);

CREATE TABLE [ONGs] (
	[id] int IDENTITY(1,1) NOT NULL UNIQUE,
	[nome] nvarchar(255) NOT NULL,
	[descricao] nvarchar(max) NOT NULL,
	[necessidades] nvarchar(max) NOT NULL,
	PRIMARY KEY ([id])
);

CREATE TABLE [doacoes] (
	[id] int IDENTITY(1,1) NOT NULL UNIQUE,
	[tipo_doacao] nvarchar(max) NOT NULL,
	[confirmacao] bit NOT NULL,
	[data_agendamento] date NOT NULL,
	[usuario_id] int NOT NULL,
	[ong_id] int NOT NULL,
	PRIMARY KEY ([id])
);

CREATE TABLE [historico_doacoes] (
	[id] int IDENTITY(1,1) NOT NULL UNIQUE,
	[ong_id] int NOT NULL,
	[data_doacao] rowversion NOT NULL,
	[feedback] nvarchar(max) NOT NULL,
	[usuario_id] int NOT NULL,
	[doacoes_id] int NOT NULL,
	PRIMARY KEY ([id])
);

CREATE TABLE [notificacoes] (
	[id] int IDENTITY(1,1) NOT NULL UNIQUE,
	[mensagem_texto] nvarchar(max) NOT NULL,
	[tipo] nvarchar(max) NOT NULL,
	[data_envio] rowversion NOT NULL,
	[usuario_id] int NOT NULL,
	PRIMARY KEY ([id])
);



ALTER TABLE [doacoes] ADD CONSTRAINT [doacoes_fk4] FOREIGN KEY ([usuario_id]) REFERENCES [Usuario]([id]);

ALTER TABLE [doacoes] ADD CONSTRAINT [doacoes_fk5] FOREIGN KEY ([ong_id]) REFERENCES [ONGs]([id]);
ALTER TABLE [historico_doacoes] ADD CONSTRAINT [historico_doacoes_fk4] FOREIGN KEY ([usuario_id]) REFERENCES [Usuario]([id]);

ALTER TABLE [historico_doacoes] ADD CONSTRAINT [historico_doacoes_fk5] FOREIGN KEY ([doacoes_id]) REFERENCES [doacoes]([id]);
ALTER TABLE [notificacoes] ADD CONSTRAINT [notificacoes_fk4] FOREIGN KEY ([usuario_id]) REFERENCES [Usuario]([id]);