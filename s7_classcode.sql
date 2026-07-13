-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 13-07-2026 a las 20:51:01
-- Versión del servidor: 8.0.46
-- Versión de PHP: 8.5.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `s7_classcode`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificaciones`
--

CREATE TABLE `calificaciones` (
  `id_calificacion` int NOT NULL,
  `id_usuario` int NOT NULL,
  `id_modulo` int NOT NULL,
  `calificacion` int NOT NULL,
  `aprobado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `calificaciones`
--

INSERT INTO `calificaciones` (`id_calificacion`, `id_usuario`, `id_modulo`, `calificacion`, `aprobado`) VALUES
(3, 7, 29, 100, 1),
(4, 7, 30, 100, 1),
(6, 7, 31, 100, 1),
(7, 12, 29, 10, 1),
(8, 13, 29, 9, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `id_curso` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `modulos` int NOT NULL,
  `estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`id_curso`, `nombre`, `descripcion`, `modulos`, `estado`) VALUES
(1, 'POO', 'Programar', 4, 'inactivo'),
(2, 'fefe', 'gfshgfh', 5, 'inactivo'),
(3, 'Progt', 'gfhfhg', 3, 'inactivo'),
(4, 'frdgdfg', 'dfsdf', 5, 'inactivo'),
(5, 'Itsuki la mejora', 'Poruqe itsuki nakano es la mejor quintilliza', 3, 'inactivo'),
(6, 'Inglés', 'Aprende inglés nivel basico', 3, 'inactivo'),
(7, 'Matematica', 'Aprende de las matermaticas de...', 2, 'inactivo'),
(8, 'Matematica', 'matemattizar', 3, 'inactivo'),
(101, 'Programacion Basica', 'Curso inicial para entender variables, decisiones y funciones.', 3, 'inactivo'),
(102, 'Base de Datos', 'Curso para aprender tablas, consultas SQL y relaciones.', 3, 'inactivo'),
(103, 'POO con C++', 'Curso para practicar clases, constructores, herencia y polimorfismo.', 3, 'inactivo'),
(104, 'Ingles: Comunicacion y Gramatica', 'Curso practico de ingles para comprender estructuras basicas, hablar sobre rutinas y desenvolverse en situaciones cotidianas.', 3, 'activo'),
(105, 'Literatura y Analisis de Textos', 'Curso para reconocer generos literarios, analizar recursos expresivos e interpretar textos mediante argumentos y evidencias.', 3, 'activo'),
(106, 'Programacion en C++', 'Curso de C++ desde variables y control de flujo hasta funciones, colecciones y los fundamentos de la programacion orientada a objetos.', 3, 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entregas`
--

CREATE TABLE `entregas` (
  `id_entrega` int NOT NULL,
  `id_usuario` int NOT NULL,
  `id_curso` int NOT NULL,
  `numero_modulo` int NOT NULL,
  `respuesta` text NOT NULL,
  `estado` varchar(20) NOT NULL,
  `devolucion` text,
  `fecha_entrega` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `entregas`
--

INSERT INTO `entregas` (`id_entrega`, `id_usuario`, `id_curso`, `numero_modulo`, `respuesta`, `estado`, `devolucion`, `fecha_entrega`) VALUES
(1, 7, 1, 1, 'FJDGHSJHGKSDLGKDGJKND;M', 'pendiente', '', '2026-07-07 00:39:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripciones`
--

CREATE TABLE `inscripciones` (
  `id_inscripcion` int NOT NULL,
  `id_usuario` int NOT NULL,
  `id_curso` int NOT NULL,
  `estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `inscripciones`
--

INSERT INTO `inscripciones` (`id_inscripcion`, `id_usuario`, `id_curso`, `estado`) VALUES
(1, 3, 1, 'activa'),
(2, 3, 2, 'activa'),
(4, 2, 2, 'activa'),
(5, 4, 3, 'activa'),
(6, 3, 4, 'activa'),
(7, 6, 2, 'activa'),
(8, 6, 5, 'activa'),
(11, 7, 1, 'activa'),
(12, 7, 6, 'activa'),
(13, 7, 7, 'activa'),
(15, 10, 6, 'activa'),
(16, 7, 8, 'activa'),
(18, 11, 6, 'activa'),
(19, 11, 8, 'activa'),
(21, 2, 101, 'activa'),
(22, 2, 102, 'activa'),
(23, 2, 103, 'activa'),
(24, 7, 101, 'activa'),
(34, 7, 103, 'activa'),
(35, 7, 102, 'activa'),
(91, 12, 101, 'activa'),
(92, 13, 101, 'activa'),
(96, 13, 103, 'activa'),
(97, 13, 104, 'activa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `intentos_evaluacion_multiple_choice`
--

CREATE TABLE `intentos_evaluacion_multiple_choice` (
  `id_intento` int NOT NULL,
  `id_usuario` int NOT NULL,
  `id_modulo` int NOT NULL,
  `intentos_desaprobados` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulos`
--

CREATE TABLE `modulos` (
  `id_modulo` int NOT NULL,
  `id_curso` int NOT NULL,
  `numero_modulo` int NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `informacion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `modulos`
--

INSERT INTO `modulos` (`id_modulo`, `id_curso`, `numero_modulo`, `titulo`, `informacion`) VALUES
(1, 1, 1, 'efdf', 'dsfsdf'),
(2, 1, 2, 'C++', 'C++ es un lenguaje de programación que...'),
(3, 1, 3, 'Clases', 'Las clases son...'),
(4, 1, 4, 'Herencias', 'Las herencias son...'),
(5, 2, 1, 'Módulo 1', 'Información pendiente de cargar.'),
(6, 2, 2, 'Módulo 2', 'Información pendiente de cargar.'),
(7, 2, 3, 'Módulo 3', 'Información pendiente de cargar.'),
(8, 2, 4, 'Módulo 4', 'Información pendiente de cargar.'),
(9, 2, 5, 'Módulo 5', 'Información pendiente de cargar.'),
(10, 3, 1, 'Módulo 1', 'Información pendiente de cargar.'),
(11, 3, 2, 'Módulo 2', 'Información pendiente de cargar.'),
(12, 3, 3, 'Módulo 3', 'Información pendiente de cargar.'),
(13, 4, 1, 'Módulo 1', 'Información pendiente de cargar.'),
(14, 4, 2, 'Módulo 2', 'Información pendiente de cargar.'),
(15, 4, 3, 'deter', 'sdfsdf'),
(16, 4, 4, 'Módulo 4', 'Información pendiente de cargar.'),
(17, 4, 5, 'Módulo 5', 'Información pendiente de cargar.'),
(18, 5, 1, 'Itsuki the best', 'itsuki > Yotsuba'),
(19, 5, 2, 'lol', 'cine puro'),
(20, 5, 3, 'lol cine', 'Itsuki Debio ganar\n'),
(21, 6, 1, 'Los verbos', 'Los verbos son...'),
(22, 6, 2, 'Eso', 'Orbit and Rotation\nJupiter has the shortest day in the solar system. One day on Jupiter takes 9.9 hours (the time it takes for Jupiter to rotate or spin around once), and Jupiter makes a complete orbit around the Sun (a year in Jovian time) in about 12 Earth years (4,333 Earth days).\n\nIts equator is tilted with respect to its orbital path around the Sun by just 3 degrees. This means Jupiter spins nearly upright and does not have seasons as extreme as other planets do.\n\nMoons\nWith four large moons and many smaller moons, Jupiter forms a kind of miniature solar system.\n\nJupiter has 95 moons that are officially recognized by the International Astronomical Union. The four largest moons – Io, Europa, Ganymede, and Callisto – were first observed by the astronomer Galileo Galilei in 1610 using an early versión of the telescope. These four moons are known today as the Galilean satellites, and they\'re some of the most fascinating destinations in our solar system.\n\nIo is the most volcanically active body in the solar system. Ganymede is the largest moon in the solar system (even bigger than the planet Mercury). Callisto’s very few small craters indicate a small degree of current surface activity. A liquid-water ocean with the ingredients for life may lie beneath the frozen crust of Europa, the target of NASA\'s Europa Clipper mission slated to launch in 2024.\n\n› More on Jupiter\'s Moons\n\nRings\nDiscovered in 1979 by NASA\'s Voyager 1 spacecraft, Jupiter\'s rings were a surprise. The rings are composed of small, dark particles, and they are difficult to see except when backlit by the Sun. Data from the Galileo spacecraft indicate that Jupiter\'s ring system may be formed by dust kicked up as interplanetary meteoroids smash into the giant planet\'s small innermost moons.\n\nFormation\nJupiter took shape along with rest of the solar system about 4.6 billion years ago. Gravity pulled swirling gas and dust together to form this gas giant. Jupiter took most of the mass left over after the formation of the Sun, ending up with more than twice the combined material of the other bodies in the solar system. In fact, Jupiter has the same ingredients as a star, but it did not grow massive enough to ignite.\n\nAbout 4 billion years ago, Jupiter settled into its current position in the outer solar system, where it is the fifth planet from the Sun.\n\nStructure\nThe composition of Jupiter is similar to that of the Sun – mostly hydrogen and helium. Deep in the atmosphere, pressure and temperature increase, compressing the hydrogen gas into a liquid. This gives Jupiter the largest ocean in the solar system – an ocean made of hydrogen instead of water. Scientists think that, at depths perhaps halfway to the planet\'s center, the pressure becomes so great that electrons are squeezed off the hydrogen atoms, making the liquid electrically conducting like metal. Jupiter\'s fast rotation is thought to drive electrical currents in this region, with the spinning of the liquid metallic hydrogen acting like a dynamo, generating the planet\'s powerful magnetic field.\n\nDeeper down, Jupiter\'s central core had long been a mystery. Scientists theorized Jupiter was a mostly homogeneous mix of hydrogen and helium gases, surrounding a small, solid core of heavier elements – ice, rock, and metal formed from debris and small objects swirling around that area of the embryonic solar system 4 billion years ago.\n\nNASA’s Juno spacecraft, measuring Jupiter’s gravity and magnetic field, found data suggesting the core is much larger than expected, and not solid. Instead, it’s partially dissolved, with no clear separation from the metallic hydrogen around it, leading researchers to describe the core as dilute, or “fuzzy.”\n\nSurface\nAs a gas giant, Jupiter doesn’t have a true surface. The planet is mostly swirling gases and liquids. While a spacecraft would have nowhere to land on Jupiter, it wouldn’t be able to fly through unscathed either. The extreme pressures and temperatures deep inside the planet crush, melt, and vaporize spacecraft trying to fly into the planet.\n\nAtmosphere\nJupiter\'s appearance is a tapestry of colorful stripes and spots – the cloud bands that encircle the planet, and the cyclonic storms dotting it from pole to pole. The gas planet likely has three distinct cloud layers in its \"skies\" that, taken together, span about 44 miles (71 kilometers). The top cloud is probably made of ammonia ice, while the middle layer is likely made of ammonium hydrosulfide crystals. The innermost layer may be made of water ice and vapor.\n\nThe vivid colors you see in thick bands across Jupiter may be plumes of sulfur and phosphorus-containing gases rising from the planet\'s warmer interior. Jupiter\'s fast rotation – spinning once every 10 hours – creates strong jet streams, separating its clouds into dark belts and bright zones across long stretches.\n\nWith no solid surface to slow them down, Jupiter\'s spots can persist for many years. Stormy Jupiter is swept by over a dozen prevailing winds, some reaching up to 335 miles per hour (539 kilometers per hour) at the equator. The Great Red Spot, a swirling oval of clouds twice as wide as Earth, has been observed on the giant planet for more than 300 years. More recently, three smaller ovals merged to form the Little Red Spot, about half the size of its larger cousin.\n\nFindings from NASA’s Juno probe released in October 2021 provide a fuller picture of what’s going on below those clouds. Data from Juno shows that Jupiter’s cyclones are warmer on top, with lower atmospheric densities, while they are colder at the bottom, with higher densities. Anticyclones, which rotate in the opposite direction, are colder at the top but warmer at the bottom.\n\nThe findings also indicate these storms are far taller than expected, with some extending 60 miles (100 kilometers) below the cloud tops and others, including the Great Red Spot, extending over 200 miles (350 kilometers). This surprising discovery demonstrates that the vortices cover regions beyond those where water condenses and clouds form, below the depth where sunlight warms the atmosphere.\n\nThe height and size of the Great Red Spot mean the concentration of atmospheric mass within the storm potentially could be detectable by instruments studying Jupiter’s gravity field. Two close Juno flybys over Jupiter’s most famous spot provided the opportunity to search for the storm’s gravity signature and complement the other results on its depth.\n\nWith their gravity data, the Juno team was able to constrain the extent of the Great Red Spot to a depth of about 300 miles (500 kilometers) below the cloud tops.\n\nBelts and Zones In addition to cyclones and anticyclones, Jupiter is known for its distinctive belts and zones – white and reddish bands of clouds that wrap around the planet. Strong east-west winds moving in opposite directions separate the bands. Juno previously discovered that these winds, or jet streams, reach depths of about 2,000 miles (roughly 3,200 kilometers). Researchers are still trying to solve the mystery of how the jet streams form. Data collected by Juno during multiple passes reveal one possible clue: that the atmosphere’s ammonia gas travels up and down in remarkable alignment with the observed jet streams.\n\nJuno’s data also shows that the belts and zones undergo a transition around 40 miles (65 kilometers) beneath Jupiter’s water clouds. At shallow depths, Jupiter’s belts are brighter in microwave light than the neighboring zones. But at deeper levels, below the water clouds, the opposite is true – which reveals a similarity to our oceans.\n\nPolar Cyclones Juno previously discovered polygonal arrangements of giant cyclonic storms at both of Jupiter’s poles – eight arranged in an octagonal pattern in the north and five arranged in a pentagonal pattern in the south. Over time, mission scientists determined these atmospheric phenomena are extremely resilient, remaining in the same location.\n\nJuno data also indicates that, like hurricanes on Earth, these cyclones want to move poleward, but cyclones located at the center of each pole push them back. This balance explains where the cyclones reside and the different numbers at each pole.\n\nMagnetosphere\nThe Jovian magnetosphere is the region of space influenced by Jupiter\'s powerful magnetic field. It balloons 600,000 to 2 million miles (1 to 3 million kilometers) toward the Sun (seven to 21 times the diameter of Jupiter itself) and tapers into a tadpole-shaped tail extending more than 600 million miles (1 billion kilometers) behind Jupiter, as far as Saturn\'s orbit. Jupiter\'s enormous magnetic field is 16 to 54 times as powerful as that of the Earth. It rotates with the planet and sweeps up particles that have an electric charge. Near the planet, the magnetic field traps swarms of charged particles and accelerates them to very high energies, creating intense radiation that bombards the innermost moons and can damage spacecraft.\n\nJupiter\'s magnetic field also causes some of the solar system\'s most spectacular aurorae at the planet\'s poles.'),
(23, 6, 3, 'Módulo 3', 'Información pendiente de cargar.'),
(24, 7, 1, 'Algebra', 'La algebrta de...'),
(25, 7, 2, 'Módulo 2', 'Información pendiente de cargar.'),
(26, 8, 1, 'los vernos', 'fdfdfghedf'),
(27, 8, 2, 'Módulo 2', 'Información pendiente de cargar.'),
(28, 8, 3, 'cdscs', 'vfvxvcdfv'),
(29, 101, 1, 'Variables y tipos de datos', 'Una variable guarda un valor para usarlo despues. En C++ se indica el tipo: int para enteros, double para decimales, QString para texto y bool para verdadero o falso.'),
(30, 101, 2, 'Condicionales', 'Los condicionales permiten tomar decisiones. Con if se ejecuta codigo solo cuando una condicion se cumple. Con else se indica que hacer cuando no se cumple.'),
(31, 101, 3, 'Funciones', 'Una funcion agrupa instrucciones que realizan una tarea. Puede recibir parametros y devolver un resultado. Usar funciones evita repetir codigo.'),
(32, 102, 1, 'Tablas y registros', 'Una base de datos organiza informacion en tablas. Cada tabla tiene columnas y filas. Una fila representa un registro, por ejemplo un curso o un usuario.'),
(33, 102, 2, 'Consultas SELECT', 'SELECT permite leer datos de una tabla. Se puede usar WHERE para filtrar, ORDER BY para ordenar y JOIN para combinar informacion de varias tablas relacionadas.'),
(34, 102, 3, 'Relaciones entre tablas', 'Las relaciones conectan tablas usando claves. Una clave foranea apunta a la clave primaria de otra tabla.'),
(35, 103, 1, 'Clases y objetos', 'Una clase es un molde que define atributos y metodos. Un objeto es una instancia concreta de esa clase.'),
(36, 103, 2, 'Constructores y encapsulamiento', 'El constructor inicializa un objeto con valores validos. El encapsulamiento protege los atributos privados y permite leerlos con getters.'),
(37, 103, 3, 'Herencia y polimorfismo', 'La herencia permite crear una clase hija a partir de una clase base. El polimorfismo permite ejecutar metodos sobrescritos desde una referencia general.'),
(270, 104, 1, 'Fundamentos del idioma', 'Este modulo presenta la estructura basica de una oracion en ingles. El orden mas frecuente es sujeto, verbo y complemento: I study English. Los pronombres personales reemplazan nombres: I, you, he, she, it, we y they. El verbo to be cambia segun el sujeto: I am, you are, he is. En negativo se agrega not y en preguntas se coloca el verbo antes del sujeto.\r\n\r\nTambien se trabajan los articulos a, an y the. A se usa antes de un sonido consonante, an antes de un sonido vocal y the cuando hablamos de algo especifico. Los sustantivos suelen formar el plural con s o es, aunque existen formas irregulares como child/children y person/people. Los adjetivos se colocan normalmente antes del sustantivo y no cambian en plural.\r\n\r\nAl finalizar, el estudiante puede presentarse, describir personas y objetos, indicar nacionalidad y profesion, y formular preguntas simples. Es importante practicar pronunciacion, reconocer contracciones como I\'m, you\'re y isn\'t, y leer ejemplos en voz alta para relacionar la forma escrita con el sonido.'),
(271, 104, 2, 'Presente simple y rutinas', 'El presente simple se utiliza para hablar de habitos, rutinas, gustos y hechos generales. Con I, you, we y they se usa la forma base del verbo: We study every day. Con he, she e it normalmente se agrega s o es: She studies every day. Algunas terminaciones cambian, por ejemplo study se convierte en studies y go en goes.\r\n\r\nPara negar se usan do not o does not, generalmente en sus contracciones don\'t y doesn\'t. Despues de does o doesn\'t el verbo vuelve a su forma base: He doesn\'t work, no he doesn\'t works. Las preguntas se forman con Do o Does al principio: Do you play football? Does she live here? Las respuestas cortas mantienen el auxiliar: Yes, she does; No, she doesn\'t.\r\n\r\nLos adverbios de frecuencia, como always, usually, often, sometimes y never, indican con que frecuencia ocurre una accion. Suelen colocarse antes del verbo principal, pero despues del verbo to be. Tambien se practican expresiones de tiempo y las preposiciones at, on e in: at 8 o\'clock, on Monday, in the morning. Este modulo permite describir un dia completo y preguntar por las costumbres de otras personas.'),
(272, 104, 3, 'Comunicacion en situaciones cotidianas', 'Este modulo integra recursos para desenvolverse en conversaciones cotidianas. El pasado simple permite narrar acciones terminadas. Los verbos regulares agregan ed, como worked o visited, mientras que los irregulares cambian de forma, como go/went y see/saw. Para preguntas y negaciones se usa did y el verbo vuelve a la forma base: Did you travel? I didn\'t travel.\r\n\r\nPara hablar del futuro se practica be going to cuando existe un plan o una intencion y will para decisiones espontaneas, predicciones y ofrecimientos. Los verbos modales can y could expresan capacidad o pedidos; despues de ellos siempre se utiliza el verbo base. Las estructuras there is y there are sirven para describir lugares y distinguir singular de plural.\r\n\r\nSe incluyen situaciones de viaje, compras, restaurante y pedidos de informacion. Una estrategia importante es identificar palabras clave, observar el contexto y pedir aclaracion con expresiones como Could you repeat that, please? o What does this word mean? El objetivo no es traducir palabra por palabra, sino comprender la idea principal y responder de manera clara y adecuada.'),
(273, 105, 1, 'Generos, narrador y estructura', 'La literatura utiliza el lenguaje con una finalidad estetica, expresiva y cultural. Los tres grandes generos son narrativo, lirico y dramatico. El genero narrativo presenta acontecimientos mediante un narrador; el lirico expresa una mirada subjetiva y emociones; el dramatico se construye principalmente con dialogos y acciones pensadas para la representacion teatral. Dentro de ellos existen subgeneros como cuento, novela, poema, tragedia y comedia.\r\n\r\nEn una narracion se distinguen personajes, espacio, tiempo, conflicto y trama. La trama suele organizarse en situacion inicial, desarrollo del conflicto y desenlace, aunque un relato puede alterar ese orden mediante recuerdos o anticipaciones. El narrador no debe confundirse con el autor. Puede narrar en primera persona como protagonista o testigo, o en tercera persona con conocimiento limitado u omnisciente.\r\n\r\nAnalizar un relato implica observar quien cuenta, desde que perspectiva, que informacion conoce y como organiza los hechos. Los personajes principales participan directamente del conflicto y los secundarios colaboran con su desarrollo. El ambiente combina el lugar, la epoca y la atmosfera emocional. Estas herramientas permiten explicar como la forma de narrar modifica la experiencia del lector.'),
(274, 105, 2, 'Poesia y recursos expresivos', 'La poesia concentra significados mediante el ritmo, las imagenes y la seleccion cuidadosa de palabras. Un poema se organiza en versos y estrofas. La voz que habla dentro del poema se llama hablante lirico y no debe identificarse automaticamente con el autor. El tema puede ser el amor, el paso del tiempo, la identidad, la naturaleza o cualquier experiencia humana.\r\n\r\nEntre los recursos expresivos se encuentra la metafora, que relaciona dos realidades sin usar un nexo comparativo; la comparacion o simil, que emplea palabras como como o parece; la personificacion, que atribuye rasgos humanos a seres u objetos; la hiperbole, que exagera; y la anafora, que repite palabras al comienzo de versos. Tambien son importantes las imagenes sensoriales, asociadas con vista, oido, tacto, gusto y olfato.\r\n\r\nEl ritmo surge de la distribucion de acentos, pausas, repeticiones y sonidos. La rima es la coincidencia de sonidos al final de los versos y puede ser consonante o asonante, pero un poema tambien puede usar verso libre. Para interpretar poesia conviene relacionar el sentido literal con el figurado y justificar la lectura mediante palabras o versos concretos.'),
(275, 105, 3, 'Interpretacion, contexto y argumentacion', 'Interpretar literatura significa construir una explicacion coherente a partir del texto. Primero se realiza una lectura global para reconocer tema, conflicto y tono. Luego se releen fragmentos significativos, se buscan repeticiones, contrastes, simbolos y cambios en los personajes. El tema es una idea amplia, mientras que el argumento resume los acontecimientos; por ejemplo, una historia puede narrar un viaje y desarrollar como tema la identidad.\r\n\r\nEl contexto historico y cultural ayuda a comprender valores, conflictos y referencias, pero no reemplaza el analisis del texto. Tambien puede estudiarse la intertextualidad, es decir, la relacion de una obra con otros textos mediante citas, alusiones, personajes o estructuras semejantes. Un simbolo es un elemento concreto que adquiere sentidos adicionales dentro de la obra y debe interpretarse segun sus apariciones.\r\n\r\nUna respuesta literaria solida formula una idea o tesis, incorpora una evidencia concreta y explica por que esa evidencia sostiene la interpretacion. Resumir no es suficiente: hay que relacionar forma y contenido. Comparar dos textos requiere establecer un criterio comun, señalar semejanzas y diferencias, y sostener cada afirmacion con ejemplos. La interpretacion puede admitir varias respuestas, siempre que sean compatibles con el texto y esten bien justificadas.'),
(276, 106, 1, 'Variables, operadores y control de flujo', 'C++ es un lenguaje compilado y de tipado estatico. Cada variable se declara indicando su tipo antes de utilizarla. int representa enteros, double numeros con decimales, bool valores verdadero o falso, char un caracter y std::string una cadena de texto. Inicializar una variable al declararla evita valores indeterminados. const permite expresar que un dato no debe cambiar durante su uso.\r\n\r\nLos operadores aritmeticos realizan calculos; los relacionales comparan valores y producen un bool; los logicos combinan condiciones mediante &&, || y !. La estructura if ejecuta un bloque cuando una condicion es verdadera y puede combinarse con else if y else. switch resulta util cuando una expresion se compara con varios valores discretos.\r\n\r\nLos ciclos permiten repetir instrucciones. for es apropiado cuando conocemos la cantidad de repeticiones, while evalua una condicion antes de cada vuelta y do while ejecuta el bloque al menos una vez. break termina el ciclo y continue salta a la siguiente iteracion. Comprender alcance, inicializacion y condiciones de corte ayuda a evitar errores como ciclos infinitos y accesos fuera de rango.'),
(277, 106, 2, 'Funciones, cadenas y colecciones', 'Una funcion agrupa instrucciones que resuelven una tarea concreta. Su declaracion indica tipo de retorno, nombre y parametros. Los argumentos aportan valores al llamar la funcion y return devuelve un resultado. Separar el programa en funciones pequeñas mejora la lectura, facilita las pruebas y evita duplicacion. Los parametros por valor reciben una copia; una referencia, escrita con &, permite trabajar con el objeto original. const aplicado a una referencia evita modificaciones innecesarias.\r\n\r\nstd::string administra texto y ofrece operaciones como size, empty, concatenacion y acceso por posicion. std::vector almacena una cantidad variable de elementos del mismo tipo. push_back agrega al final, size informa la cantidad y los indices comienzan en cero. at verifica el rango y puede detectar accesos invalidos, mientras que el operador [] supone que el indice es correcto.\r\n\r\nLos ciclos basados en rango permiten recorrer colecciones con claridad. Una referencia evita copiar cada elemento y const protege los datos cuando solo se leen. Este modulo tambien trabaja la separacion entre declaracion e implementacion, el uso de archivos de cabecera y la importancia de nombres descriptivos, precondiciones y valores de retorno coherentes.'),
(278, 106, 3, 'Clases, herencia y polimorfismo', 'La programacion orientada a objetos organiza el software mediante clases y objetos. Una clase define atributos que representan estado y metodos que representan comportamiento. Un objeto es una instancia concreta. Los modificadores private y public controlan el acceso; mantener atributos privados protege invariantes y permite validar cambios mediante metodos. Este principio se conoce como encapsulamiento.\r\n\r\nEl constructor inicializa el objeto y tiene el mismo nombre que la clase. La lista de inicializacion construye los atributos antes de ejecutar el cuerpo y es la forma recomendada para referencias, constantes y objetos miembros. Un destructor libera recursos propios del objeto; al trabajar con recursos se prefieren contenedores y punteros inteligentes para aplicar RAII y evitar fugas de memoria.\r\n\r\nLa herencia permite definir una clase derivada a partir de una clase base. Una funcion virtual habilita polimorfismo dinamico: una referencia o puntero a la clase base puede ejecutar la implementacion sobrescrita de la clase derivada. override verifica que la sobrescritura sea correcta. Una clase abstracta contiene al menos una funcion virtual pura y expresa una interfaz comun. La composicion suele preferirse cuando la relacion es tiene un, mientras que la herencia representa es un.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas_multiple_choice`
--

CREATE TABLE `preguntas_multiple_choice` (
  `id_pregunta` int NOT NULL,
  `id_modulo` int NOT NULL,
  `numero_pregunta` int NOT NULL,
  `enunciado` text NOT NULL,
  `opcion_a` text NOT NULL,
  `opcion_b` text NOT NULL,
  `opcion_c` text NOT NULL,
  `respuesta_correcta` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `preguntas_multiple_choice`
--

INSERT INTO `preguntas_multiple_choice` (`id_pregunta`, `id_modulo`, `numero_pregunta`, `enunciado`, `opcion_a`, `opcion_b`, `opcion_c`, `respuesta_correcta`) VALUES
(9, 21, 1, 'juan', 'a', 'b', 'c', 'A'),
(10, 27, 1, 'a', 'a', 'b', 'c', 'A'),
(11, 27, 2, 'b', 'a', 'b', 'c', 'B'),
(12, 27, 3, 'c', 'c', 'b', 'a', 'C'),
(13, 27, 4, '1', '1', '2', '3', 'A'),
(14, 27, 5, '2', '1', '2', '3', 'B'),
(15, 26, 1, 'a', 'a', 'b', 'c', 'A'),
(16, 26, 2, 'b', 'a', 'b', 'c', 'B'),
(17, 22, 1, 'a', 'a', 'b', 'c', 'C'),
(671, 29, 1, 'Que es una variable?', 'Un espacio donde se guarda un valor', 'Un boton de la interfaz', 'Una tabla de la base de datos', 'A'),
(672, 29, 2, 'Que tipo usarias para un numero entero?', 'QString', 'int', 'bool', 'B'),
(673, 29, 3, 'Para que sirve bool?', 'Para guardar verdadero o falso', 'Para guardar texto largo', 'Para crear una ventana', 'A'),
(674, 30, 1, 'Que hace un if?', 'Repite instrucciones siempre', 'Toma una decision segun una condicion', 'Crea una tabla', 'B'),
(675, 30, 2, 'Cuando se ejecuta el else?', 'Cuando el if no se cumple', 'Antes del if', 'Siempre al final del programa', 'A'),
(676, 30, 3, 'Que operador compara igualdad en C++?', '=', '==', '!=', 'B'),
(677, 31, 1, 'Para que sirve una funcion?', 'Para agrupar una tarea del programa', 'Para borrar la base de datos', 'Para cambiar el sistema operativo', 'A'),
(678, 31, 2, 'Que es un parametro?', 'Un dato que recibe una funcion', 'Una imagen', 'Un error de compilacion', 'A'),
(679, 31, 3, 'Que ventaja tiene usar funciones?', 'Repetir mas codigo', 'Ordenar y reutilizar codigo', 'Evitar usar clases', 'B'),
(680, 32, 1, 'Que representa una fila en una tabla?', 'Un registro', 'Un proyecto completo', 'Una clase C++', 'A'),
(681, 32, 2, 'Que identifica de forma unica un registro?', 'Una clave primaria', 'Un color', 'Un boton', 'A'),
(682, 32, 3, 'Que guarda una columna?', 'Un tipo de dato de cada registro', 'Una ventana completa', 'Un archivo ejecutable', 'A'),
(683, 33, 1, 'Que comando se usa para consultar datos?', 'SELECT', 'DELETE', 'CREATE APP', 'A'),
(684, 33, 2, 'Para que sirve WHERE?', 'Para filtrar resultados', 'Para cerrar la app', 'Para crear botones', 'A'),
(685, 33, 3, 'Para que sirve ORDER BY?', 'Para ordenar resultados', 'Para cambiar contrasenas', 'Para compilar C++', 'A'),
(686, 34, 1, 'Que es una clave foranea?', 'Un campo que relaciona una tabla con otra', 'Una clave para iniciar sesion', 'Un tipo de boton', 'A'),
(687, 34, 2, 'En el proyecto, un modulo pertenece a...', 'Un curso', 'Una pregunta', 'Un color', 'A'),
(688, 34, 3, 'Que relacion hay entre modulos y preguntas?', 'Una pregunta pertenece a un modulo', 'Un modulo pertenece a una pregunta', 'No tienen relacion', 'A'),
(689, 35, 1, 'Que es una clase?', 'Un molde para crear objetos', 'Una consulta SQL', 'Un mensaje de error', 'A'),
(690, 35, 2, 'Que es un objeto?', 'Una instancia de una clase', 'Un archivo de texto solamente', 'Una columna de SQL', 'A'),
(691, 35, 3, 'Cual de estas es una clase modelo del proyecto?', 'Curso', 'QPushButton azul', 'SELECT', 'A'),
(692, 36, 1, 'Para que sirve un constructor?', 'Para inicializar un objeto', 'Para eliminar una tabla', 'Para cerrar una ventana', 'A'),
(693, 36, 2, 'Que significa encapsulamiento?', 'Proteger atributos y acceder con metodos publicos', 'Escribir todo en una sola funcion', 'No usar clases', 'A'),
(694, 36, 3, 'Por que los atributos son privados?', 'Para controlar como se accede a los datos', 'Para que no compile', 'Para ocultar la interfaz', 'A'),
(695, 37, 1, 'Que permite la herencia?', 'Crear una clase hija desde una clase base', 'Duplicar una base de datos', 'Ejecutar SQL automaticamente', 'A'),
(696, 37, 2, 'Que permite el polimorfismo?', 'Usar una referencia base para ejecutar comportamiento de una hija', 'Cambiar el color de un boton', 'Crear contrasenas', 'A'),
(697, 37, 3, 'En el proyecto, EvaluacionMultipleChoice hereda de...', 'Evaluacion', 'CursoDAO', 'QLineEdit', 'A'),
(698, 270, 1, '¿Que pronombre reemplaza a una mujer mencionada en singular?', 'He', 'She', 'They', 'B'),
(699, 270, 2, 'Completa: I ___ a student.', 'am', 'is', 'are', 'A'),
(700, 270, 3, 'Completa: They ___ from Argentina.', 'is', 'am', 'are', 'C'),
(701, 270, 4, '¿Cual es la forma negativa correcta?', 'He not is tired', 'He is not tired', 'He no tired', 'B'),
(702, 270, 5, '¿Que articulo corresponde en ___ apple?', 'a', 'an', 'the a', 'B'),
(703, 270, 6, '¿Cual es el plural irregular de child?', 'childs', 'childes', 'children', 'C'),
(704, 270, 7, '¿Cual es el orden mas comun de una oracion afirmativa?', 'Sujeto, verbo, complemento', 'Verbo, complemento, sujeto', 'Complemento, sujeto, verbo', 'A'),
(705, 270, 8, '¿Que contraccion representa you are?', 'your', 'you\'re', 'youre is', 'B'),
(706, 270, 9, 'Completa la pregunta: ___ she a teacher?', 'Are', 'Am', 'Is', 'C'),
(707, 270, 10, '¿Donde se coloca normalmente el adjetivo?', 'Antes del sustantivo', 'Siempre despues del verbo', 'Al final de toda pregunta', 'A'),
(708, 271, 1, '¿Para que se usa principalmente el presente simple?', 'Habitos y hechos generales', 'Acciones que ocurren solo ahora', 'Ordenes militares', 'A'),
(709, 271, 2, 'Completa: She ___ English every day.', 'study', 'studies', 'studying', 'B'),
(710, 271, 3, 'Completa: He ___ to school by bus.', 'goes', 'go', 'going', 'A'),
(711, 271, 4, '¿Cual es la negacion correcta?', 'She doesn\'t likes tea', 'She don\'t like tea', 'She doesn\'t like tea', 'C'),
(712, 271, 5, 'Completa: ___ they work on Saturdays?', 'Does', 'Do', 'Is', 'B'),
(713, 271, 6, '¿Cual es una respuesta corta correcta?', 'Yes, he does', 'Yes, he do work', 'Yes, does he', 'A'),
(714, 271, 7, '¿Donde suele ubicarse always con un verbo principal?', 'Antes del verbo principal', 'Despues del punto final', 'Entre el sujeto y cualquier articulo', 'A'),
(715, 271, 8, 'Completa: The class starts ___ 8 o\'clock.', 'in', 'on', 'at', 'C'),
(716, 271, 9, 'Completa: We study English ___ Monday.', 'on', 'at', 'in', 'A'),
(717, 271, 10, '¿Que significa never?', 'Siempre', 'Nunca', 'A veces', 'B'),
(718, 272, 1, '¿Cual es el pasado de go?', 'goed', 'went', 'gone to', 'B'),
(719, 272, 2, '¿Cual es la pregunta correcta en pasado?', 'Did you visit London?', 'Did you visited London?', 'Do you visited London?', 'A'),
(720, 272, 3, 'Completa: I ___ see him yesterday.', 'didn\'t', 'don\'t', 'am not', 'A'),
(721, 272, 4, '¿Cuando se usa be going to?', 'Para un plan o intencion', 'Solo para acciones pasadas', 'Para formar plurales', 'A'),
(722, 272, 5, 'Completa una decision espontanea: I ___ help you.', 'went', 'will', 'am yesterday', 'B'),
(723, 272, 6, 'Despues de can se utiliza...', 'el verbo con ed', 'el verbo base', 'el verbo con s', 'B'),
(724, 272, 7, 'Completa: There ___ a bank near here.', 'is', 'are', 'be', 'A'),
(725, 272, 8, 'Completa: There ___ two restaurants.', 'is', 'are', 'am', 'B'),
(726, 272, 9, '¿Que expresion sirve para pedir que repitan?', 'Could you repeat that, please?', 'You repeat never', 'Where repeat is?', 'A'),
(727, 272, 10, 'Al leer un texto breve conviene primero...', 'Identificar la idea principal y palabras clave', 'Traducir cada letra por separado', 'Ignorar el contexto', 'A'),
(728, 273, 1, '¿Cuales son los tres grandes generos literarios?', 'Narrativo, lirico y dramatico', 'Cientifico, tecnico y juridico', 'Noticia, receta y manual', 'A'),
(729, 273, 2, '¿Que caracteriza al genero narrativo?', 'Presenta acontecimientos mediante un narrador', 'Solo contiene instrucciones', 'No posee personajes ni acciones', 'A'),
(730, 273, 3, '¿Que recurso predomina en el genero dramatico?', 'Notas periodisticas', 'Dialogos y acciones', 'Definiciones de diccionario', 'B'),
(731, 273, 4, '¿Narrador y autor son siempre la misma persona?', 'Si, sin excepciones', 'No, son conceptos diferentes', 'Solo en textos teatrales', 'B'),
(732, 273, 5, 'Un narrador protagonista suele hablar en...', 'Primera persona', 'Segunda persona plural obligatoria', 'Lenguaje matematico', 'A'),
(733, 273, 6, '¿Que conoce un narrador omnisciente?', 'Solo el titulo', 'Pensamientos y acciones de distintos personajes', 'Unicamente lo que ve un personaje secundario', 'B'),
(734, 273, 7, '¿Que elemento pone en marcha normalmente la trama?', 'El conflicto', 'La bibliografia', 'El numero de paginas', 'A'),
(735, 273, 8, '¿Que integra el ambiente de un relato?', 'Lugar, epoca y atmosfera', 'Solo el nombre del autor', 'La editorial y el precio', 'A'),
(736, 273, 9, '¿Que personaje participa directamente del conflicto central?', 'El personaje principal', 'El lector real', 'El impresor', 'A'),
(737, 273, 10, '¿Que es una anticipacion narrativa?', 'Una referencia a hechos que ocurriran despues', 'Una repeticion del titulo', 'Una lista de sinonimos', 'A'),
(738, 274, 1, '¿Como se llama cada linea de un poema?', 'Verso', 'Capitulo', 'Acotacion', 'A'),
(739, 274, 2, '¿Que es una estrofa?', 'Un conjunto de versos', 'El nombre del autor', 'Una nota al pie', 'A'),
(740, 274, 3, '¿Quien habla dentro del poema?', 'El hablante lirico', 'Siempre el editor', 'El lector exclusivamente', 'A'),
(741, 274, 4, '¿Que recurso relaciona dos realidades sin usar como?', 'Metafora', 'Enumeracion bibliografica', 'Definicion', 'A'),
(742, 274, 5, 'La expresion fuerte como un roble es...', 'Una comparacion', 'Una personificacion', 'Una acotacion teatral', 'A'),
(743, 274, 6, '¿Que es la personificacion?', 'Atribuir rasgos humanos a seres u objetos', 'Eliminar todos los adjetivos', 'Escribir un texto sin tema', 'A'),
(744, 274, 7, '¿Que recurso consiste en exagerar?', 'Hiperbole', 'Anafora', 'Rima asonante', 'A'),
(745, 274, 8, '¿Que es la anafora?', 'Repeticion al comienzo de versos', 'Cambio de narrador', 'Ausencia total de palabras', 'A'),
(746, 274, 9, 'En la rima consonante coinciden...', 'Vocales y consonantes desde la ultima vocal acentuada', 'Solo los significados', 'Unicamente las mayusculas', 'A'),
(747, 274, 10, 'Para justificar una interpretacion poetica se deben usar...', 'Evidencias del poema', 'Preferencias sin relacion con el texto', 'Datos inventados', 'A'),
(748, 275, 1, '¿Cual es el primer paso recomendado para interpretar un texto?', 'Realizar una lectura global', 'Buscar solamente palabras desconocidas', 'Inventar el final', 'A'),
(749, 275, 2, '¿Que diferencia hay entre tema y argumento?', 'El tema es una idea amplia y el argumento resume hechos', 'Son exactamente lo mismo', 'El argumento siempre es una sola palabra', 'A'),
(750, 275, 3, '¿Para que sirve el contexto historico y cultural?', 'Ayuda a comprender referencias y conflictos', 'Reemplaza completamente la lectura', 'Determina el numero de paginas', 'A'),
(751, 275, 4, '¿Que es la intertextualidad?', 'Relacion de una obra con otros textos', 'Cantidad de parrafos', 'Error de ortografia', 'A'),
(752, 275, 5, '¿Que es un simbolo literario?', 'Un elemento concreto con sentidos adicionales', 'Una palabra que no significa nada', 'El precio del libro', 'A'),
(753, 275, 6, 'Una respuesta literaria solida debe incluir...', 'Idea, evidencia y explicacion', 'Solo una opinion breve', 'Unicamente la biografia del autor', 'A'),
(754, 275, 7, '¿Por que resumir no alcanza para analizar?', 'Porque tambien hay que explicar como el texto produce sentido', 'Porque los textos no tienen acontecimientos', 'Porque analizar significa copiar', 'A'),
(755, 275, 8, 'Para comparar dos textos se necesita...', 'Un criterio comun', 'Que tengan igual cantidad de paginas', 'Que sean del mismo editor', 'A'),
(756, 275, 9, '¿Puede haber varias interpretaciones validas?', 'Si, si estan justificadas por el texto', 'No, nunca', 'Si, aunque contradigan toda evidencia', 'A'),
(757, 275, 10, '¿Que funciona como evidencia en un analisis?', 'Un fragmento o elemento concreto de la obra', 'Un dato inventado', 'Una respuesta sin relacion con el texto', 'A'),
(758, 276, 1, '¿Que significa que C++ tiene tipado estatico?', 'Las variables se declaran con un tipo', 'Todas las variables son texto', 'Los tipos se eligen al cerrar el programa', 'A'),
(759, 276, 2, '¿Que tipo representa numeros enteros?', 'double', 'int', 'bool', 'B'),
(760, 276, 3, '¿Que tipo representa verdadero o falso?', 'bool', 'char', 'string', 'A'),
(761, 276, 4, '¿Para que se utiliza const?', 'Para indicar que un valor no debe modificarse', 'Para crear un ciclo', 'Para borrar una variable', 'A'),
(762, 276, 5, '¿Que devuelve normalmente una comparacion como x > 5?', 'Un valor bool', 'Una ventana', 'Una cadena obligatoriamente', 'A'),
(763, 276, 6, '¿Que operador significa Y logico?', '&&', '||', '!', 'A'),
(764, 276, 7, '¿Cuando se ejecuta el bloque de un if?', 'Cuando su condicion es verdadera', 'Siempre dos veces', 'Solo al compilar', 'A'),
(765, 276, 8, '¿Que ciclo conviene cuando conocemos la cantidad de repeticiones?', 'for', 'switch', 'if', 'A'),
(766, 276, 9, '¿Que ciclo ejecuta su bloque al menos una vez?', 'do while', 'while', 'for sin cuerpo', 'A'),
(767, 276, 10, '¿Que hace break dentro de un ciclo?', 'Termina el ciclo', 'Reinicia la computadora', 'Declara una constante', 'A'),
(768, 277, 1, '¿Que ventaja principal ofrece una funcion?', 'Agrupa y reutiliza una tarea', 'Elimina la necesidad de variables', 'Convierte todo en texto', 'A'),
(769, 277, 2, '¿Que palabra devuelve un resultado desde una funcion?', 'return', 'include', 'class', 'A'),
(770, 277, 3, 'Un parametro por valor recibe...', 'Una copia del argumento', 'Siempre el objeto original', 'Una direccion de internet', 'A'),
(771, 277, 4, '¿Que simbolo identifica una referencia en C++?', '&', '#', '@', 'A'),
(772, 277, 5, '¿Que evita una referencia const?', 'Modificar el objeto recibido', 'Leer el objeto', 'Llamar la funcion', 'A'),
(773, 277, 6, '¿Que representa std::string?', 'Una cadena de texto', 'Unicamente un numero entero', 'Un ciclo', 'A'),
(774, 277, 7, '¿Que es std::vector?', 'Una coleccion dinamica de elementos del mismo tipo', 'Una funcion de salida', 'Un operador logico', 'A'),
(775, 277, 8, '¿Que metodo agrega un elemento al final de un vector?', 'push_back', 'size', 'empty', 'A'),
(776, 277, 9, '¿En que indice comienza un vector?', '0', '1', '-10 obligatoriamente', 'A'),
(777, 277, 10, '¿Que diferencia importante tiene at frente a []?', 'at verifica que el indice este dentro del rango', 'at borra el vector', 'at solo funciona con texto', 'A'),
(778, 278, 1, '¿Que define una clase?', 'Atributos y metodos para crear objetos', 'Solo consultas SQL', 'Un archivo de imagen', 'A'),
(779, 278, 2, '¿Que es un objeto?', 'Una instancia de una clase', 'Un comentario', 'Una biblioteca obligatoria', 'A'),
(780, 278, 3, '¿Que principio protege los atributos mediante acceso controlado?', 'Encapsulamiento', 'Concatenacion', 'Iteracion', 'A'),
(781, 278, 4, '¿Para que sirve un constructor?', 'Inicializa un objeto', 'Elimina la clase', 'Cierra el compilador', 'A'),
(782, 278, 5, '¿Que ventaja tiene la lista de inicializacion?', 'Construye directamente los atributos', 'Convierte todo en global', 'Evita declarar la clase', 'A'),
(783, 278, 6, '¿Que permite la herencia?', 'Crear una clase derivada desde una base', 'Guardar datos en SQL automaticamente', 'Reemplazar todos los objetos por funciones', 'A'),
(784, 278, 7, '¿Para que se declara virtual un metodo?', 'Para permitir despacho polimorfico', 'Para volverlo una variable', 'Para impedir toda sobrescritura', 'A'),
(785, 278, 8, '¿Que indica override?', 'Que un metodo sobrescribe uno virtual de la base', 'Que se crea una constante', 'Que se inicia un ciclo', 'A'),
(786, 278, 9, '¿Que contiene una clase abstracta?', 'Al menos una funcion virtual pura', 'Solo atributos publicos', 'Ningun metodo', 'A'),
(787, 278, 10, '¿Cuando suele preferirse composicion?', 'Cuando la relacion es tiene un', 'Cuando toda relacion es es un', 'Cuando no existen objetos', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `progreso`
--

CREATE TABLE `progreso` (
  `id_progreso` int NOT NULL,
  `id_usuario` int NOT NULL,
  `id_curso` int NOT NULL,
  `modulos_completados` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `progreso`
--

INSERT INTO `progreso` (`id_progreso`, `id_usuario`, `id_curso`, `modulos_completados`) VALUES
(1, 3, 1, 4),
(2, 3, 2, 5),
(3, 2, 2, 2),
(4, 4, 3, 3),
(5, 3, 4, 2),
(6, 6, 2, 0),
(7, 6, 5, 0),
(9, 7, 1, 1),
(10, 7, 6, 0),
(11, 7, 7, 0),
(12, 10, 6, 0),
(13, 7, 8, 2),
(14, 11, 6, 1),
(15, 11, 8, 1),
(16, 2, 101, 0),
(17, 2, 102, 0),
(18, 2, 103, 0),
(19, 7, 101, 3),
(29, 7, 103, 3),
(30, 7, 102, 0),
(85, 12, 101, 1),
(86, 13, 101, 1),
(90, 13, 103, 0),
(91, 13, 104, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `contrasena` varchar(100) NOT NULL,
  `rol` varchar(20) NOT NULL,
  `estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `usuario`, `contrasena`, `rol`, `estado`) VALUES
(1, 'Administrador', 'admin', '1234', 'admin', 'activo'),
(2, 'Alumno de prueba', 'alumno', '1234', 'alumno', 'inactivo'),
(3, 'quieroqueque67+aura', 'quieroqueque67+aura', '1234', 'alumno', 'inactivo'),
(4, 'ada', 'felipe', '1234', 'alumno', 'inactivo'),
(5, 'Ema', 'Itsuki', '321', 'alumno', 'activo'),
(6, 'diego', 'dhlopez', 'Felipe2503', 'alumno', 'inactivo'),
(7, 'fe', 'feli', '1234', 'alumno', 'activo'),
(10, 'juanw', 'juan', '1234', 'alumno', 'activo'),
(11, 'juan', 'juans', '1234', 'alumno', 'activo'),
(12, 'fede', 'fede', '1234', 'alumno', 'activo'),
(13, 'micaela', 'mica', '1234', 'alumno', 'activo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD PRIMARY KEY (`id_calificacion`),
  ADD UNIQUE KEY `id_usuario` (`id_usuario`,`id_modulo`),
  ADD KEY `id_modulo` (`id_modulo`);

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id_curso`);

--
-- Indices de la tabla `entregas`
--
ALTER TABLE `entregas`
  ADD PRIMARY KEY (`id_entrega`),
  ADD UNIQUE KEY `id_usuario` (`id_usuario`,`id_curso`,`numero_modulo`),
  ADD KEY `id_curso` (`id_curso`);

--
-- Indices de la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD PRIMARY KEY (`id_inscripcion`),
  ADD UNIQUE KEY `id_usuario` (`id_usuario`,`id_curso`),
  ADD KEY `id_curso` (`id_curso`);

--
-- Indices de la tabla `intentos_evaluacion_multiple_choice`
--
ALTER TABLE `intentos_evaluacion_multiple_choice`
  ADD PRIMARY KEY (`id_intento`),
  ADD UNIQUE KEY `id_usuario` (`id_usuario`,`id_modulo`),
  ADD KEY `id_modulo` (`id_modulo`);

--
-- Indices de la tabla `modulos`
--
ALTER TABLE `modulos`
  ADD PRIMARY KEY (`id_modulo`),
  ADD UNIQUE KEY `id_curso` (`id_curso`,`numero_modulo`);

--
-- Indices de la tabla `preguntas_multiple_choice`
--
ALTER TABLE `preguntas_multiple_choice`
  ADD PRIMARY KEY (`id_pregunta`),
  ADD UNIQUE KEY `id_modulo` (`id_modulo`,`numero_pregunta`);

--
-- Indices de la tabla `progreso`
--
ALTER TABLE `progreso`
  ADD PRIMARY KEY (`id_progreso`),
  ADD UNIQUE KEY `id_usuario` (`id_usuario`,`id_curso`),
  ADD KEY `id_curso` (`id_curso`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  MODIFY `id_calificacion` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id_curso` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT de la tabla `entregas`
--
ALTER TABLE `entregas`
  MODIFY `id_entrega` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  MODIFY `id_inscripcion` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT de la tabla `intentos_evaluacion_multiple_choice`
--
ALTER TABLE `intentos_evaluacion_multiple_choice`
  MODIFY `id_intento` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `modulos`
--
ALTER TABLE `modulos`
  MODIFY `id_modulo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=306;

--
-- AUTO_INCREMENT de la tabla `preguntas_multiple_choice`
--
ALTER TABLE `preguntas_multiple_choice`
  MODIFY `id_pregunta` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1058;

--
-- AUTO_INCREMENT de la tabla `progreso`
--
ALTER TABLE `progreso`
  MODIFY `id_progreso` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD CONSTRAINT `calificaciones_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `calificaciones_ibfk_2` FOREIGN KEY (`id_modulo`) REFERENCES `modulos` (`id_modulo`);

--
-- Filtros para la tabla `entregas`
--
ALTER TABLE `entregas`
  ADD CONSTRAINT `entregas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `entregas_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`);

--
-- Filtros para la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD CONSTRAINT `inscripciones_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `inscripciones_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`);

--
-- Filtros para la tabla `intentos_evaluacion_multiple_choice`
--
ALTER TABLE `intentos_evaluacion_multiple_choice`
  ADD CONSTRAINT `intentos_evaluacion_multiple_choice_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `intentos_evaluacion_multiple_choice_ibfk_2` FOREIGN KEY (`id_modulo`) REFERENCES `modulos` (`id_modulo`);

--
-- Filtros para la tabla `modulos`
--
ALTER TABLE `modulos`
  ADD CONSTRAINT `modulos_ibfk_1` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`);

--
-- Filtros para la tabla `preguntas_multiple_choice`
--
ALTER TABLE `preguntas_multiple_choice`
  ADD CONSTRAINT `preguntas_multiple_choice_ibfk_1` FOREIGN KEY (`id_modulo`) REFERENCES `modulos` (`id_modulo`);

--
-- Filtros para la tabla `progreso`
--
ALTER TABLE `progreso`
  ADD CONSTRAINT `progreso_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `progreso_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
