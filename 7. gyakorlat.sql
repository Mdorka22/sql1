CREATE OR ALTER View VSZOBA
as 
SELECT sz.*,
		szh.szallas_nev,
        szh.hely,
        szh.CSILLAGOK_SZAMA
From Szoba sz Join Szallashely szh on sz.SZALLAS_FK=szh.SZALLAS_ID

CREATE or ALTER PROC SPUgyfelfoglalasok
@ugyfel nvarchar(100)
as 
BEGIN
	select *
    from Foglalas
    where ugyfel_fk=@ugyfel
END

CREATE or ALTER Function UDFFerohely
(
  @fazon INT  
)
Returns int 
AS 
BEGIN
	DECLARE @ferohely int
	select @ferohely=sz.FEROHELY
    FRom Foglalas f join Szoba sz on f.SZOBA_FK=sz.SZOBA_ID
    where f.FOGLALAS_PK=@fazon
	Return @ferohely
End
