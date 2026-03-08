# React + Vite

This template provides a minimal setup to get React working in Vite with HMR and some ESLint rules.

Currently, two official plugins are available:

- [@vitejs/plugin-react](https://github.com/vitejs/vite-plugin-react/blob/main/packages/plugin-react) uses [Babel](https://babeljs.io/) (or [oxc](https://oxc.rs) when used in [rolldown-vite](https://vite.dev/guide/rolldown)) for Fast Refresh
- [@vitejs/plugin-react-swc](https://github.com/vitejs/vite-plugin-react/blob/main/packages/plugin-react-swc) uses [SWC](https://swc.rs/) for Fast Refresh

## React Compiler

The React Compiler is not enabled on this template because of its impact on dev & build performances. To add it, see [this documentation](https://react.dev/learn/react-compiler/installation).

## Expanding the ESLint configuration

If you are developing a production application, we recommend using TypeScript with type-aware lint rules enabled. Check out the [TS template](https://github.com/vitejs/vite/tree/main/packages/create-vite/template-react-ts) for information on how to integrate TypeScript and [`typescript-eslint`](https://typescript-eslint.io) in your project.

# Proyecto Cats 🐱

Aplicación web desarrollada con:
- Vite
- JavaScript
- TailwindCSS

## Instalación

1. Clonar el repositorio

git clone https://github.com/cristianyara20/cats.git

2. Entrar a la carpeta

cd cats

3. Instalar dependencias

npm install

4. Ejecutar el proyecto

npm run dev

La aplicación se ejecutará en:
http://localhost:5173



## Estructura del proyecto

/public → recursos estáticos  
/src → componentes y código principal  
index.html → página principal  
package.json → dependencias del proyecto  
vite.config.js → configuración de Vite  
tailwind.config.js → configuración de Tailwind



Repositorio:
https://github.com/cristianyara20/cats

Aplicación ejecutándose:
http://localhost:5173




# CATS - Galería de Razas de Gatos

Proyecto desarrollado en React + Vite integrado con servicios de Microsoft Azure.

## Arquitectura

El proyecto utiliza una arquitectura de tres capas:

Presentation Tier
Aplicación React ejecutándose en el navegador.

Application Tier
API backend desplegada en Azure App Service.

Data Tier
Azure SQL Database y Azure Blob Storage.

## Patrones aplicados

Component Pattern  
Repository Pattern  
Observer Pattern  

## Principios SOLID

S - Single Responsibility  
Cada componente tiene una sola responsabilidad.

O - Open Closed  
Los componentes reciben props y pueden extenderse sin modificar su código.

D - Dependency Inversion  
Los servicios abstraen la fuente de datos.

## CI/CD

Se utiliza GitHub Actions para automatizar el build y despliegue.

## Tecnologías

React  
Vite  
Tailwind CSS  
Azure Blob Storage  
Azure SQL Database  
GitHub Actions
