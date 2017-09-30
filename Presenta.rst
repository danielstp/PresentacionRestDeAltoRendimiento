:title: Servicios Rest de Alto Rendimiento con C++
:author: Daniel Saguez Tezanos Pinto
:description: Porque usar servicios REST con C++
:keywords: presentación, restructuredtext, impress.js, REST, C++
:data-transition-duration: 1500
:auto-console: true
:css: prueba.css

##########################################
Servicios Rest de Alto Rendimiento con C++
##########################################


----

Contexto
^^^^^^^^

----

Tenemos datos que publicar
##########################

hay mas de 1000 conexiones simultaneas
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
:id: introducción

- UMSS, UMSA, ..., etc
- INE
- OEP
- Los Tiempos, La Razón, ..., etc

----

Identificar el Problema
#######################

- *Procesador*
- *Memoria*
- *Lenguaje* (**C++**, Java, PHP, Python, Node.js)
- *Arquitectura*
- *Base de Datos* (MariaDB, PostgreSQL)
- *Servidor HTTP* (Apache, nginx, Cherokee)
- *Politicas de Seguridad*
- **Ancho de Banda**

----

Soluciones
^^^^^^^^^^

----

:data-x: r+1600
:data-z: r+1600


HipHop
########

- `HipHop for PHP <https://en.wikipedia.org/wiki/HipHop_for_PHP>`_
  (HPHPc) es un transcompilador PHP. (descontinuado)

----

HHVM
####


- `Máquina Virtual HipHop HHVM <https://en.wikipedia.org/wiki/HipHop_Virtual_Machine>`_
  es una máquina virtual de código abierto basado en compilador Just-in-Time
  (JIT), el cual sirve como un motor de ejecución para los lenguajes PHP y Hack.

----

¡ Pero no se como es la infraestructura de Facebook !
#####################################################

----

:data-x: r+1600
:data-y: r+1600
:data-rotate: 360

Wikipedia
#########

- Hasta el 2004 solo usaban un servidor
- Actualmente recibe entre **25.000 y 60.000** consultas por segundo

----

.. image:: Imágenes/Wikimedia-servers-2004-02-19-800wide.png
   :width: 100%

----

.. image:: Imágenes/Wikimedia-servers-2004-08-24.png
   :width: 100%

----

.. image:: Imágenes/Wikimedia-servers-2004-08-26.png
   :width: 100%

----

.. image:: Imágenes/Wikimedia-servers-2004-11-11.png
   :width: 100%

----

.. image:: Imágenes/Wikimedia-servers-2004-12-10.png
   :width: 100%

----

.. image:: Imágenes/Wikimedia-servers-2005-01-30.png
   :width: 100%

----

.. image:: Imágenes/Wikimedia-servers-2005-04-12.png
   :width: 100%

----

.. image:: Imágenes/Wikimedia-servers-2006-05-09.svg
   :width: 100%

----

.. image:: Imágenes/Wikimedia-servers-2008-11-10.svg
   :height: 730px

----

.. image:: Imágenes/Wikimedia-servers-2010-12-28.svg
   :height: 730px

----

.. image:: Imágenes/Wikimedia_Servers.svg
   :width: 100%

----

:data-y: 1600
:data-z: 1600
:data-rotate: 360

+--------------------------+----------------------------------------------------+
|                          | `C++ <https://es.wikipedia.org/wiki/C++>`_         |
+==========================+====================================================+
|logo                      | .. image:: Imágenes/C_plus_plus.svg                |
+--------------------------+----------------------------------------------------+
|extensiones comunes       | ``.h .hh .hpp .hxx .h++ .cc .cpp .cxx .c++``       |
+--------------------------+----------------------------------------------------+
|paradigma                 | **multiparadigma, orientado a objetos, imperativo, |
|                          | programación genérica**.                           |
+--------------------------+----------------------------------------------------+
|año                       | 1983                                               |
+--------------------------+----------------------------------------------------+
|diseñador                 | **Bjarne Stroustrup**, Bell Labs                   |
|desarrollador             |                                                    |
+--------------------------+----------------------------------------------------+
|última versión            | ISO/IEC 14882:2014                                 |
+--------------------------+----------------------------------------------------+
|fecha última versión      | 15 de Diciembre del 2014                           |
+--------------------------+----------------------------------------------------+
|última versión Desarrollo | C++17 se aprobo y se trabaja en el C++20           |
+--------------------------+----------------------------------------------------+
|tipo dato                 | fuerte, estático, nominativo                       |
+--------------------------+----------------------------------------------------+

----

+-------------------------+----------------------------------------------------+
|                         | `C++ <https://es.wikipedia.org/wiki/C++>`_         |
+=========================+====================================================+
|implementaciones         | C++ Builder, clang, Comeau C/C++, GNU Compiler     |
|                         | Collection/GCC, Intel C++ Compiler, Microsoft      |
|                         | Visual C++, Sun Studio, Code::Blocks, Zinjai       |
+-------------------------+----------------------------------------------------+
|dialectos                | ISO/IEC 14882|ISO/IEC C++ 1998, ISO/IEC            |
|                         | 14882|ISO/IEC C++ 2003, ISO/IEC 14882|ISO/IEC C++  |
|                         | 2011                                               |
+-------------------------+----------------------------------------------------+
|influido por             | C, Simula, Ada 83, ALGOL 68, CLU, ML               |
+-------------------------+----------------------------------------------------+
|ha influido              | Perl 1987, LPC 1989, Lua 1993, Pike 1994, Ada 95,  |
|                         | Java 1995, PHP 1995, D 1999, C99, C# 2001, Falcon  |
|                         | 2003                                               |
+-------------------------+----------------------------------------------------+
|sistema operativo        | Multiplataforma                                    |
+-------------------------+----------------------------------------------------+

----

:data-y: r+1600
:data-x: r+1600

C++ vs Python vs Node.js vs Java
################################

----

C++
###

+ Veloz

- **Complicado**

----

Python
######

+ No tan veloz
+ Simple de usar

----

Java
####

+ No tan veloz, mucho mas rapido que python

- *no tan complicado como C++*

----

Node.js
#######

+ Paralelo por naturaleza

- JavaScript

----

:data-rotate: r+90

Principio de Pareto
###################

«el 80 % del esfuerzo de desarrollo (en tiempo y recursos) produce el 20 % del
código, mientras que el 80 % restante es producido con tan solo un 20 % del
esfuerzo».

----

«En el artículo de DonaldKnuth "StructuredProgrammingWithGoToStatements"
escribió: "Los programadores pierden enormes cantidades de tiempo pensando o
preocupándose por la velocidad de las partes no críticas de sus programas, y
estos intentos de eficiencia realmente tienen un fuerte impacto negativo cuando
a la depuración y el mantenimiento; deben olvidarse de las pequeñas eficiencias,
digamos alrededor del 97% del tiempo: la optimización prematura es la raíz de
todo mal. Sin embargo, no debemos dejar pasar nuestras oportunidades en ese
crítico 3% ".»

----

Representational State Transfer
###############################

`Restful <https://es.wikipedia.org/wiki/Representational_State_Transfer>`_

La Transferencia de Estado Representacional (Representational State Transfer) o
REST es un estilo de arquitectura software para sistemas hipermedia distribuidos
como la World Wide Web. El término se originó en el año 2000, en una tesis
doctoral sobre la web escrita por **Roy Fielding**, uno de los principales
autores de la especificación del protocolo HTTP y ha pasado a ser ampliamente
utilizado por la comunidad de desarrollo.

----

Introducción
############

- Divide y Vencerás (desde el Imperio Romano {228 a.c.} a nuestros días )
- Heurística en Software Libre

----

Divide y Vencerás I
###################

En política y psicología, divide y vencerás o dividir para reinar (del
griego: διαίρει καὶ βασίλευε, diaírei kaì basíleue) es ganar y mantener el
poder mediante la ruptura en piezas de las concentraciones más grandes, que
tienen individualmente menos energía. El concepto se refiere a una estrategia
que rompe las estructuras de poder existentes y evita la vinculación de los
grupos de poder más pequeños. Podría ser utilizada en todos los ámbitos en
los que, para obtener un mejor resultado, es en primer lugar necesario o
ventajoso romper o dividir lo que se opone a la solución o a un determinado
problema inicial.

----

Divide y Vencerás II
####################

En las ciencias de la computación, el término divide y vencerás (DYV) hace
referencia a uno de los más importantes paradigmas de diseño algorítmico. El
método está basado en la resolución recursiva de un problema dividiéndolo en
dos o más subproblemas de igual tipo o similar. El proceso continúa hasta que
éstos llegan a ser lo suficientemente sencillos como para que se resuelvan
directamente. Al final, las soluciones a cada uno de los subproblemas se
combinan para dar una solución al problema original.

----

Heurística en Software Libre I
##############################

El problema no solo es mio, entonces ya debe haber alguien con una solución

- Buscar Solución en Software Libre
- Escoger una
- Probar si cumple con mis: Requerimientos y/o Casos de Aceptación.
- Si no cumple, entonces: probar otra

----

Heurística en Software Libre II
###############################

- Probé muchas y ninguna me convence
  - Escoger la mas cercana y adaptarla
  - Crear un proyecto Nuevo

----

:data-rotate: 0


NGREST
######

ngrest es un framework REST simple desarrollado en C++. Poca huella de código,
extremadamente rápido y **muy fácil de usar**.

----

.. image:: Imágenes/01.png
   :width: 100%

----

.. image:: Imágenes/02.png
   :width: 100%

----

.. image:: Imágenes/03.png
   :width: 100%

----

.. image:: Imágenes/InstalaciónNGRest.png
   :width: 100%

----

.. code:: c++

   #include "Echo.h"

   namespace ngrest {
   namespace examples {

   std::string Echo::echoPost(const std::string& text) {
     return "You said: [" + text + "]";
   }

   std::string Echo::echoGet(const std::string& text) {
    return "You said: [" + text + "]";
   }

   }}


----

.. code:: c++

 #include <string>
 #include <ngrest/common/Service.h>

 namespace ngrest {
 namespace examples {

 //! Echo service example
 /*! by default exposes Echo service relative to base
 URL: http://server:port/ngrest/examples/Echo */
 class Echo: public Service {
  public:
    //! a simple operation "echo"
    /*!
      example of POST request:
      http://server:port/ngrest/examples/Echo/echo
      -- body -----------------------
      {
        "text": "Hello ngrest!"
      }
      -- end body -------------------
    */


----

.. code:: c++

    // *method: POST
    // *location: echo
    std::string echoPost(const std::string& text);

    //! a simple operation "echo"
    /*!
      example of GET request:
      http://server:port/ngrest/examples/Echo?text=Hello%20World!
    */
    // *method: GET
    // *location: echo?text={text}
    std::string echoGet(const std::string& text);
 };

 }}

----

Ngrest-db
#########

Es un ORM pequeño y fácil de usar, para trabajar junto con ngrest.

- Mapea la estructura proporcionada por el desarrollador de las tablas de base de datos.
- Sintaxis fácil e intuitiva para realizar las operaciones db más utilizadas.
- Generador de código para máxima comodidad y velocidad de desarrollo
- Utiliza meta-comentarios para proporcionar funcionalidad adicional específica de la base de datos (PK, FK, UNIQUE, etc.) (**Como las anotaciones en Hibernate**)
- Fácil de integrar con los servicios ngrest

----

DBMS soportados:

- SQLite3
- MySQL
- PostgreSQL

----

:data-y: 11600
:data-x: 0
:data-z: 11600


Tim Berners-Lee
###############

.. image:: Imágenes/Sir_Tim_Berners-Lee.jpg
   :width: 50%

Sir Timothy "Tim" John Berners-Lee, KBE (Londres, Reino Unido, 8 de junio de
1955) es un científico de la computación británico, conocido por ser el padre de
la Web. Estableció la primera comunicación entre un cliente y un servidor usando
el protocolo HTTP en noviembre de 1989. En octubre de 1994 fundó el Consorcio de
la World Wide Web (W3C) con sede en el MIT, para supervisar y estandarizar el
desarrollo de las tecnologías sobre las que se fundamenta la Web y que permiten
el funcionamiento de Internet.

Ante la necesidad de distribuir e intercambiar información acerca de sus
investigaciones de una manera más efectiva, Berners-Lee desarrolló las ideas
fundamentales que estructuran la web. Él y su grupo crearon lo que por sus siglas
en inglés se denomina Lenguaje HTML (HyperText Markup Language) o lenguaje de
etiquetas de hipertexto, el protocolo HTTP (HyperText Transfer Protocol) y el
sistema de localización de objetos en la web URL (Uniform Resource Locator).

Es posible encontrar muchas de las ideas plasmadas por Berners-Lee en el proyecto
Xanadú (que propuso Ted Nelson) y el memex (de Vannevar Bush).

----

:data-x: r+1600
:data-z: 1600


Fravia+
#######

.. image:: Imágenes/Fravia.jpg
   :width: 50%

Francesco Vianello (30 de agosto de 1952 - 3 de mayo de 2009), más conocido por
su apodo Fravia+, fue un ingeniero inverso de software y «seeker» conocido por
su archivo web de las técnicas y trabajos sobre **ingeniería inversa**.

----

:data-x: r+1600

Richard Stallman
################

.. image:: Imágenes/Richard_Stallman_2016_Talk_in_Madrid_06.jpg
   :width: 50%

Richard Matthew Stallman (nacido en Manhattan, Nueva York, 16 de marzo de 1953),
con frecuencia abreviado como «rms»,1 es un programador estadounidense y fundador
del movimiento por el software libre en el mundo.

Entre sus logros destacados como programador se incluye la realización del editor
de texto GNU Emacs,2 el compilador GCC,3 y el depurador GDB,4 bajo la rúbrica del
Proyecto GNU. Sin embargo, es principalmente conocido por el establecimiento de
un marco de referencia moral, político y legal para el movimiento del software
libre, como una alternativa al desarrollo y distribución del software no libre o
propietario. Es también inventor del concepto de copyleft (aunque no del término)
, un método para licenciar software de tal forma que su uso y modificación
permanezcan siempre libres y queden en la comunidad de usuarios y desarrolladores.

----

:data-x: r+1600

Linus Torvalds
##############

.. image:: Imágenes/Linus_Torvalds.jpeg
   :width: 50%

Linus Benedict Torvalds (28 de diciembre de 1969, Helsinki, Finlandia) es un
ingeniero de software finlandés estadounidense,1 conocido por iniciar y mantener
el desarrollo del "kernel" (en español, núcleo) Linux, basándose en el sistema
operativo libre Minix creado por Andrew S. Tanenbaum y en algunas herramientas,
varias utilidades y los compiladores desarrollados por el proyecto GNU.
Actualmente Torvalds es responsable de la coordinación del proyecto. Pertenece a
la comunidad sueco-parlante de Finlandia.

----

:data-x: r+1600

Con Kolivas
###########

.. image:: Imágenes/conKolivas.jpg
   :width: 50%

Es un anestesiologo australiano. Ha trabajado como programador de computadoras en
el kernel de Linux y en el desarrollo del software criptográfico CGMiner. Sus
contribuciones de Linux incluyen parches para que el kernel mejore su rendimiento
de escritorio, particularmente reduciendo el impacto de I/O.

----

:data-x: r+1600

Ian Murdock
###########

.. image:: Imágenes/IanMurdock.jpg
   :width: 50%

Ian Ashley Murdock (Konstanz, Alemania, 28 de abril de 1973-28 de diciembre de
2015) fue un informático alemán y fue el fundador y primer líder del proyecto de
software libre Debian.

En 1993 escribió el Manifiesto Debian mientras estudiaba en la Purdue University,
donde en 1996 obtuvo su licenciatura. La palabra Debian proviene de la
combinación del nombre de su entonces novia Deborah y el suyo, por lo tanto,
Deb(orah) e Ian.

Fue fundador, también, de la empresa Progeny Linux Systems. Fue CTO de la Linux
Foundation y líder del Proyecto Indiana cuando trabajaba para Sun Microsystems.

----

:data-x: r+1600

Stefano Zacchiroli
##################

.. image:: Imágenes/Stefano_zacchiroli_debconf10.1.jpg
   :width: 50%

Stefano Zacchiroli, (n. 16 de marzo de 1979) fue líder del proyecto Debian,
sucediendo a Steve McIntyre desde abril de 2010 hasta abril de 2013, cuando le
sucedió Lucas Nussbaum. Zacchiroli se convirtió en un desarrollador de Debian en
el año 2001. Después de asistir a LinuxTag en 2004, se convirtió en uno de los
participantes más activos en la comunidad de Debian, y el propio proyecto.

Zacchiroli obtuvo un doctorado en ciencias de la computación en 2007 en la
Universidad de Bolonia1 y se trasladó a la Universidad de Paris Diderot por su
investigación postdoctoral. Él está involucrado en el proyecto MANCOOSI de
trabajo, sobre la aplicación de métodos formales para la solución de problemas
de complejidad en la gestión de distribuciones de GNU/Linux.

Desde el punto de vista técnico, Zacchiroli ha participado en Debian
principalmente en el paquete Objetive Caml y en el equipo de aseguramiento de
calidad.

----

:data-x: r+1600

Julian Assange
##############

.. image:: Imágenes/Julian_Assange_cropped_(Norway,_March_2010).jpg
   :width: 50%

Julian Paul Assange (Townsville, Queensland, 3 de julio de 1971), conocido como
Julian Assange, es un programador, ciberactivista, periodista y activista de
Internet australiano, conocido por ser el fundador, editor y portavoz del sitio
web WikiLeaks.

----

:data-x: r+1600

Edward Snowden
##############

.. image:: Imágenes/Edward_Snowden.jpg
   :width: 50%

Edward Joseph Snowden (Elizabeth City, 21 de junio de 1983) es un consultor
tecnológico estadounidense, informante, antiguo empleado de la CIA (Agencia
Central de Inteligencia) y de la NSA (Agencia de Seguridad Nacional).

En junio del 2013, Snowden hizo públicos, a través de los periódicos The
Guardian y The Washington Post, documentos clasificados como alto secreto
sobre varios programas de la NSA, incluyendo los programas de vigilancia
masiva PRISM y XKeyscore


----

:data-x: r+1600

Chelsea Manning
###############

.. image:: Imágenes/Bradley_Manning_US_Army.jpg
   :width: 50%


Chelsea Elizabeth Manning (nacida Bradley Edward Manning, Crescent, Oklahoma, 17
de diciembre de 1987) es una exsoldado y analista de inteligencia del ejército
de los Estados Unidos. Manning cobró notoriedad internacional por supuestamente
haber filtrado a WikiLeaks miles de documentos clasificados acerca de las
guerras de Afganistán —conocidos como los Diarios de la Guerra de Afganistán— y
de Irak, incluidos numerosos cables diplomáticos de diversas embajadas
estadounidenses y el video del ejército conocido como Collateral Murder
(«asesinato colateral»).


----

:data-x: r+1600
:data-z: 91600
:data-rotate: 360


George Hotz
###########

.. image:: Imágenes/George_Hotz.jpg
   :width: 50%

Francis George Hotz, (n. 2 de octubre de 1989), alias geohot, es un hacker estadounidense experto en seguridad de sistemas informáticos que cobró notoriedad por la gran precocidad que demostró con 17 años al crear blackra1n que, aprovechando otros desarrollos, lograba ser el primero en desbloquear el iPhone, permitiendo que el dispositivo sea utilizado con otros operadores de telecomunicaciones, a diferencia de la intención de Apple de proveer a sus clientes con sólo el uso de la red de AT&T.1


----

:data-x: 9400
:data-y: r+1200
:data-z: r+6400

Aaron Swartz
############

.. image:: Imágenes/Aaron_Swartz_profile.jpg
   :width: 50%

Aaron Hillel Swartz (8 de noviembre de 1986, Chicago - 11 de enero de 2013, Nueva
York) fue un programador, emprendedor, escritor, activista político y hacktivista
de Internet. Estuvo involucrado en el desarrollo del formato de fuente web RSS, y
el formato de publicación Markdown, la organización Creative Commons, la
infraestructura del sitio web "web.py" y el sitio web de marcadores sociales
Reddit, del cual se convirtió en socio luego de que éste se fusionara con su
compañía, Infogami. Recibió atención de los medios después de la **recolección de
artículos de revistas académicas JSTOR.**

Fue diseñador jefe del proyecto inicial de Open Library.

----

:data-x: r+1600

No hay justicia al cumplir leyes injustas. Es hora de salir a la luz y,
siguiendo la tradición de la desobediencia civil, oponernos a este robo
privado de la cultura pública.

    *Aaron Swartz*

----

:data-x: r+1600

La información es poder. Pero como todo poder, hay quienes quieren
mantenerlo para sí mismos.

    *Aaron Swartz*

----

:data-x: r+1600

Alexandra Elbakyan
##################

.. image:: Imágenes/Alexandra_Elbakyan_(cropped).jpg
   :width: 50%

Alexandra Asanovna Elbakyan (1988) es una desarrolladora de software y
neurocientífica de Kazajistán, más conocida por ser la fundadora del proyecto
**Sci-Hub** en 2011 una web de acceso libre a más de 40 millones de artículos
científicos recientes.


----

.. code:: c++

 #include <list>
 #include <iostream>

 #include <ngrest/utils/Log.h>

 #ifdef HAS_SQLITE
 #include <ngrest/db/SQLiteDb.h>
 #endif
 #ifdef HAS_MYSQL
 #include <ngrest/db/MySqlDb.h>
 #endif
 #ifdef HAS_POSTGRES
 #include <ngrest/db/PostgresDb.h>
 #endif
 #include <ngrest/db/Table.h>

 #include "datatypes.h"


----

.. code:: c++

 template <typename Item>
 std::ostream& operator<<(std::ostream& out, const std::list<Item>& items) {
    for (const Item& item : items)
        out << item << std::endl;

    return out;
 }

 namespace ngrest {
 namespace example {

----

.. code:: c++

 void example1(Db& db) {
    ngrest::Table<User> users(db);

    users.create();

    users.deleteAll(); // delete all data from the table

    // exclude "id" from the fields when inserting to perform auto-increment
    // enabled by default
 //    users.setInsertFieldsInclusion({"id"}, ngrest::FieldsInclusion::Exclude);

    users.insert({0, "John", "john@example.com"}); // id is ignored upon insertion

    int id = users.lastInsertId();
 //    LogInfo() << "Last insert id: " << id;

    User user = {0, "James", "james@example.com"};
    users.insert(user);
    // users.insert(user, {"id", "registered"}, ngrest::FieldsInclusion::Exclude); // for example

----

.. code:: c++

    user.name = "Jane";
    user.email = "jane@example.com";
    users.insert(user);

    // for example
    std::tie(user.name, user.email) = std::tuple<std::string, std::string>("Jade", "jade@example.com");
    users.insert(user);


    // select all
    const std::list<User>& resList0 = users.select();
    NGREST_ASSERT(resList0.size() == 4, "Test failed");

    // select query
    const std::list<User>& resList1 = users.select("id = ?", id);
    NGREST_ASSERT(resList1.size() == 1, "Test failed");

    // select query and 2 parameters
    const std::list<User>& resList2 = users.select("id >= ? AND name LIKE ?", 0, "Ja%");
    NGREST_ASSERT(resList2.size() == 3, "Test failed");

----

.. code:: c++

    // select query and IN statement
 //    const std::list<User>& resList3 = users.select("id IN ?", std::list<int>{1, 2, 3});
    // select query and IN statement
 //    const std::list<User>& resList4 = users.select("id IN ? AND name LIKE ?",
 //            std::list<int>{1, 2, 3}, "%Ja%");
    // select all items, desired fields
    const std::list<User>& resList5 = users.selectFields({"id", "name"}, "");
    NGREST_ASSERT(resList5.size() == 4, "Test failed");

    // select desired fields with query
    const std::list<User>& resList6 = users.selectFields({"id", "name"}, "id = ?", id);
    NGREST_ASSERT(resList6.size() == 1, "Test failed");


    const User& resOne2 = users.selectOne("id = ?", id);
    NGREST_ASSERT(resOne2.id == id, "Test failed");


----

.. code:: c++

 //    const std::tuple<int, std::string, std::string>& resRaw1 =
 //        users.selectOneTuple<std::tuple<int, std::string, std::string>>(
 //        {"id", "name", "email"});


    // select just one field: all ids
    const std::list<int>& resRawIds = users.selectTuple<int>({"id"});
    NGREST_ASSERT(resRawIds.size() == 4, "Test failed");


    typedef std::tuple<int, std::string, std::string> UserInfo;

 //    const std::list<std::tuple<int, std::string, std::string>>& resRaw1 =
 //            users.selectTuple<std::tuple<int, std::string, std::string>>(
 //            {"id", "name", "email"}, "id = ?", 2);

    // equals to resRaw1
    const std::list<UserInfo>& resRaw2 =
            users.selectTuple<UserInfo>({"id", "name", "email"}, "id = ?", id + 1);
    NGREST_ASSERT(resRaw2.size() == 1, "Test failed");

----

.. code:: c++

    for (const UserInfo& info : resRaw2) {
        int id;
        std::string name;
        std::string email;

        std::tie(id, name, email) = info;

 //        std::cout << id << name << email << std::endl;
    }


    const UserInfo& resRaw3 = users.selectOneTuple<UserInfo>(
                {"id", "name", "email"}, "id = ?", id + 1);

    int resId;
    std::string name;
    std::string email;

    std::tie(resId, name, email) = resRaw3;

----

.. code:: c++

 //    std::cout << resId << " " << name << " " << email << std::endl;


    // stream

    User user1 = {0, "Martin", "martin@example.com"};
    User user2 = {0, "Marta", "marta@example.com"};

    // insert
    users << user1 << user2;

    // select one item
    users("id = ?", id) >> user;

    // select multiple items
    std::list<User> userList1;
    users("id <= ?", id + 2) >> userList1;
    NGREST_ASSERT(userList1.size() == 3, "Test failed");

    // select all
    std::list<User> userList2;
    users() >> userList2;
    NGREST_ASSERT(userList2.size() == 6, "Test failed");

----

.. code:: c++

    std::cout
    << resList0  << std::endl
    << "--------------------------"  << std::endl
    << resList1  << std::endl
    << "--------------------------"  << std::endl
    << resList2  << std::endl
    << "--------------------------"  << std::endl
    << resList5  << std::endl
    << "--------------------------"  << std::endl
    << resList6  << std::endl
    << "--------------------------"  << std::endl
    << resOne2   << std::endl
    << "--------------------------"  << std::endl
    << user << std::endl
    << "--------------------------"  << std::endl
    << userList1   << std::endl
    << "--------------------------"  << std::endl
    << userList2   << std::endl;

    }}}

----

.. code:: c++

 int main() {
    try {
 #ifdef HAS_SQLITE
        ngrest::SQLiteDb sqliteDb("test.db");
        ngrest::example::example1(sqliteDb);
 #endif
 #ifdef HAS_MYSQL
        // must have db and user created using statements:
        //   CREATE DATABASE test_ngrestdb CHARACTER SET utf8 COLLATE utf8_general_ci;
        //   CREATE USER 'ngrestdb'@'localhost' IDENTIFIED BY 'ngrestdb';
        //   GRANT ALL PRIVILEGES ON test_ngrestdb.* TO 'ngrestdb'@'localhost' WITH GRANT OPTION;

        ngrest::MySqlDb mysqlDb({"test_ngrestdb", "ngrestdb", "ngrestdb"});
        ngrest::example::example1(mysqlDb);
 #endif
 #ifdef HAS_POSTGRES
        // must have db and user created using statements:
        //   CREATE DATABASE test_ngrestdb;
        //   CREATE USER ngrestdb WITH password 'ngrestdb';
        //   GRANT ALL PRIVILEGES ON DATABASE test_ngrestdb TO ngrestdb;

        ngrest::PostgresDb postgresDb({"test_ngrestdb", "ngrestdb", "ngrestdb"});
        ngrest::example::example1(postgresDb);
 #endif
    } NGREST_CATCH_ALL }

----

Fin
###

¡¡¡ Gracias !!!
^^^^^^^^^^^^^^^