# MiCasino Devops Challenge
You can see the challenge requirements [here](docs/micasino-prueba-tecnica-devops.odt?raw=1) .

## Create .env file
Create an .env file with these paramenters
```
DB_HOST="localhost"
DB_NAME="devops"
DB_USER="postgres"
DB_PORT="5432"
DB_PASSWORD="postgres"
```

## Build Api
Build the api code by executing:
```shell
go build -o ./build/bin -v ./cmd/api
```

## Run Api
You can also run it by executing:
```shell
go run ./cmd/api
```

## Swagger docs
You can access the Swagger documentation using your browser on the port 3000. For example:
```shell
http://localhost:3000/api/v1/swagger/index.html
```

## Testing the api

### Create Users
```shell
curl -X 'POST' \
  'http://localhost:3000/api/v1/auth/signUp' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{
    "us_usuario": "pdominguez",
    "us_nombre": "pedro",
    "us_apellido": "dominguez",
    "us_correo": "correo@email.com",
    "us_clave": "clave123",
    "us_esactivo": true,
    "us_eliminado": false
}'
```
### Create Login
```shell
curl -X 'POST' \
  'http://localhost:3000/api/v1/auth/login' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{
  "password": "clave123",
  "username": "pdominguez"
}'
```

### Devops Save
```shell
curl -X 'POST' \
  'http://localhost:3000/api/v1/devops/save' \
  -H 'accept: application/json' \
  -H 'Authorization: Bearer <access token obtained on login>' \
  -H 'Content-Type: application/json' \
  -d '{ "message": "This is a test",
    "to": "Juan Perez",
    "from": "Rita Asturia",
    "timeToLifeSec": 45
}'

```
# Respuesta de Anthony Cabrera


### Componentes Principales

1. **VPC y Networking**
   - VPC dedicada (`challenge-vpc`)
   - Subred principal (`challenge-subnet`)
   - Rangos IP secundarios para pods y servicios de GKE
   - Conexión VPC peering para servicios privados

2. **GKE Cluster**
   - Cluster zonal en `us-central1-a`
   - Node pool con máquinas e2-medium
   - Integración con la VPC para networking
   - Cert Manager instalado vía Helm

3. **Base de Datos (Cloud SQL)**
   - PostgreSQL 15
   - Conexión privada a través de VPC
   - Configuración de alta disponibilidad zonal
   - Backups automáticos habilitados

4. **Redis Cache**
   - Instancia básica de Redis
   - Conexión privada mediante VPC
   - Mantenimiento programado los domingos

5. **Storage**
   - Bucket de almacenamiento con acceso uniforme
   - Ubicado en la misma región que los servicios

### Seguridad y Conectividad

- Todos los servicios están conectados a través de la VPC privada
- Las conexiones entre servicios utilizan SSL/TLS
- La base de datos y Redis son accesibles solo desde la VPC
- Cert Manager gestiona certificados TLS automáticamente

### Variables de Entorno

La configuración sensible se maneja a través de variables de entorno:
- Credenciales de base de datos
- Configuraciones de conexión
- Tokens y secretos

Para inicializar el proyecto:
1. Copiar `.env.example` a `.env`
2. Configurar las variables necesarias
3. Ejecutar `source .env` antes de aplicar Terraform


### Consideraciones

- La infraestructura está optimizada para un entorno de desarrollo/pruebas
- Los recursos están configurados con especificaciones mínimas para optimizar costos
- Se utiliza una zona única para reducir costos (en producción se recomienda multi-zona)
- Cert Manager está configurado para gestionar certificados automáticamente

## Ejecución Local del Proyecto

### Prerrequisitos
- Docker y Docker Compose instalados
- Go 1.19 o superior (solo para desarrollo)
- Make (opcional, para comandos simplificados)

### Configuración Inicial

1. **Clonar el repositorio**
```bash
git clone https://github.com/huasipango/micasino-devops-challenge.git
cd micasino-devops-challenge
```

2. **Configurar variables de entorno**
```bash
# Copiar el archivo de ejemplo
cp .env.example .env

# Editar .env con tus configuraciones
# Por defecto usa estos valores para desarrollo local:
DB_HOST="db"
DB_NAME="devops"
DB_USER="postgres"
DB_PORT="5432"
DB_PASSWORD="postgres"
```

### Ejecución con Docker Compose

1. **Construir y levantar los servicios**
```bash
docker-compose up --build
```

2. **Verificar que los servicios estén corriendo**
```bash
docker-compose ps
```

3. **Ver logs de la aplicación**
```bash
docker-compose logs -f app
```

4. **Detener los servicios**
```bash
docker-compose down
```

## CI/CD o Despliegue
La imagen Docker se publica como:
- gcr.io/micasino-devops-challenge/go-challenge-api:latest
- gcr.io/micasino-devops-challenge/go-challenge-api:{commit-sha}
