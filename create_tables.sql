CREATE TABLE `Enderecos` (
  `id` int(11) NOT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `rua` varchar(255) DEFAULT NULL,
  `num` varchar(20) DEFAULT NULL,
  `bairro` varchar(100) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `estado` varchar(100) DEFAULT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `cobranca` int(11) DEFAULT NULL,
  `fk_usuario_id` int(11) DEFAULT NULL
);

CREATE TABLE `Formas_pagamento` (
  `id` int(11) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL
);

CREATE TABLE `Imagens_produto` (
  `id` int(11) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `fk_produto_id` int(11) DEFAULT NULL
);

CREATE TABLE `Produtos` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `peso` decimal(10,2) DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  `qtd_estoque` int(11) DEFAULT NULL
);

CREATE TABLE `Produtos_venda` (
  `fk_produto_id` int(11) DEFAULT NULL,
  `fk_venda_id` int(11) DEFAULT NULL
);

CREATE TABLE `Usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `sexo` int(11) DEFAULT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `tipo_usuario` int(11) DEFAULT NULL
);

CREATE TABLE `Vendas` (
  `id` int(11) NOT NULL,
  `data_compra` datetime DEFAULT NULL,
  `valor_total` decimal(10,2) DEFAULT NULL,
  `documento_id` varchar(255) DEFAULT NULL,
  `fk_forma_pagamento_id` int(11) DEFAULT NULL,
  `fk_endereco_id` int(11) DEFAULT NULL,
  `fk_usuario_id` int(11) DEFAULT NULL
);


ALTER TABLE `Enderecos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Enderecos_2` (`fk_usuario_id`);

ALTER TABLE `Formas_pagamento`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `Imagens_produto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Imagens_produto_2` (`fk_produto_id`);

ALTER TABLE `Produtos`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `Produtos_venda`
  ADD KEY `FK_Produtos_venda_1` (`fk_produto_id`),
  ADD KEY `FK_Produtos_venda_2` (`fk_venda_id`);

ALTER TABLE `Usuarios`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `Vendas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Vendas_2` (`fk_forma_pagamento_id`),
  ADD KEY `FK_Vendas_3` (`fk_endereco_id`),
  ADD KEY `FK_Vendas_4` (`fk_usuario_id`);


ALTER TABLE `Enderecos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `Formas_pagamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `Imagens_produto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `Produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `Usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `Vendas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `Enderecos`
  ADD CONSTRAINT `FK_Enderecos_2` FOREIGN KEY (`fk_usuario_id`) REFERENCES `Usuarios` (`id`);

ALTER TABLE `Imagens_produto`
  ADD CONSTRAINT `FK_Imagens_produto_2` FOREIGN KEY (`fk_produto_id`) REFERENCES `Produtos` (`id`) ON DELETE CASCADE;

ALTER TABLE `Produtos_venda`
  ADD CONSTRAINT `FK_Produtos_venda_1` FOREIGN KEY (`fk_produto_id`) REFERENCES `Produtos` (`id`),
  ADD CONSTRAINT `FK_Produtos_venda_2` FOREIGN KEY (`fk_venda_id`) REFERENCES `Vendas` (`id`) ON DELETE SET NULL;

ALTER TABLE `Vendas`
  ADD CONSTRAINT `FK_Vendas_2` FOREIGN KEY (`fk_forma_pagamento_id`) REFERENCES `Formas_pagamento` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Vendas_3` FOREIGN KEY (`fk_endereco_id`) REFERENCES `Enderecos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Vendas_4` FOREIGN KEY (`fk_usuario_id`) REFERENCES `Usuarios` (`id`) ON DELETE CASCADE;
