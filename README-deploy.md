# Deploy de Proyectos

Los proyectos deben instalarse idealmente en un usuario específico del proyecto para mantenerlo aislado e independiente de los otros que se encuentren en los servicios. Esto reduce los puntos de error, mejora la seguridad y permite escalar o migrar de manera más expedita en caso de ser necesario.

# Creación de un usuario

Desde un usuario con permisos de root:

```
$ sudo useradd user
$ sudo passwd user
```

# Estructura interna usuario

Necesitamos primero permitir a nginx entrar al directorio del usuario. Desde el usuario recién creado:

```
$ usermod -a -G user nginx
$ chmod 750 ~
```

En caso de no haber creado una llave ssh, crearla para poder ingresarla a nuestro gitlab. Dejar sin clave y los valores por defecto ya que es una llave sin permisos de escritura.

```
$ ssh-keygen
$ cat ~/.ssh/id_rsa.pub
```

Para montar el proyecto, usaremos la siguiente estructura:

```
/home
  ∟ /user
    ∟ /sites
      ∟ /proyecto.domain
        ∟ /wsdlcache
        ∟ /session
        ∟ /logs
        ∟ /www
```

El proyecto debe ir clonado en ```~/sites/proyecto-domain/www```. Para crear la estructura usamos la siguiente:

```
$ cd ~/
$ mkdir sites
$ cd sites
$ mkdir proyecto.domain
$ cd proyecto.domain
$ mkdir wsdlcache
$ mkdir session
$ mkdir logs
$ git clone git://code.wktapp.com/group/repo-proyecto www 
```

# Configuración nginx

El proyecto debe tener su propio archivo de configuración para nginx

# Configuracion php-fpm

El proyecto debe tener su propio archivo de configuracion para un pool de php-fpm
