--Colección deportistas:

{
  _id: ObjectId, 
  nombre: String,
  apellido: String,
  fechaNacimiento: Date,
  nacionalidad: String,
  equipo: ObjectId (referencia a la colección equipos)
}

--Colección entrenadores:

{
  _id: ObjectId,
  nombre: String,
  apellido: String,
  fechaNacimiento: Date,
  nacionalidad: String,
  equipo: ObjectId (referencia a la colección equipos)
}

--Colección árbitros:

{
  _id: ObjectId,
  nombre: String, 
  apellido: String,
  fechaNacimiento: Date,
  nacionalidad: String
}

--Colección equipos:

{
  _id: ObjectId,
  nombre: String,
  país: String,
  jugadores: [ObjectIds] (referencias a colección deportistas),
  entrenador: ObjectId (referencia a colección entrenadores)
}

--Colección encuentros:

{
  _id: ObjectId,
  fecha: Date,
  fase: String,
  equipo1: ObjectId,
  equipo2: ObjectId,
  golesEquipo1: Number,
  golesEquipo2: Number,
  árbitro: ObjectId
}

--Colección resultados:

{
  _id: ObjectId,
  encuentro: ObjectId,
  golesEquipo1: Number,
  golesEquipo2: Number
}

--Colección posiciones:

{
  _id: ObjectId, 
  equipo: ObjectId,
  puntos: Number,
  partidosJugados: Number,
  partidosGanados: Number,
  partidosEmpatados: Number, 
  partidosPerdidos: Number
}

--// Crear la BD
use torneoFutbolDB

--// Colección deportistas  
db.deportistas.insert([
  {_id: ObjectId(), nombre: "Lionel Messi", apellido: "Messi", fechaNac: ISODate(), nacionalidad: "Argentina", equipo: ObjectId()},
  {_id: ObjectId(), nombre: "Cristiano Ronaldo", apellido: "Ronaldo", fechaNac: ISODate(), nacionalidad: "Portugal", equipo: ObjectId()},
  {_id: ObjectId(), nombre: "Neymar", apellido: "Neymar", fechaNac: ISODate(), nacionalidad: "Brasil", equipo: ObjectId()},
  {_id: ObjectId(), nombre: "Kylian Mbappé", apellido: "Mbappé", fechaNac: ISODate(), nacionalidad: "Francia", equipo: ObjectId()},
  {_id: ObjectId(), nombre: "Kevin De Bruyne", apellido: "De Bruyne", fechaNac: ISODate(), nacionalidad: "Bélgica", equipo: ObjectId()}
])

--// Colección entrenadores
db.entrenadores.insert([
  {_id: ObjectId(), nombre: "Pep Guardiola", apellido: "Guardiola", fechaNac: ISODate(), nacionalidad: "España", equipo: ObjectId()},
  {_id: ObjectId(), nombre: "Carlo Ancelotti", apellido: "Ancelotti", fechaNac: ISODate(), nacionalidad: "Italia", equipo: ObjectId()},
  {_id: ObjectId(), nombre: "Tite", apellido: "Tite", fechaNac: ISODate(), nacionalidad: "Brasil", equipo: ObjectId()},
  {_id: ObjectId(), nombre: "Didier Deschamps", apellido: "Deschamps", fechaNac: ISODate(), nacionalidad: "Francia", equipo: ObjectId()},
  {_id: ObjectId(), nombre: "Roberto Martínez", apellido: "Martínez", fechaNac: ISODate(), nacionalidad: "España", equipo: ObjectId()}
])  

--// Colección árbitros
db.árbitros.insert([
  {_id: ObjectId(), nombre: "Pierluigi Collina", apellido: "Collina", fechaNac: ISODate(), nacionalidad:"Italia"},
  {_id: ObjectId(), nombre: "Howard Webb", apellido: "Webb", fechaNac: ISODate(), nacionalidad:"Inglaterra"},
  {_id: ObjectId(), nombre: "Björn Kuipers", apellido: "Kuipers", fechaNac: ISODate(), nacionalidad:"Holanda"}, 
  {_id: ObjectId(), nombre: "Néstor Pitana", apellido: "Pitana", fechaNac: ISODate(), nacionalidad:"Argentina"},
  {_id: ObjectId(), nombre: "Cüneyt Çakır", apellido: "Çakır", fechaNac: ISODate(), nacionalidad:"Turquía"}
])

--// Colección equipos
db.equipos.insert([
  {_id: ObjectId(), nombre: "Argentina", país: "Argentina", jugadores: [ObjectId(), ObjectId()], entrenador: ObjectId()},
  {_id: ObjectId(), nombre: "Francia", país: "Francia", jugadores: [ObjectId(), ObjectId()], entrenador: ObjectId()},
  {_id: ObjectId(), nombre: "Brasil", país: "Brasil", jugadores: [ObjectId(), ObjectId()], entrenador: ObjectId()},
  {_id: ObjectId(), nombre: "Alemania", país: "Alemania", jugadores: [ObjectId(), ObjectId()], entrenador: ObjectId()},
  {_id: ObjectId(), nombre: "España", país: "España", jugadores: [ObjectId(), ObjectId()], entrenador: ObjectId()}
])

--// Colección encuentros 
db.encuentros.insert([
  {_id: ObjectId(), equipo1: ObjectId(), equipo2: ObjectId(), golesEq1: 3, golesEq2: 0, árbitro: ObjectId(), fecha: ISODate(), fase:"Grupos"},
  {_id: ObjectId(), equipo1: ObjectId(), equipo2: ObjectId(), golesEq1: 1, golesEq2: 0, árbitro: ObjectId(), fecha: ISODate(), fase:"Cuartos"},
  {_id: ObjectId(), equipo1: ObjectId(), equipo2: ObjectId(), golesEq1: 0, golesEq2: 0, árbitro: ObjectId(), fecha: ISODate(), fase:"Semifinal"},
  {_id: ObjectId(), equipo1: ObjectId(), equipo2: ObjectId(), golesEq1: 2, golesEq2: 1, árbitro: ObjectId(), fecha: ISODate(), fase:"Final"},
  {_id: ObjectId(), equipo1: ObjectId(), equipo2: ObjectId(), golesEq1: 2, golesEq2: 2, árbitro: ObjectId(), fecha: ISODate(), fase:"Tercer Puesto"}
])

--// Colección resultados
db.resultados.insert([
  {_id: ObjectId(), encuentro: ObjectId(), golesEq1: 3, golesEq2: 0},
  {_id: ObjectId(), encuentro: ObjectId(), golesEq1: 1, golesEq2: 0}, 
  {_id: ObjectId(), encuentro: ObjectId(), golesEq1: 0, golesEq2: 0},
  {_id: ObjectId(), encuentro: ObjectId(), golesEq1: 2, golesEq2: 1},
  {_id: ObjectId(), encuentro: ObjectId(), golesEq1: 2, golesEq2: 2}  
])

--// Colección posiciones
db.posiciones.insert([
  {_id: ObjectId(), equipo:ObjectId(), puntos: 9, partidosJugados: 3, partidosGanados: 3, partidosEmpatados: 0, partidosPerdidos: 0},
  {_id: ObjectId(), equipo:ObjectId(), puntos: 6, partidosJugados: 3, partidosGanados: 2, partidosEmpatados: 0, partidosPerdidos: 1},
  {_id: ObjectId(), equipo:ObjectId(), puntos: 2, partidosJugados: 3, partidosGanados: 0, partidosEmpatados: 2, partidosPerdidos: 1},
  {_id: ObjectId(), equipo:ObjectId(), puntos: 1, partidosJugados: 3, partidosGanados: 0, partidosEmpatados: 1, partidosPerdidos: 2},
  {_id: ObjectId(), equipo:ObjectId(), puntos: 0, partidosJugados: 3, partidosGanados: 0, partidosEmpatados: 0, partidosPerdidos: 3}
])