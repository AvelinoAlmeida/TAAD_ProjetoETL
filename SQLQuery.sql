create database DSA_ready

CREATE SCHEMA Integration;
GO

CREATE TABLE [Integration].[ETL_Cutoffs](
    [id] [int] IDENTITY(1,1) NOT NULL,
    [cutOff] [datetime] NULL,
    PRIMARY KEY CLUSTERED
    (
        [id] ASC
    )
);

CREATE OR ALTER PROCEDURE [Integration].[GetLastETLCutoffTime]
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    SELECT cutOff AS CutoffTime
    FROM Integration.ETL_Cutoffs
    WHERE cutOff = (SELECT MAX(cutOff)
                    FROM Integration.ETL_Cutoffs);

    RETURN 0;
END;
GO

EXEC Integration.GetLastETLCutoffTime;





