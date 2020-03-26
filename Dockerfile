FROM node:10
# Imagen de platziapp

# si edito algun archivo de este contexto el npm install
# debera ejecutarse de nuevo pues se vio afectado
COPY ["package.json", "package-lock.json", "/usr/src/"]

WORKDIR /usr/src

RUN npm install


# copia el resto de los archivos faltantes
# al hacer que los archivos que edito constantemente
# no afecten el npm install
# me ahorro tener que descargar las dependecias desde 0
# cada vez que ejecuto el proyecto
COPY [".", "/usr/src/"]

EXPOSE 3000

CMD ["npx", "nodemon", "index.js"]
