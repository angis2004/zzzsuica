USE SICA;
GO

--ID = identificador de registros 
--Se filtrara los registros POR SU ID 

--TABLA

CREATE TABLE Informe (
    InformeId INT  IDENTITY(1,1) primary key,     
    UsuarioId INT,                  
    EmpresaId INT,
    NroSerie VARCHAR(100),              
    TipoEquipo VARCHAR(100),
    ClasificacionEquipo INT,                                               
    Marca VARCHAR(50),                     
    Modelo VARCHAR(100),                                        
    FechaUltimoMantenimiento DATE, 
    SolpeUltimoMantenimiento VARCHAR(100),               
    InformeEstado VARCHAR(MAX), 
    NroOrden VARCHAR(100),
    NroActivo VARCHAR(100),
    FIEquipo VARCHAR(100),
    FechaCompra DATE, 
    Proveedor VARCHAR(100),
    Monto DECIMAL(12,2),
    CostoMantenimientoRepuesto DECIMAL(12,2),
    ObservacionJefaturaCompras VARCHAR(MAX), 
    DatosReparacion VARCHAR(MAX), 
    EsActivo VARCHAR(50), 
    Estado INT,                   
);


/**************** tabla para URLS **************************/

CREATE TABLE FotosInforme (
    FotosInformeID INT IDENTITY(1,1) primary  key,
    -- InformeId INT FOREIGN KEY REFERENCES Informe,
    FOREIGN KEY (InformeId) REFERENCES Informe(InformeId)
    UrlFotos VARCHAR(500),
)

/**************** CREAR **************************/
CREATE PROCEDURE CrearInforme(
    -- @InformeId INT ,
    -- @UsuarioId INT,             
    -- @EmpresaId INT,
    @NroSerie  VARCHAR(100) ,          
    @TipoEquipo VARCHAR(100) ,
    @ClasificacionEquipo INT,
    @Marca VARCHAR(50),                     
    @Modelo VARCHAR(100),                                        
    @FechaUltimoMantenimiento DATE,
    @SolpeUltimoMantenimiento VARCHAR(100) ,            
    @InformeEstado VARCHAR(MAX) , 
    @NroOrden VARCHAR(100),
    @NroActivo VARCHAR(100),
    @FIEquipo VARCHAR(100),
    @FechaCompra DATE,
    @Proveedor VARCHAR(100),
    @Monto DECIMAL(12,2),
    @CostoMantenimientoRepuesto DECIMAL(12,2) ,
    @ObservacionJefaturaCompras VARCHAR(MAX),
    @DatosReparacion VARCHAR(MAX),  
    @EsActivo VARCHAR(50),
    @Estado INT ,   
)
AS
BEGIN
    INSERT INTO Informe (
        UsuarioId, 
        EmpresaId, 
        NroSerie, 
        TipoEquipo, 
        ClasificacionEquipo, 
        Marca, 
        Modelo, 
        FechaUltimoMantenimiento, 
        SolpeUltimoMantenimiento, 
        InformeEstado, 
        NroOrden, 
        NroActivo, 
        FIEquipo, 
        FechaCompra, 
        Proveedor, 
        Monto, 
        CostoMantenimientoRepuesto, 
        ObservacionJefaturaCompras, 
        DatosReparacion, 
        EsActivo, 
        Estado
    )
    VALUES (
        @UsuarioId, 
        @EmpresaId, 
        @NroSerie, 
        @TipoEquipo, 
        @ClasificacionEquipo, 
        @Marca, 
        @Modelo, 
        @FechaUltimoMantenimiento, 
        @SolpeUltimoMantenimiento, 
        @InformeEstado, 
        @NroOrden, 
        @NroActivo, 
        @FIEquipo, 
        @FechaCompra, 
        @Proveedor, 
        @Monto, 
        @CostoMantenimientoRepuesto, 
        @ObservacionJefaturaCompras, 
        @DatosReparacion, 
        @EsActivo, 
        @Estado
    );

 END;
 GO;


/**************** LEER **************************/

CREATE PROCEDURE LeerInforme
AS
BEGIN
    SELECT 
            -- InformeId,
            -- UsuarioId,
            -- EmpresaId,
            NroSerie,
            TipoEquipo,
            ClasificacionEquipo,
            Marca,
            Modelo,
            FechaUltimoMantenimiento,
            SolpeUltimoMantenimiento,
            InformeEstado,
            NroOrden,
            NroActivo,
            FIEquipo,
            FechaCompra,
            Proveedor,
            Monto,
            CostoMantenimientoRepuesto,
            ObservacionJefaturaCompras,
            DatosReparacion,
            EsActivo,
            Estado
    FROM Informe; 
    WHERE InformeId = @InformeId;
END;
GO;
EXEC LeerTodosLosInformes;

/**************** EDITYAR**************************/

    CREATE PROCEDURE EditarInforme

        @NroSerie
        @TipoEquipo ,
        @ClasificacionEquipo
        @Marca
        @Modelo
        @FechaUltimoMantenimiento
        @SolpeUltimoMantenimiento,
        @InformeEstado
        @NroOrden
        @NroActivo
        @FIEquipo,
        @FechaCompra
        @Proveedor
        @Monto
        @CostoMantenimientoRepuesto
        @ObservacionJefaturaCompras
        @DatosReparacion

    AS
    BEGIN

    UPDATE Informe
    SET
        NroSerie = @NroSerie,
        TipoEquipo = @TipoEquipo,
        ClasificacionEquipo = @ClasificacionEquipo,
        Marca = @Marca,
        FechaUltimoMantenimiento = @FechaUltimoMantenimiento,
        SolpeUltimoMantenimiento = @SolpeUltimoMantenimiento,
        InformeEstado = @InformeEstado,
        NroOrden = @NroOrden,
        NroActivo = @NroActivo,
        FIEquipo = @FIEquipo,
        FechaCompra = @FechaCompra,
        Proveedor = @Proveedor,
        CostoMantenimientoRepuesto = @CostoMantenimientoRepuesto,
        ObservacionJefaturaCompras = @ObservacionJefaturaCompras,
        DatosReparacion = @DatosReparacion,
WHERE InformeId = @InformeId;
END;

/**************** ELIMINAR **************************/
  CREATE PROCEDURE EliminarInforme
      @InformeId INT   
      AS
      BEGIN 
    IF EXISTS (SELECT 1 FROM Informe WHERE InformeId = @InformeId)
    BEGIN
        DELETE FROM Informe
        WHERE InformeId = @InformeId;
    END
    ELSE
    BEGIN
        raiserror ('El registro ha sido eliminado exitosamente.',16 ,1);
    END
END;



