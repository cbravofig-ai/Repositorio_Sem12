# A5 - Limpieza y descriptivos de la CASEN en Stata
 
Actividad formativa de la Semana 12 que construye un do-file en Stata para limpiar
y describir una versión reducida de la CASEN: crea variables con generate y replace,
las etiqueta, revisa los valores perdidos y calcula descriptivos con summarize,
tabulate y correlate.
 
**Pregunta:** En esta muestra, ¿cómo se asocia el ingreso con la educación y la
experiencia? ¿Hay diferencia de ingreso entre hombres y mujeres, y de cuánto es en pesos?
 
**Respuesta:** El ingreso promedio es de $655.291. Los hombres ganan en promedio
$673.607 y las mujeres $636.296, una diferencia de unos $37.000. La educación se asocia
de forma positiva y fuerte con el ingreso (correlación de 0,68), mientras que la
experiencia casi no se asocia con él (-0,09). Sin embargo, la muestra es pequeña
(55 observaciones con ingreso) y los resultados son descriptivos, sin controles, por
lo que no deben leerse como un patrón generalizable.
 
## Datos
 
Los datos utilizados corresponden a un subconjunto de la encuesta CASEN almacenado en:
 
`data/raw/casen_reducido.csv`
 
Incluye 60 personas, con información sobre región, sector económico, años de
educación, edad, ingreso y género. La variable `ingreso` tiene 5 valores perdidos.
 
## Cómo correrlo
 
1. Abrir Stata (probado en Stata/SE 18.0) y ubicarse en la carpeta del proyecto con
   `cd "ruta/a/Repositorio_Sem12"`.
2. Ejecutar el do-file completo desde el inicio: `do scripts/tarea_a5.do`.
3. Revisar el resultado en `output/tarea_a5.log`.
## Estructura
 
```text
Repositorio_Sem12/
├── data/
│   ├── raw/
│   │   ├── casen_reducido.csv
│   │   ├── casen_sucio.csv
│   │   ├── casen_ingresos.csv
│   │   ├── ene-2026-06-mjj.csv
│   │   └── codigos-ene-2020.pdf
│   └── processed/
│       ├── casen.dta
│       ├── casen_limpio.dta
│       ├── ingresos_s12.dta
│       └── sectores_s12.dta
├── scripts/
│   ├── semana12_sesion1_guion.do
│   ├── semana12_sesion2_guion.do
│   └── tarea_a5.do
├── output/
│   ├── tarea_a5.log
│   ├── casen_s12.log
│   ├── s12s1_casen.log
│   ├── s12s1_prueba.log
│   └── casen.xlsx
├── README.md
└── .gitattributes
```
 
**Nota**: El desarrollo de la A5 se encuentra en el script `scripts/tarea_a5.do` y su
bitácora en `output/tarea_a5.log`. Cualquier otro archivo dentro de `scripts/` y
`output/` corresponde a material de apoyo utilizado durante las sesiones de clase, al
igual que los datos de `data/raw/` (salvo `casen_reducido.csv`) y `data/processed/`.
 
## Autor
 
Camila Bravo Figueroa — noviembre 2026
 
## Declaración de autoría y uso de IA
 
- Herramienta utilizada: Gemini
- Para qué la usé: Consultar la equivalencia de sintaxis de R a Stata para crear 
variables dummies lógicas, revisar cómo etiquetar valores categóricos, comprender 
la lógica matemática subyacente del valor missing (`.`) en Stata frente a comandos 
condicionales, y verificar que mi interpretación descriptiva no contradijera la 
salida final del `.log`.
- Qué hice yo: Estructuré el do-file, validé la base de datos `casen_reducido.csv` 
asegurando el uso de las variables exactas, ejecuté el código de principio a fin 
en Stata para aislar los resultados, y redacté tanto el análisis económico completo
descriptivo como la documentación del repositorio.
- Verificación: confirmo que entiendo y puedo explicar todo lo que entrego.
