from pymongo import MongoClient
import random
import time

client = MongoClient('mongodb://localhost:20006/')
db = client.torneoFutbolDB

def insertar_datos_en_coleccion(coleccion, numero_de_documentos):
    inicio = time.time()
    for i in range(numero_de_documentos):
        db[coleccion].insert_one({
            coleccion: coleccion + str(i + 1000000),  # Asegúrate de cambiar el rango para evitar duplicados
            "Nombres": "Recuento de " + coleccion + " " + str(i + 1000000),
            "date": time.time()
        })
    fin = time.time()
    print(f"Tiempo de inserción en {coleccion}: {fin - inicio} segundos")

# Ajusta el número de documentos según tus necesidades
insertar_datos_en_coleccion("equipo", 1000000)
insertar_datos_en_coleccion("jugadores", 1000000)
insertar_datos_en_coleccion("estadios", 1000000)




def medir_tiempo_de_consulta(coleccion, filtro):
    inicio = time.time()
    documentos = list(db[coleccion].find(filtro))
    fin = time.time()
    print(f"Tiempo de consulta en {coleccion}: {fin - inicio} segundos")

medir_tiempo_de_consulta("equipo", {"equipo": {"$regex": "^equipo1"}})
medir_tiempo_de_consulta("jugadores", {"jugador": {"$regex": "^jugador1"}})
medir_tiempo_de_consulta("estadios", {"estadio": {"$regex": "^estadio1"}})