# Proyecto S2-IAC: Infraestructura como Código Multientorno

Este laboratorio implementa una arquitectura de tres capas (Frontend, Backend y Base de Datos) utilizando Terraform y Docker.

La solución permite desplegar ambientes aislados mediante Workspaces, gestionando puertos y configuraciones dinámicamente según el entorno.

## Arquitectura

La aplicación sigue una estructura de 3 capas:

- Frontend: Servido con Nginx  
- Backend: API desarrollada en Node.js  
- Base de Datos: PostgreSQL  

Cada servicio se ejecuta en su propio contenedor Docker y es gestionado mediante Terraform.

## Estructura de Carpetas

S2-IAC/
├── iac/ # Archivos de configuración de Terraform (.tf)
└── src/
└── lab/
├── api/ # Backend Node.js y Dockerfile
├── bd/ # Configuración Postgres y Dockerfile
└── web/ # Frontend Nginx y Dockerfile


## Requisitos Previos

- Docker Desktop en ejecución  
- Terraform instalado y configurado en el PATH  
- Git para control de versiones  

## Guía de Despliegue

### 1. Construcción de Imágenes Locales

Antes de ejecutar Terraform, es necesario construir las imágenes Docker localmente:

```bash
# Desde la raíz del proyecto (S2-IAC)

cd src/lab/web
docker build -t lab/web .

cd ../api
docker build -t lab/api .

cd ../bd
docker build -t lab/bd .

cd ../../../iac
terraform init

cd ../../../iac
terraform init

# Crear workspace (solo la primera vez)
terraform workspace new localhost

# Seleccionar y aplicar
terraform workspace select localhost
terraform apply

# Crear workspace (solo la primera vez)
terraform workspace new dev

# Seleccionar y aplicar
terraform workspace select dev
terraform apply

```

Mapeo de Infraestructura
Servicio	Imagen	Puerto Localhost	Puerto Dev	Puerto Interno
Frontend	lab/web	4001	5001	80
Backend	lab/api	4002	5002	3000
Base de Datos	lab/bd	4003	5003	5432
Estándar de Commits (Conventional Commits)
feat: Nueva funcionalidad
Ej: feat(iac): agregar contenedor bd
fix: Corrección de errores
Ej: fix(web): corregir ruta en el dockerfile
chore: Tareas de mantenimiento
Ej: chore: inicializar repositorio
refactor: Mejora interna sin cambiar funcionalidad
Ej: refactor(bd): mover secretos a variables de entorno
Seguridad y Buenas Prácticas
Aislamiento:
Los archivos .tfvars y carpetas .terraform están excluidos del control de versiones mediante .gitignore.
Gestión de secretos:
Las credenciales de la base de datos se inyectan dinámicamente mediante variables de entorno en el recurso docker_container, evitando contraseñas expuestas en los Dockerfiles.
Notas Finales
Cada workspace mantiene su propio estado independiente.
La asignación de puertos evita conflictos entre entornos.
Terraform permite reproducibilidad y escalabilidad de la infraestructura.