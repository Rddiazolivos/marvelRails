La aplicación se encuentra en https://gentle-waters-64388.herokuapp.com
# Instrucciones de instalacion
  1. En terminal de linux ingresar al directorio del proyecto
  
  2. Ejecutar comando 'bundle'
  
  3. Ajustar la configuracion de base de datos PostgreSQL en el archivo de configuración config/database.yml con las credenciales de los usuarios correspondientes a 'development'
  
  4. Se deberan ejecutar los comandos:
  
    1. rails db:create    
    2. rails db:migrate
    3. whenever --update-crontab --set environment=development
  
  5. La aplicación se encuentra en localhost:3000