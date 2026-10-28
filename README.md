# Clínica Santa María - Sistema de gestión de citas

Java 21 + Swing + MySQL, proyecto Maven.

## Requisitos
- JDK 21, Maven (o NetBeans), MySQL en `localhost:3306`

## Puesta en marcha
1. Ejecuta `script.sql` en MySQL.
2. Ajusta usuario y contraseña de MySQL en `src/main/java/dao/Conexion.java`.
3. `mvn clean package` y luego `java -jar target/ClinicaSantaMaria-1.0.jar`
   (o Run en NetBeans).

Usuarios de prueba: `admin` / `admin123` y `recep01` / `recep123`.
