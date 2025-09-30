import sqlite3
from pathlib import Path

#ruta de la base de datos
DB_PATH = Path("/home/weslei/learn_prog/sql-lite/Northwind.db"  ) 
#comprobar que existe la base de datos
assert DB_PATH.exists(), f"No existe la base en: {DB_PATH}"

square = lambda n : n*n  # noqa: E731

try:
    with sqlite3.connect(DB_PATH) as conn:
        conn.create_function("square",1,square)
        cursor = conn.cursor()
        cursor.execute('SELECT *, square(Price) as Precio_al_cuadrado FROM Products WHERE Price > 0')
        results = cursor.fetchall()
        for row in results:
            print(row)
except sqlite3.Error as e:
    print(f"Error en la base de datos: {e}")




#conectarse a la base de datos
# conn = sqlite3.connect(DB_PATH)
# conn.create_function("square",1,square)

#creando cursor para hacer consulta a la base de datos
# cursor = conn.cursor()
# cursor.execute(
#     '''
#     SELECT * FROM Products
#     '''
# )

# results = cursor.fetchall()

# conn.commit()
# cursor.close()
# conn.close()

# for row in results:
#     print(row)


