* ============================================================
* A5 — Limpieza y descriptivos de CASEN
* Autor: Camila Bravo Figueroa      Fecha: 17-11-2026
* ============================================================

clear all
set more off
capture mkdir "output"
capture log close
log using "output/tarea_a5.log", replace text

* 2. Carga los datos
* ------------------------------------------------------------
import delimited "data/raw/casen_reducido.csv", clear varnames(1) encoding("utf-8")
describe
summarize

* 3. Crea variables con generate y replace
* ------------------------------------------------------------
* Experiencia potencial de Mincer
generate experiencia = max(edad - educ - 6, 0)

* Indicadora: Mujer
generate mujer = (genero == "F")

* Indicadora: Alta educación para usar el comando replace
generate alta_educ = 0
replace alta_educ = 1 if educ >= 13

* 4. Etiqueta (la cultura de Stata)
* ------------------------------------------------------------
label variable experiencia "Experiencia potencial (años)"
label variable mujer "Mujer"
label variable alta_educ "Educación superior (13+ años)"

* Etiquetar valores (Recomendado por la pauta)
label define lbl_mujer 0 "Hombre" 1 "Mujer"
label values mujer lbl_mujer

* 5. Cuidado con los missing
* ------------------------------------------------------------
* Demostración empírica del gotcha de Stata
count if ingreso > 500000
count if ingreso > 500000 & !missing(ingreso)

/* COMENTARIO SOBRE LOS MISSING:
¿Por qué summarize ingreso no se equivoca, pero count if sí?
El comando summarize ignora automáticamente los valores perdidos al hacer cálculos. En cambio, count se equivoca porque Stata trata el valor missing (.) como el infinito positivo. Al correr count if ingreso > 500000 cuenta 46 casos, 
incluyendo los 5 missing. La forma correcta excluye los faltantes 
(& !missing(ingreso)), dando el valor real de 41 casos.
*/

* 6. Descriptivos
* ------------------------------------------------------------
summarize edad educ experiencia ingreso
tabulate sector
tabulate mujer

* Cruce requerido por grupo
summarize ingreso if mujer == 0
summarize ingreso if mujer == 1

correlate ingreso educ experiencia

* Guardar en scalar la media
summarize ingreso
scalar media_ingreso = r(mean)
display "La media del ingreso en la muestra es de $" media_ingreso

* 7. Cierra la bitácora e interpreta
* ------------------------------------------------------------
log close

/* INTERPRETACIÓN DESCRIPTIVA:
Los resultados muestran que el ingreso promedio asciende a $655.291. Al analizar por 
género, el ingreso promedio de los hombres ($673.607) es levemente superior al de 
las mujeres ($636.296). Existe una asociación positiva y fuerte (0,68) entre educación 
e ingreso. Sin embargo, en esta muestra reducida, la experiencia muestra una asociación 
prácticamente nula y negativa (-0,09) con el ingreso, alejándose preliminarmente de la 
relación de Mincer. Finalmente, el sector Servicios concentra la mayor cantidad 
de observaciones (28,3%).
*/