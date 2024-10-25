from fastapi import FastAPI, HTTPException, Query
from fastapi.responses import StreamingResponse
from datetime import datetime, timedelta
from random import randint, uniform, choice
import csv
import io


app = FastAPI()


CATEGORIAS_INGRESOS = {
    "Salario": (1000, 3000),  
    "Inversiones": (50, 500), 
    "Premios": (10, 1000)
}

CATEGORIAS_GASTOS = {
    "Alquiler": (500, 1200),
    "Comida": (50, 300),
    "Transporte": (20, 150),
    "Entretenimiento": (10, 200),
    "Compras": (5, 500)
}


def generar_perfil_usuario(id_usuario):
    perfiles = {
        "id_usuario": id_usuario,
        "nombre": f"Usuario_{id_usuario}",
        "edad": randint(18, 70),
        "balance_cuenta": round(uniform(1000, 10000), 2),
        "tipo_cuenta": choice(["Ahorros", "Corriente"]),
        "fecha_creacion": datetime.now().strftime("%Y-%m-%d"),
    }
    return perfiles


def categorizar_transaccion(monto):
    if monto >= 0:
       
        categoria, rango = choice(list(CATEGORIAS_INGRESOS.items()))
        monto = round(uniform(rango[0], rango[1]), 2)
        return {
            "tipo": "Ingreso",
            "categoria": categoria,
            "monto": monto
        }
    else:
        
        categoria, rango = choice(list(CATEGORIAS_GASTOS.items()))
        monto = round(-uniform(rango[0], rango[1]), 2)
        return {
            "tipo": "Gasto",
            "categoria": categoria,
            "monto": monto
        }


def generar_transacciones(cantidad, fecha_inicio, fecha_fin):
    transacciones = []
    for i in range(cantidad):
        monto = round(uniform(-500, 500), 2)  
        fecha_transaccion = fecha_inicio + timedelta(days=randint(0, (fecha_fin - fecha_inicio).days))
        transaccion = categorizar_transaccion(monto)
        transaccion.update({
            "id_transaccion": i + 1,
            "fecha": fecha_transaccion.strftime("%Y-%m-%d")
        })
        transacciones.append(transaccion)
    return transacciones


@app.get("/generar-transacciones")
async def generar_transacciones_csv(
    cantidad: int = Query(..., description="Cantidad de transacciones a generar"),
    fecha_inicio: str = Query(..., description="Fecha de inicio en formato YYYY-MM-DD"),
    fecha_fin: str = Query(..., description="Fecha de fin en formato YYYY-MM-DD")
):
    
    try:
        fecha_inicio_dt = datetime.strptime(fecha_inicio, '%Y-%m-%d')
        fecha_fin_dt = datetime.strptime(fecha_fin, '%Y-%m-%d')
    except ValueError:
        raise HTTPException(status_code=400, detail="Formato de fecha no válido. Use YYYY-MM-DD.")
    
    if fecha_fin_dt < fecha_inicio_dt:
        raise HTTPException(status_code=400, detail="La fecha de fin no puede ser anterior a la fecha de inicio")

    
    usuario = generar_perfil_usuario(randint(1, 1000))  
    transacciones = generar_transacciones(cantidad, fecha_inicio_dt, fecha_fin_dt)

    
    output = io.StringIO()
    writer = csv.writer(output)

    
    writer.writerow(["ID Transacción", "Fecha", "Tipo", "Categoría", "Monto"])

    
    for transaccion in transacciones:
        writer.writerow([
            transaccion["id_transaccion"],
            transaccion["fecha"],
            transaccion["tipo"],
            transaccion["categoria"],
            transaccion["monto"]
        ])

    
    output.seek(0)

    
    return StreamingResponse(output, media_type="text/csv", headers={"Content-Disposition": "attachment;filename=transacciones.csv"})







