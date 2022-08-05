# WebScrapping sobre sitios estaticos con Ruby
gemas usadas:
```
  nokogiri
  net/http
  httparty
  uri
```

potencial fuente de datos:
https://archive.org/services/docs/api/

## Instalacion
Entorno: Linux
```
  cd web_scrapping
  gem install nokogiri
  gem install httparty
```

## Uso
**name** indica el nombre del scraper que se quiere ejecutar.
```
  # directorio web_scrapping
  ruby scraper_[name].rb
  
  # alternativo
  chmod +x scraper_[name].rb
  ./scraper_[name].rb
```

### ejemplo
```
  cd web_scrapping
  gem install nokogiri httparty
  chmod +x scraper_deapisweb.rb
  ./scraper_deapisweb.rb
```
### Obtendras un gran array de datos por consola.
el scraper Apis, el scraper patterns y los net-scrappers para redes sociales y datos estadisticos *ya estan terminados* y estructurados en arreglos simples.

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
  # requiere instalar: translate-shell
  chmod +x scripts/traductor
  ./scripts/traductor [fichero]
```


## herramientas que pueden ayudar durante el webscraping
REGex
Xpath
