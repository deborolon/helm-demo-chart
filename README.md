# Demo Chart - Helm NGINX Deployment

Helm Chart personalizado para desplegar NGINX con configuraciones parametrizables.

## Prerrequisitos

-   [**Docker Desktop con Kubernetes habilitado**](https://docs.docker.com/desktop/features/kubernetes/)
-   **Helm 3.x** instalado
-   **kubectl** configurado para conectar al cluster

### Verificar prerrequisitos

```bash
# Verificar que Kubernetes esté funcionando
kubectl cluster-info

# Versión de Helm
helm version

```

## Instalación

### 1. Clonar el repositorio

```bash
git clone https://github.com/deborolon/helm-demo-chart.git
cd helm-demo-chart

```

### 2. Validar el Chart

Antes de instalar, validar que el chart esté correctamente estructurado:

```bash
# Validar sintaxis y estructura del chart
helm lint ./demo-chart
```

### 3. Instalación con valores por defecto

```bash
# Se instala el chart con configuración por defecto
helm install demo-nginx ./demo-chart

# Verificar el estado de la instalación
helm status demo-nginx

# Ver los pods creados
kubectl get pods

```

## Configuración personalizada


### Valores configurables

  
El chart permite personalizar los siguientes valores en `values.yaml`:

  

| Parámetro | Descripción | Valor por defecto |
|-----------|-------------|-------------------|
| `image.repository` | Repositorio de la imagen | `nginx` |
| `image.tag` | Tag de la imagen | `alpine` |
| `image.pullPolicy` | Política de descarga de imagen | `IfNotPresent` |
| `replicaCount` | Número de réplicas | `2` |
| `service.type` | Tipo de servicio (ClusterIP/NodePort/LoadBalancer) | `ClusterIP` |
| `service.port` | Puerto del servicio | `80` |
| `ingress.enabled` | Habilitar Ingress | `false` |
| `ingress.host` | Host del Ingress | `demo.local` |


### Archivo de valores personalizado

Crear un archivo `my-values.yaml`:

```yaml
# my-values.yaml
image:
  repository: nginx
  tag: "1.21"
  pullPolicy: IfNotPresent

replicaCount: 3

service:
  type: LoadBalancer
  port: 80

ingress:
  enabled: true
  host: demo.local

```

### Instalación con valores personalizados

```bash
# Instalar con archivo de valores personalizado
helm install demo-nginx ./demo-chart -f my-values.yaml

# Para sobreescribir valores específicos desde línea de comandos
helm install demo-nginx ./demo-chart --set replicaCount=3 --set service.type=NodePort

```

## Comandos útiles para pruebas

### Gestión del release

```bash
# Listar todos los releases
helm list

# Ver el estado detallado
helm status demo-nginx

# Actualizar el release con nuevos valores
helm upgrade demo-nginx ./demo-chart -f my-values.yaml

# Desinstalar el release
helm uninstall demo-nginx

```

## Acceso a la aplicación

### Acceso local con Ingress

Si tienes el Ingress habilitado con `demo.local`:

1.  **Agregar entrada al archivo hosts**:
    
    ```bash    
    # En Windows (como Administrador)
    echo 127.0.0.1 demo.local >> C:\Windows\System32\drivers\etc\hosts
    
    ```
    
2.  **Verificar que el Ingress Controller esté funcionando**:
    
    ```bash
    kubectl get pods -n ingress-nginx  # Para nginx-ingress    
    ```
    
3.  **Acceder a la aplicación**:
    
    ```
    http://demo.local
    ```
    

### Acceso sin Ingress

#### Con ClusterIP (port-forward)

```bash
kubectl port-forward service/demo-nginx-demo-chart 8080:80
# Acceder en: http://localhost:8080

```

#### Con NodePort

```bash
# Obtener el puerto asignado
kubectl get service demo-nginx-demo-chart
# Acceder en: http://localhost:<NODEPORT>

```

#### Con LoadBalancer

```bash
# Obtener la IP externa (puede tardar unos minutos)
kubectl get service demo-nginx-demo-chart
# Acceder usando la EXTERNAL-IP

```

    

### Limpieza completa

```bash
# Desinstalar el release
helm uninstall demo-nginx
```
