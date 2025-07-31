# Despliegue de Helm Chart con Terraform

## Prerrequisitos

### Instalación de Terraform en Windows con Chocolatey

#### 1. Instalar Chocolatey

1.  Abre PowerShell como **Administrador**
2.  Ejecuta el siguiente comando para verificar la política de ejecución:
    
    ```powershell
    Get-ExecutionPolicy
    ```
    
3.  Si la política es `Restricted`, cámbiala temporalmente:
    
    ```powershell
    Set-ExecutionPolicy AllSigned
    ```
    
4.  Instala Chocolatey:
    
    ```powershell
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    ```
    

#### 2. Instalar Terraform

Una vez que tengas Chocolatey instalado:

```powershell
choco install terraform
```

#### 3. Verificar la instalación

```powershell
terraform --version
```

## Estructura del proyecto

```
proyecto-terraform/
├── README.md
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
└── .gitignore
```

## Paso a paso

### 1. Preparación del entorno

1.  Clona o descarga este repositorio
2.  Abre una terminal en el directorio del proyecto

### 2. Inicialización

```bash
terraform init
```

### 3. Planificación

```bash
terraform plan
```

### 4. Aplicación

```bash
terraform apply
```

### 5. Limpieza

```bash
terraform destroy
```
