# Imagen base oficial de Go
FROM golang:1.19 as builder

# Variable de entorno para no crear archivos cache en /root
ENV GO111MODULE=on

# Carpeta de trabajo dentro del contenedor
WORKDIR /app

# Copiamos módulos
COPY go.mod go.sum ./
RUN go mod download

# Copiamos el resto del código
COPY . .

# Compilamos la aplicación
RUN go build -o /build/bin -v ./cmd/api

# ----- Fase final (ejecución) -----
FROM golang:1.19

# Creamos un directorio para el binario
WORKDIR /app
COPY --from=builder /build/bin /app

# Exponemos el puerto 3000 (donde corre la API)
EXPOSE 3000

# Comando por defecto que se ejecuta al levantar el contenedor
CMD ["/app/bin"]
