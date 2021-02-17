
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 02/17/2021 10:22:50
-- Generated from EDMX file: C:\Users\andre\Desktop\MIW\work-space\net-ws\TiendaWeb_AndreaCalvo\TiendaWeb\Models\ModeloTiendaWeb.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [tiendaWeb];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_PedidoProducto_Pedido]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PedidoProducto] DROP CONSTRAINT [FK_PedidoProducto_Pedido];
GO
IF OBJECT_ID(N'[dbo].[FK_PedidoProducto_Producto]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PedidoProducto] DROP CONSTRAINT [FK_PedidoProducto_Producto];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Productos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Productos];
GO
IF OBJECT_ID(N'[dbo].[Pedidos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Pedidos];
GO
IF OBJECT_ID(N'[dbo].[PedidoProducto]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PedidoProducto];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Productos'
CREATE TABLE [dbo].[Productos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Precio] decimal(18,0)  NOT NULL,
    [Cantidad] smallint  NOT NULL
);
GO

-- Creating table 'Pedidos'
CREATE TABLE [dbo].[Pedidos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre_Cliente] nvarchar(max)  NOT NULL,
    [Fecha] datetime  NOT NULL,
    [Id_Producto] int  NOT NULL,
    [Cantidad] smallint  NOT NULL
);
GO

-- Creating table 'PedidoProducto'
CREATE TABLE [dbo].[PedidoProducto] (
    [Pedido_Id] int  NOT NULL,
    [Productos_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Productos'
ALTER TABLE [dbo].[Productos]
ADD CONSTRAINT [PK_Productos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Pedidos'
ALTER TABLE [dbo].[Pedidos]
ADD CONSTRAINT [PK_Pedidos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Pedido_Id], [Productos_Id] in table 'PedidoProducto'
ALTER TABLE [dbo].[PedidoProducto]
ADD CONSTRAINT [PK_PedidoProducto]
    PRIMARY KEY CLUSTERED ([Pedido_Id], [Productos_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Pedido_Id] in table 'PedidoProducto'
ALTER TABLE [dbo].[PedidoProducto]
ADD CONSTRAINT [FK_PedidoProducto_Pedido]
    FOREIGN KEY ([Pedido_Id])
    REFERENCES [dbo].[Pedidos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Productos_Id] in table 'PedidoProducto'
ALTER TABLE [dbo].[PedidoProducto]
ADD CONSTRAINT [FK_PedidoProducto_Producto]
    FOREIGN KEY ([Productos_Id])
    REFERENCES [dbo].[Productos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PedidoProducto_Producto'
CREATE INDEX [IX_FK_PedidoProducto_Producto]
ON [dbo].[PedidoProducto]
    ([Productos_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------