USE GD1C2020;
GO

/* Eliminaci�n de los objetos preexistentes */

------------ Eliminaci�n de tablas    ------------------
IF OBJECT_ID('FELICES_PASCUAS.Venta_Estadia_Habitacion','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.Venta_Estadia_Habitacion;

IF OBJECT_ID('FELICES_PASCUAS.Estadia_Habitacion','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.Estadia_Habitacion;
	
IF OBJECT_ID('FELICES_PASCUAS.Habitacion','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.Habitacion;

IF OBJECT_ID('FELICES_PASCUAS.Tipo_Habitacion','U') IS NOT NULL
    DROP TABLE FELICES_PASCUAS.Tipo_Habitacion;

IF OBJECT_ID('FELICES_PASCUAS.Venta_Estadia','U') IS NOT NULL
    DROP TABLE FELICES_PASCUAS.Venta_Estadia;

IF OBJECT_ID('FELICES_PASCUAS.Pasaje','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.Pasaje;

IF OBJECT_ID('FELICES_PASCUAS.Pasaje_Anomalo','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.Pasaje_Anomalo;

IF OBJECT_ID('FELICES_PASCUAS.Venta_Pasaje','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.Venta_Pasaje;

IF OBJECT_ID('FELICES_PASCUAS.Factura','U') IS NOT NULL
    DROP TABLE FELICES_PASCUAS.Factura;

IF OBJECT_ID('FELICES_PASCUAS.Cliente','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.Cliente;

IF OBJECT_ID('FELICES_PASCUAS.Compra_Estadia','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.Compra_Estadia;

IF OBJECT_ID('FELICES_PASCUAS.Hotel','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.Hotel;

IF OBJECT_ID('FELICES_PASCUAS.Sucursal','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.Sucursal;

IF OBJECT_ID('FELICES_PASCUAS.Compra_Pasaje','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.Compra_Pasaje;

IF OBJECT_ID('FELICES_PASCUAS.Empresa','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.Empresa;

IF OBJECT_ID('FELICES_PASCUAS.Vuelo','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.Vuelo;

IF OBJECT_ID('FELICES_PASCUAS.Ruta_Aerea','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.Ruta_Aerea;

IF OBJECT_ID('FELICES_PASCUAS.Ciudad','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.Ciudad;

IF OBJECT_ID('FELICES_PASCUAS.Butaca','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.Butaca;

IF OBJECT_ID('FELICES_PASCUAS.Tipo_Butaca','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.Tipo_Butaca;

IF OBJECT_ID('FELICES_PASCUAS.Avion','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.Avion;

IF OBJECT_ID('FELICES_PASCUAS.Inconsistencia','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.Inconsistencia;

IF OBJECT_ID('FELICES_PASCUAS.Tipo_Inconsistencia','U') IS NOT NULL
	DROP TABLE FELICES_PASCUAS.Tipo_Inconsistencia;

-------------------- Eliminaci�n del esquema ---------------------------

IF EXISTS (SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = 'FELICES_PASCUAS')
    DROP SCHEMA FELICES_PASCUAS
GO
 
-------------------- Creaci�n del esquema ---------------------------
CREATE SCHEMA FELICES_PASCUAS;
GO

-------------------- Creaci�n de tablas ---------------------------

create table FELICES_PASCUAS.Tipo_Habitacion(
	tipo_habitacion_codigo decimal(18,0) not null,
	tipo_habitacion_desc nvarchar(50)
);

create table FELICES_PASCUAS.Habitacion(
	habitacion_id decimal(18,0) not null,
	habitacion_hotel decimal(18,0) not null,
	habitacion_tipo decimal(18,0) not null,
	habitacion_numero decimal(18,0) not null,
	habitacion_piso decimal(18,0),
	habitacion_frente nvarchar(50),
	habitacion_costo decimal(18,2),
	habitacion_precio decimal (18,2)
);

create table FELICES_PASCUAS.Hotel(
	hotel_id decimal(18,0) not null,
	hotel_calle nvarchar(50),
	hotel_nro_calle decimal(18,0),
	hotel_cant_estrellas decimal (18,0)
);

create table FELICES_PASCUAS.Venta_Estadia(
	venta_estadia_id decimal(18,0) not null,
	venta_estadia_factura decimal(18,0) not null,
	venta_estadia_cargo_extra decimal (18,2),
	venta_estadia_check_in datetime2(3),
	venta_estadia_check_out datetime2(3)
);

create table FELICES_PASCUAS.Venta_Estadia_Habitacion(
	venta_estadia_id decimal(18,0) not null,
	habitacion_id decimal(18,0) not null
);

create table FELICES_PASCUAS.Factura(
	factura_nro decimal(18,0) not null,
	factura_sucursal decimal(18,0) not null,
	factura_cliente decimal (18,0) not null,
	factura_fecha datetime2(3)
);

create table FELICES_PASCUAS.Cliente(
	cliente_id decimal(18,0) not null,
	cliente_dni decimal(18,0),
	cliente_apellido nvarchar(255),
	cliente_nombre nvarchar(255),
	cliente_fecha_nacimiento datetime2(3),
	cliente_mail nvarchar(255),
	cliente_telefono int
);

create table FELICES_PASCUAS.Compra_Estadia(
	estadia_codigo decimal(18,0) not null,
	estadia_fecha_compra datetime2(3),
	estadia_numero_compra decimal(18,0),
	estadia_fecha_inicio datetime2(3),
	estadia_cant_noches decimal(18,0),
	estadia_empresa decimal(18,0) not null,
);

create table FELICES_PASCUAS.Venta_Pasaje(
	venta_pasaje_id decimal(18,0) not null,
	venta_pasaje_factura decimal(18,0) not null,
	venta_pasaje_cargo_extra decimal(18,2)
);

create table FELICES_PASCUAS.Estadia_Habitacion(
	estadia_codigo decimal(18,0) not null,
	habitacion_id decimal(18,0) not null
);

create table FELICES_PASCUAS.Sucursal(
	sucursal_id decimal(18,0) not null,
	sucursal_direccion nvarchar(255),
	sucursal_mail nvarchar(255),
	sucursal_telefono decimal(18,0)
);

create table FELICES_PASCUAS.Compra_Pasaje(
	compra_pasaje_id decimal(18,0) not null,
	compra_pasaje_fecha datetime2(3),
	compra_pasaje_numero decimal(18,0)
);

create table FELICES_PASCUAS.Pasaje(
	pasaje_codigo decimal(18,0) not null,
	pasaje_empresa decimal(18,0) not null,
	pasaje_butaca decimal(18,0) not null,
	pasaje_costo decimal(18,2),
	pasaje_precio decimal (18,2),
	pasaje_compra decimal(18,0) not null,
	pasaje_venta decimal(18,0),
	pasaje_vuelo decimal(18,0) not null
);

create table FELICES_PASCUAS.Empresa(
	empresa_id decimal(18,0) not null,
	empresa_razon_social nvarchar(255)
);

create table FELICES_PASCUAS.Ciudad(
	ciudad_codigo decimal(18,0) not null,
	ciudad_descripcion nvarchar(255)
);

create table FELICES_PASCUAS.Ruta_Aerea(
	ruta_aerea_id decimal(18,0) not null,
	ruta_aerea_codigo decimal(18,0),
	ruta_aerea_ciu_orig decimal(18,0) not null,
	ruta_aerea_ciu_dest decimal(18,0) not null
);

create table FELICES_PASCUAS.Vuelo(
	vuelo_codigo decimal(18,0) not null,
	vuelo_fecha_salida datetime2(3),
	vuelo_fecha_llegada datetime2(3),
	vuelo_ruta_aerea decimal (18,0) not null,
	vuelo_avion nvarchar(50) not null
);

create table FELICES_PASCUAS.Tipo_Butaca(
	tipo_butaca_codigo decimal(18,0) not null,
	tipo_butaca_descripcion nvarchar(255)
);

create table FELICES_PASCUAS.Avion(
	avion_identificador nvarchar(50) not null,
	avion_modelo nvarchar(50)
);

create table FELICES_PASCUAS.Butaca(
	butaca_id decimal(18,0) not null,
	butaca_numero decimal(18,0),
	butaca_tipo decimal(18,0),
	butaca_avion nvarchar(50) not null
);

create table FELICES_PASCUAS.Inconsistencia(
    inconsistencia_id decimal(18,0) not null,
	inconsistencia_tipo decimal(18,0) not null,
	inconsistencia_detalle text
);

create table FELICES_PASCUAS.Pasaje_Anomalo(
	pasaje_anomalo_codigo decimal(18,0) not null,
	pasaje_anomalo_empresa decimal(18,0) not null,
	pasaje_anomalo_butaca decimal(18,0) not null,
	pasaje_anomalo_costo decimal(18,2),
	pasaje_anomalo_precio decimal (18,2),
	pasaje_anomalo_compra decimal(18,0) not null,
	pasaje_anomalo_venta decimal(18,0),
	pasaje_anomalo_vuelo decimal(18,0) not null
);

create table FELICES_PASCUAS.Tipo_Inconsistencia(
    tipo_inconsistencia_id decimal(18,0) not null,
	tipo_inconsistencia_tabla text,
	tipo_inconsistencia_headers text
);
-------------------- Creaci�n de primary keys ---------------------------

ALTER TABLE FELICES_PASCUAS.Inconsistencia 
ADD CONSTRAINT PK_Inconsistencia PRIMARY KEY (inconsistencia_id);

ALTER TABLE FELICES_PASCUAS.Tipo_Habitacion 
ADD CONSTRAINT PK_Tipo_Habitacion PRIMARY KEY (tipo_habitacion_codigo);

ALTER TABLE FELICES_PASCUAS.Venta_Estadia_Habitacion 
ADD CONSTRAINT PK_Venta_Estadia_Habitacion PRIMARY KEY (venta_estadia_id, habitacion_id);

ALTER TABLE FELICES_PASCUAS.Habitacion 
ADD CONSTRAINT PK_Habitacion PRIMARY KEY (habitacion_id);

ALTER TABLE FELICES_PASCUAS.Estadia_Habitacion 
ADD CONSTRAINT PK_Estadia_Habitacion PRIMARY KEY (habitacion_id, estadia_codigo);

ALTER TABLE FELICES_PASCUAS.Venta_Estadia 
ADD CONSTRAINT PK_Venta_Estadia PRIMARY KEY (venta_estadia_id);

ALTER TABLE FELICES_PASCUAS.Factura 
ADD CONSTRAINT PK_Factura PRIMARY KEY (factura_nro);

ALTER TABLE FELICES_PASCUAS.Cliente 
ADD CONSTRAINT PK_Cliente PRIMARY KEY (cliente_id);

ALTER TABLE FELICES_PASCUAS.Hotel 
ADD CONSTRAINT PK_Hotel PRIMARY KEY (hotel_id);

ALTER TABLE FELICES_PASCUAS.Compra_Estadia
ADD CONSTRAINT PK_Compra_Estadia PRIMARY KEY (estadia_codigo);

ALTER TABLE FELICES_PASCUAS.Venta_Pasaje 
ADD CONSTRAINT PK_Venta_Pasaje PRIMARY KEY (venta_pasaje_id);

ALTER TABLE FELICES_PASCUAS.Sucursal 
ADD CONSTRAINT PK_Sucursal PRIMARY KEY (sucursal_id);

ALTER TABLE FELICES_PASCUAS.Compra_Pasaje 
ADD CONSTRAINT PK_Compra_Pasaje PRIMARY KEY (compra_pasaje_id);

ALTER TABLE FELICES_PASCUAS.Pasaje 
ADD CONSTRAINT PK_Pasaje PRIMARY KEY (pasaje_codigo);

ALTER TABLE FELICES_PASCUAS.Pasaje_Anomalo 
ADD CONSTRAINT PK_Pasaje_Anomalo PRIMARY KEY (pasaje_anomalo_codigo);

ALTER TABLE FELICES_PASCUAS.Empresa 
ADD CONSTRAINT PK_Empresa PRIMARY KEY (empresa_id);

ALTER TABLE FELICES_PASCUAS.Ciudad 
ADD CONSTRAINT PK_Ciudad PRIMARY KEY (ciudad_codigo);

ALTER TABLE FELICES_PASCUAS.Ruta_Aerea 
ADD CONSTRAINT PK_Ruta_Aerea PRIMARY KEY (ruta_aerea_id);

ALTER TABLE FELICES_PASCUAS.Vuelo 
ADD CONSTRAINT PK_Vuelo PRIMARY KEY (vuelo_codigo);

ALTER TABLE FELICES_PASCUAS.Tipo_Butaca 
ADD CONSTRAINT PK_Tipo_Butaca PRIMARY KEY (tipo_butaca_codigo);

ALTER TABLE FELICES_PASCUAS.Avion 
ADD CONSTRAINT PK_Avion PRIMARY KEY (avion_identificador);

ALTER TABLE FELICES_PASCUAS.Butaca 
ADD CONSTRAINT PK_Butaca PRIMARY KEY (butaca_id);

ALTER TABLE FELICES_PASCUAS.Tipo_Inconsistencia 
ADD CONSTRAINT PK_Tipo_Inconsistencia PRIMARY KEY (tipo_inconsistencia_id);

-------------------- Creaci�n de foreign keys ---------------------------

ALTER TABLE FELICES_PASCUAS.Habitacion ADD CONSTRAINT FK_Habitacion_Hotel 
FOREIGN KEY (habitacion_hotel) REFERENCES FELICES_PASCUAS.Hotel(hotel_id);

ALTER TABLE FELICES_PASCUAS.Habitacion ADD CONSTRAINT FK_Habitacion_TipoHabitacion
FOREIGN KEY (habitacion_tipo) REFERENCES FELICES_PASCUAS.Tipo_Habitacion(tipo_habitacion_codigo);

ALTER TABLE FELICES_PASCUAS.Venta_Estadia_Habitacion ADD CONSTRAINT FK_VentaEstadiaHabitacion_Habitacion
FOREIGN KEY (habitacion_id) REFERENCES FELICES_PASCUAS.Habitacion(habitacion_id);

ALTER TABLE FELICES_PASCUAS.Venta_Estadia_Habitacion ADD CONSTRAINT FK_VentaEstadiaHabitacion_VentaEstadia
FOREIGN KEY (venta_estadia_id) REFERENCES FELICES_PASCUAS.Venta_Estadia(venta_estadia_id);

ALTER TABLE FELICES_PASCUAS.Factura ADD CONSTRAINT FK_Factura_Sucursal
FOREIGN KEY (factura_sucursal) REFERENCES FELICES_PASCUAS.Sucursal(sucursal_id);

ALTER TABLE FELICES_PASCUAS.Factura ADD CONSTRAINT FK_Factura_Cliente
FOREIGN KEY (factura_cliente) REFERENCES FELICES_PASCUAS.Cliente(cliente_id);

ALTER TABLE FELICES_PASCUAS.Venta_Pasaje ADD CONSTRAINT FK_VentaPasaje_Factura
FOREIGN KEY (venta_pasaje_factura) REFERENCES FELICES_PASCUAS.Factura(factura_nro);

ALTER TABLE FELICES_PASCUAS.Venta_Estadia ADD CONSTRAINT FK_VentaEstadia_Factura
FOREIGN KEY (venta_estadia_factura) REFERENCES FELICES_PASCUAS.Factura(factura_nro);

ALTER TABLE FELICES_PASCUAS.Estadia_Habitacion ADD CONSTRAINT FK_EstadiaHabitacion_Habitacion
FOREIGN KEY (habitacion_id) REFERENCES FELICES_PASCUAS.Habitacion(habitacion_id);

ALTER TABLE FELICES_PASCUAS.Estadia_Habitacion ADD CONSTRAINT FK_EstadiaHabitacion_Estadia
FOREIGN KEY (estadia_codigo) REFERENCES FELICES_PASCUAS.Compra_Estadia(estadia_codigo);

ALTER TABLE FELICES_PASCUAS.Compra_Estadia ADD CONSTRAINT FK_CompraEstadia_Empresa
FOREIGN KEY (estadia_empresa) REFERENCES FELICES_PASCUAS.Empresa(empresa_id);

ALTER TABLE FELICES_PASCUAS.Pasaje ADD CONSTRAINT FK_Pasaje_Butaca
FOREIGN KEY (pasaje_butaca) REFERENCES FELICES_PASCUAS.Butaca(butaca_id);

ALTER TABLE FELICES_PASCUAS.Pasaje ADD CONSTRAINT FK_Pasaje_Empresa
FOREIGN KEY (pasaje_empresa) REFERENCES FELICES_PASCUAS.Empresa(empresa_id);

ALTER TABLE FELICES_PASCUAS.Pasaje ADD CONSTRAINT FK_Pasaje_CompraPasaje
FOREIGN KEY (pasaje_compra) REFERENCES FELICES_PASCUAS.Compra_Pasaje(compra_pasaje_id);

ALTER TABLE FELICES_PASCUAS.Pasaje ADD CONSTRAINT FK_Pasaje_VentaPasaje
FOREIGN KEY (pasaje_venta) REFERENCES FELICES_PASCUAS.Venta_Pasaje(venta_pasaje_id);

ALTER TABLE FELICES_PASCUAS.Pasaje ADD CONSTRAINT FK_Pasaje_Vuelo
FOREIGN KEY (pasaje_vuelo) REFERENCES FELICES_PASCUAS.Vuelo(vuelo_codigo);

ALTER TABLE FELICES_PASCUAS.Pasaje_Anomalo ADD CONSTRAINT FK_PasajeAnomalo_Butaca
FOREIGN KEY (pasaje_anomalo_butaca) REFERENCES FELICES_PASCUAS.Butaca(butaca_id);

ALTER TABLE FELICES_PASCUAS.Pasaje_Anomalo ADD CONSTRAINT FK_PasajeAnomalo_Empresa
FOREIGN KEY (pasaje_anomalo_empresa) REFERENCES FELICES_PASCUAS.Empresa(empresa_id);

ALTER TABLE FELICES_PASCUAS.Pasaje_Anomalo ADD CONSTRAINT FK_PasajeAnomalo_CompraPasaje
FOREIGN KEY (pasaje_anomalo_compra) REFERENCES FELICES_PASCUAS.Compra_Pasaje(compra_pasaje_id);

ALTER TABLE FELICES_PASCUAS.Pasaje_Anomalo ADD CONSTRAINT FK_PasajeAnomalo_VentaPasaje
FOREIGN KEY (pasaje_anomalo_venta) REFERENCES FELICES_PASCUAS.Venta_Pasaje(venta_pasaje_id);

ALTER TABLE FELICES_PASCUAS.Pasaje_Anomalo ADD CONSTRAINT FK_PasajeAnomalo_Vuelo
FOREIGN KEY (pasaje_anomalo_vuelo) REFERENCES FELICES_PASCUAS.Vuelo(vuelo_codigo);

ALTER TABLE FELICES_PASCUAS.Ruta_Aerea ADD CONSTRAINT FK_RutaAerea_CiudadO
FOREIGN KEY (ruta_aerea_ciu_orig) REFERENCES FELICES_PASCUAS.Ciudad(ciudad_codigo);

ALTER TABLE FELICES_PASCUAS.Ruta_Aerea ADD CONSTRAINT FK_RutaAerea_CiudadD
FOREIGN KEY (ruta_aerea_ciu_dest) REFERENCES FELICES_PASCUAS.Ciudad(ciudad_codigo);

ALTER TABLE FELICES_PASCUAS.Vuelo ADD CONSTRAINT FK_Vuelo_RutaAerea
FOREIGN KEY (vuelo_ruta_aerea) REFERENCES FELICES_PASCUAS.Ruta_Aerea(ruta_aerea_id);

ALTER TABLE FELICES_PASCUAS.Vuelo ADD CONSTRAINT FK_Vuelo_Avion
FOREIGN KEY (vuelo_avion) REFERENCES FELICES_PASCUAS.Avion(avion_identificador);

ALTER TABLE FELICES_PASCUAS.Butaca ADD CONSTRAINT FK_Butaca_Avion
FOREIGN KEY (butaca_avion) REFERENCES FELICES_PASCUAS.Avion(avion_identificador);

ALTER TABLE FELICES_PASCUAS.Butaca ADD CONSTRAINT FK_Butaca_TipoButaca
FOREIGN KEY (butaca_tipo) REFERENCES FELICES_PASCUAS.Tipo_Butaca(tipo_butaca_codigo);

ALTER TABLE FELICES_PASCUAS.Inconsistencia ADD CONSTRAINT FK_Inconsistencia_TipoInconsistencia
FOREIGN KEY (inconsistencia_tipo) REFERENCES FELICES_PASCUAS.Tipo_Inconsistencia(tipo_inconsistencia_id);

-------------------- Migraci�n de tablas ---------------------------

insert into FELICES_PASCUAS.Empresa
select row_number() over (order by (select NULL)), EMPRESA_RAZON_SOCIAL
from gd_esquema.Maestra
group by EMPRESA_RAZON_SOCIAL



insert into FELICES_PASCUAS.Ciudad
select row_number() over (order by (select NULL)), RUTA_AEREA_CIU_ORIG
from gd_esquema.Maestra
where RUTA_AEREA_CIU_ORIG is not null
group by RUTA_AEREA_CIU_ORIG



insert into FELICES_PASCUAS.Avion
select AVION_IDENTIFICADOR, AVION_MODELO
from gd_esquema.Maestra
where AVION_IDENTIFICADOR is not null
group by AVION_IDENTIFICADOR, AVION_MODELO



insert into FELICES_PASCUAS.Tipo_Butaca
select row_number() over (order by (select NULL)), BUTACA_TIPO
from gd_esquema.Maestra
where BUTACA_TIPO is not null
group by BUTACA_TIPO



insert into FELICES_PASCUAS.Sucursal
select row_number() over (order by (select NULL)), SUCURSAL_DIR, SUCURSAL_MAIL, SUCURSAL_TELEFONO
from gd_esquema.Maestra
where SUCURSAL_DIR is not null and SUCURSAL_MAIL is not null and SUCURSAL_TELEFONO is not null
group by SUCURSAL_DIR, SUCURSAL_MAIL, SUCURSAL_TELEFONO



insert into FELICES_PASCUAS.Cliente
select row_number() over (order by (select NULL)), CLIENTE_DNI, CLIENTE_APELLIDO, CLIENTE_NOMBRE, CLIENTE_FECHA_NAC, CLIENTE_MAIL, CLIENTE_TELEFONO
from gd_esquema.Maestra
where CLIENTE_DNI is not null
group BY CLIENTE_DNI, CLIENTE_APELLIDO, CLIENTE_NOMBRE, CLIENTE_FECHA_NAC, CLIENTE_MAIL, CLIENTE_TELEFONO


insert into FELICES_PASCUAS.Hotel
select row_number() over (order by (select NULL)), HOTEL_CALLE, HOTEL_NRO_CALLE, HOTEL_CANTIDAD_ESTRELLAS
from gd_esquema.Maestra
where HOTEL_CALLE is not null
group by HOTEL_CALLE, HOTEL_NRO_CALLE, HOTEL_CANTIDAD_ESTRELLAS



insert into FELICES_PASCUAS.Tipo_Habitacion
select TIPO_HABITACION_CODIGO, TIPO_HABITACION_DESC
from gd_esquema.Maestra
where TIPO_HABITACION_CODIGO is not null
group by TIPO_HABITACION_CODIGO, TIPO_HABITACION_DESC



insert into FELICES_PASCUAS.Ruta_Aerea
select row_number() over (order by (select NULL)), RUTA_AEREA_CODIGO, c_orig.ciudad_codigo, c_dest.ciudad_codigo
from gd_esquema.Maestra
join FELICES_PASCUAS.Ciudad c_orig on RUTA_AEREA_CIU_ORIG = c_orig.ciudad_descripcion
join FELICES_PASCUAS.Ciudad c_dest on RUTA_AEREA_CIU_DEST = c_dest.ciudad_descripcion
group by RUTA_AEREA_CODIGO, c_orig.ciudad_codigo, c_dest.ciudad_codigo



insert into FELICES_PASCUAS.Vuelo
select m.VUELO_CODIGO, m.VUELO_FECHA_SALUDA, m.VUELO_FECHA_LLEGADA, ra.ruta_aerea_id, a.avion_identificador
from gd_esquema.Maestra m
join FELICES_PASCUAS.Ruta_Aerea ra on ra.ruta_aerea_codigo = m.RUTA_AEREA_CODIGO
join FELICES_PASCUAS.Ciudad c_orig on c_orig.ciudad_codigo = ra.ruta_aerea_ciu_orig and m.RUTA_AEREA_CIU_ORIG = c_orig.ciudad_descripcion
join FELICES_PASCUAS.Avion a on a.avion_identificador = m.AVION_IDENTIFICADOR and a.avion_modelo = m.AVION_MODELO
group by m.VUELO_CODIGO, m.VUELO_FECHA_SALUDA, m.VUELO_FECHA_LLEGADA, ra.ruta_aerea_id, a.avion_identificador



insert into FELICES_PASCUAS.Habitacion
select row_number() over (order by (select NULL)), h.hotel_id, th.tipo_habitacion_codigo, m.HABITACION_NUMERO, m.HABITACION_PISO, m.HABITACION_FRENTE, m.HABITACION_COSTO, m.HABITACION_PRECIO
from gd_esquema.Maestra m
join FELICES_PASCUAS.Hotel h on h.hotel_calle = m.HOTEL_CALLE and h.hotel_nro_calle = m.HOTEL_NRO_CALLE and h.hotel_cant_estrellas = m.HOTEL_CANTIDAD_ESTRELLAS
join FELICES_PASCUAS.Tipo_Habitacion th on th.tipo_habitacion_codigo = m.TIPO_HABITACION_CODIGO
group by h.hotel_id, m.HABITACION_NUMERO, m.HABITACION_PISO, m.HABITACION_FRENTE, th.tipo_habitacion_codigo, m.HABITACION_COSTO, m.HABITACION_PRECIO



insert into FELICES_PASCUAS.Butaca
select row_number() over (order by (select NULL)), m.BUTACA_NUMERO, tb.tipo_butaca_codigo, a.avion_identificador
from gd_esquema.Maestra m
join FELICES_PASCUAS.Avion a on a.avion_identificador = m.AVION_IDENTIFICADOR
join FELICES_PASCUAS.Tipo_Butaca tb on tb.tipo_butaca_descripcion = m.BUTACA_TIPO
group by m.BUTACA_NUMERO, tb.tipo_butaca_codigo, a.avion_identificador



insert into FELICES_PASCUAS.Factura
select m.FACTURA_NRO, s.sucursal_id, c.cliente_id, m.FACTURA_FECHA
from gd_esquema.Maestra m
join FELICES_PASCUAS.Sucursal s on s.sucursal_direccion = m.SUCURSAL_DIR and s.sucursal_mail = m.SUCURSAL_MAIL and s.sucursal_telefono = m.SUCURSAL_TELEFONO
join FELICES_PASCUAS.Cliente c on c.cliente_dni = m.CLIENTE_DNI and c.cliente_fecha_nacimiento = m.CLIENTE_FECHA_NAC
where m.FACTURA_NRO is not null
group by m.FACTURA_NRO, s.sucursal_id, c.cliente_id, m.FACTURA_FECHA



insert into FELICES_PASCUAS.Compra_Pasaje
select row_number() over (order by (select NULL)), COMPRA_FECHA, COMPRA_NUMERO
from gd_esquema.Maestra
where pasaje_codigo is not null
group by COMPRA_NUMERO, COMPRA_FECHA



insert into FELICES_PASCUAS.Compra_Estadia
select m.estadia_codigo, m.COMPRA_FECHA, m.COMPRA_NUMERO, m.ESTADIA_FECHA_INI, m.ESTADIA_CANTIDAD_NOCHES, e.empresa_id
from gd_esquema.Maestra m
join FELICES_PASCUAS.Empresa e on e.empresa_razon_social = m.EMPRESA_RAZON_SOCIAL
where m.ESTADIA_CODIGO is not null
group by m.estadia_codigo, m.COMPRA_FECHA, m.COMPRA_NUMERO, m.ESTADIA_CANTIDAD_NOCHES, m.ESTADIA_FECHA_INI, e.empresa_id
order by m.estadia_codigo, m.COMPRA_FECHA, m.COMPRA_NUMERO, m.ESTADIA_CANTIDAD_NOCHES, m.ESTADIA_FECHA_INI, e.empresa_id



insert into FELICES_PASCUAS.Estadia_Habitacion
select m.estadia_codigo, h.habitacion_id
from gd_esquema.Maestra m
join FELICES_PASCUAS.Hotel ho on ho.hotel_calle = m.HOTEL_CALLE and ho.hotel_nro_calle = m.HOTEL_NRO_CALLE
join FELICES_PASCUAS.Habitacion h on h.habitacion_numero = m.HABITACION_NUMERO and h.habitacion_hotel = ho.hotel_id
join FELICES_PASCUAS.Compra_Estadia ce on ce.estadia_codigo = m.estadia_codigo
group by m.estadia_codigo, h.habitacion_id
order by h.habitacion_id, m.estadia_codigo



insert into FELICES_PASCUAS.Venta_Estadia
select row_number() over (order by (select NULL)), fa.FACTURA_NRO, sum(m.HABITACION_COSTO) * 0.2, ce.estadia_fecha_inicio, DATEADD(day,ce.estadia_cant_noches,ce.estadia_fecha_inicio)
from gd_esquema.Maestra m
join FELICES_PASCUAS.Factura fa on fa.factura_nro = m.FACTURA_NRO
join FELICES_PASCUAS.Compra_Estadia ce on ce.estadia_codigo = m.ESTADIA_CODIGO 
group by fa.factura_nro, ce.estadia_fecha_inicio, ce.estadia_cant_noches
order by fa.factura_nro, ce.estadia_fecha_inicio



insert into FELICES_PASCUAS.Venta_Estadia_Habitacion
select ve.venta_estadia_id, ha.habitacion_id
from gd_esquema.Maestra ma 
join FELICES_PASCUAS.Venta_Estadia ve on ve.venta_estadia_factura = ma.FACTURA_NRO
join FELICES_PASCUAS.Hotel ho on ho.hotel_calle = ma.HOTEL_CALLE and ho.hotel_cant_estrellas = ma.HOTEL_CANTIDAD_ESTRELLAS and ho.hotel_nro_calle = ma.HOTEL_NRO_CALLE
join FELICES_PASCUAS.Habitacion ha on ha.habitacion_numero = ma.HABITACION_NUMERO and ha.habitacion_hotel = ho.hotel_id
group by ve.venta_estadia_id, ha.habitacion_id



insert into FELICES_PASCUAS.Venta_Pasaje
select row_number() over (order by (select NULL)), fa.factura_nro, sum(m.PASAJE_COSTO) * 0.2
from gd_esquema.Maestra m
join FELICES_PASCUAS.Factura fa on fa.factura_nro = m.FACTURA_NRO
where ESTADIA_CODIGO is null
group by fa.factura_nro



--INSERT: todos los pasajes con NULL en la FK de venta_pasaje
insert into FELICES_PASCUAS.Pasaje
select ma.PASAJE_CODIGO, e.empresa_id, b.butaca_id, ma.PASAJE_COSTO, ma.PASAJE_PRECIO, cp.compra_pasaje_id, NULL, v.vuelo_codigo
from gd_esquema.Maestra ma
join FELICES_PASCUAS.Empresa e on ma.EMPRESA_RAZON_SOCIAL = e.empresa_razon_social
join FELICES_PASCUAS.Avion a on ma.AVION_IDENTIFICADOR = a.avion_identificador
join FELICES_PASCUAS.Tipo_Butaca tb on ma.BUTACA_TIPO = tb.tipo_butaca_descripcion
join FELICES_PASCUAS.Butaca b on ma.BUTACA_NUMERO = b.butaca_numero and tb.tipo_butaca_codigo = b.butaca_tipo and b.butaca_avion = a.avion_identificador
join FELICES_PASCUAS.Vuelo v on v.vuelo_codigo = ma.VUELO_CODIGO
join FELICES_PASCUAS.Compra_Pasaje cp on cp.compra_pasaje_numero = ma.COMPRA_NUMERO
group by ma.PASAJE_CODIGO, e.empresa_id, b.butaca_id, ma.PASAJE_COSTO, ma.PASAJE_PRECIO, cp.compra_pasaje_id, v.vuelo_codigo

--UPDATE: se actualizan los pasajes vendidos seteando id
update pasaje
set pasaje.pasaje_venta = vendidos.venta_pasaje_id
from FELICES_PASCUAS.Pasaje pasaje
join (select pa.pasaje_codigo, vp.venta_pasaje_id
	  from gd_esquema.Maestra ma
	  join FELICES_PASCUAS.Pasaje pa on pa.pasaje_codigo = ma.PASAJE_CODIGO
	  join FELICES_PASCUAS.Venta_Pasaje vp on vp.venta_pasaje_factura = ma.FACTURA_NRO) vendidos on vendidos.pasaje_codigo = pasaje.pasaje_codigo



insert into FELICES_PASCUAS.Tipo_Inconsistencia
values
(1, 'Pasaje','COMPRA_NUMERO, COMPRA_FECHA, EMPRESA_RAZON_SOCIAL, PASAJE_CODIGO, PASAJE_COSTO, PASAJE_PRECIO, PASAJE_FECHA_COMPRA, VUELO_CODIGO,
	VUELO_FECHA_SALUDA, VUELO_FECHA_LLEGADA, RUTA_AEREA_CODIGO,RUTA_AEREA_CIU_ORIG, RUTA_AEREA_CIU_DEST, BUTACA_NUMERO,
	BUTACA_TIPO, AVION_MODELO, AVION_IDENTIFICADOR'),
(2, 'Estadia', 'COMPRA_NUMERO, COMPRA_FECHA, ESTADIA_FECHA_INI, ESTADIA_CANTIDAD_NOCHES, ESTADIA_CODIGO, EMPRESA_RAZON_SOCIAL, HOTEL_CALLE,
	HOTEL_NRO_CALLE,  HOTEL_CANTIDAD_ESTRELLAS,  HABITACION_NUMERO, HABITACION_PISO, HABITACION_FRENTE, HABITACION_COSTO, HABITACION_PRECIO, 
	TIPO_HABITACION_CODIGO, TIPO_HABITACION_DESC')



/*Inconsistencia de pasajes*/
insert into	FELICES_PASCUAS.Inconsistencia
select row_number() over (order by (select NULL)),
	   1, 
	   concat(m.COMPRA_NUMERO, ', ', m.COMPRA_FECHA, ', ', m.EMPRESA_RAZON_SOCIAL, ', ', m.PASAJE_CODIGO, ', ', m.PASAJE_COSTO, ', ', 
	   m.PASAJE_PRECIO, ', ', m.PASAJE_FECHA_COMPRA, ', ', m.vuelo_codigo, ', ', m.vuelo_fecha_saluda, ', ', m.VUELO_FECHA_LLEGADA, ', ', 
	   m.RUTA_AEREA_CODIGO, ', ', m.RUTA_AEREA_CIU_ORIG, ', ', m.RUTA_AEREA_CIU_DEST, ', ', m.BUTACA_NUMERO, ', ', m.BUTACA_TIPO, ', ',
	   m.AVION_MODELO, ', ', m.AVION_IDENTIFICADOR)
from gd_esquema.Maestra m 
where m.PASAJE_CODIGO is not null and m.FACTURA_NRO is null



/*Inconsistencia de estad�as*/
insert into	FELICES_PASCUAS.Inconsistencia
select (row_number() over (order by (select null)) + (select count(*) from FELICES_PASCUAS.Inconsistencia)),
	   2, 
	   concat(m.COMPRA_NUMERO, ', ', m.COMPRA_FECHA, ', ', m.ESTADIA_FECHA_INI, ', ', m.ESTADIA_CANTIDAD_NOCHES, ', ', m.ESTADIA_CODIGO, ', ', 
	   m.EMPRESA_RAZON_SOCIAL, ', ', m.HOTEL_CALLE, ', ', m.HOTEL_NRO_CALLE, ', ', m.HOTEL_CANTIDAD_ESTRELLAS, ', ', m.HABITACION_NUMERO, ', ', 
	   m.HABITACION_PISO, ', ', m.HABITACION_FRENTE, ', ', m.habitacion_costo, ', ', m.habitacion_precio, ', ', m.TIPO_HABITACION_CODIGO, ', ',
	   m.TIPO_HABITACION_DESC)
from gd_esquema.Maestra m 
where m.ESTADIA_CODIGO is not null and m.FACTURA_NRO is null



/*Pasaje_Anomalo*/
insert into FELICES_PASCUAS.Pasaje_Anomalo
select * from FELICES_PASCUAS.Pasaje p
where p.pasaje_codigo in
	(select top 1 pas.pasaje_codigo from FELICES_PASCUAS.Pasaje pas
	join FELICES_PASCUAS.Compra_Pasaje cp on cp.compra_pasaje_id = pas.pasaje_compra
	join 
		(select pa.pasaje_vuelo, pa.pasaje_butaca from FELICES_PASCUAS.Pasaje pa
		group by pa.pasaje_butaca, pa.pasaje_vuelo
		having count(*) > 1
		) butaRep on butaRep.pasaje_butaca = pas.pasaje_butaca and butaRep.pasaje_vuelo = pas.pasaje_vuelo
	where p.pasaje_butaca = pas.pasaje_butaca and p.pasaje_vuelo = pas.pasaje_vuelo
	order by p.pasaje_venta, compra_pasaje_fecha desc
	)
/*Update de Pasaje (borrado de anomalos)*/
delete FELICES_PASCUAS.Pasaje
where pasaje_codigo in
(select pasaje_anomalo_codigo from FELICES_PASCUAS.Pasaje_Anomalo)