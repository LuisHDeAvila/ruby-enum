# WebScrapping con Ruby
aqui subire algunos ejercicios de web scraping usando ruby y algunas de sus gemas, como:

```
  nokogiri
  net/http
  httparty
  uri
```
## Introduccion
El web scrapping es usado para extraer informacion relevante de un sitio web.

El objetivo es crear un flujo semi-automatizado para obtencion de datos, para su procesamiento e interpretacion y sirvan como apoyo en la toma de decisiones.

los datos de los que se habla en ciencia de datos, equivalen a los eventos en la programacion comun. un evento es un suceso tan importante que provoca un cambio de estado. ejemplo cerrar sesion, cambia mi estado a inactivo, e iniciar sesion me hace estar en estado disponible.

https://archive.org/services/docs/api/


## Instalacion
por el momento dejare las intrucciones para instalar en linux.
```
  cd web_scrapping
  gem install nokogiri
  gem install httparty
```

## Uso
```
  # en el directorio web_scrapping
  ruby scraper_[name].rb
```
### ejemplo
```
  cd web_scrapping
  gem install nokogiri httparty
  chmod +x scraper_deapisweb.rb
  ./scraper_deapisweb.rb
```
### Obtendras un gran array de datos por consola.
el scraper Apis, el scraper patterns y los net-scrappers para redes sociales y datos estadisticos *ya estan terminados.*

```
  ...
  {
        "id": "14",
        "name": "Channel Messaging API",
        "descripcion": ...
```
### Accesibilidad
Encontraras en el directorio scripts un traductor de linea de comandos. Es una herramienta que suelo usar para traducir (cualquier idioma) a castellano.
```
  # requiere: translate-shell
  chmod +x scripts/traductor
  ./scripts/traductor
```


## herramientas que pueden ayudar durante el webscraping
REGex
Xpath
string.Index
Nokogiri

## comentarios
Ruby es un lenguaje que esta orientado a ser mas amigable con el programador, que con la maquina, y por este motivo lo recomiendo para desarrollar pruebas de concepto.

Una vez obtenidos los resultados esperados por tu hipotesis, ya puedes pasar a desarrollar programas con lenguajes mas especificos del entorno en donde se van a aplicar dichos programas. 

Este repositorio esta hecho de pruebas de concepto para modelos de extraccion y estructuracion de datos, comunmente esta practica entra en el dominio de mineria de datos.