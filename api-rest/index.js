import express from 'express';
import mysql from 'mysql2';
import bodyParser from 'body-parser';
import cors from 'cors';

const app = express();

app.use(bodyParser.json());
app.use(cors());

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    port: 3306,
    database: 'gestion_tareas'
});

db.connect(error => {
    if (error) {
        console.log("Error al establecer la conexion");
        return;
    }
    console.log("Conexion exitosa");
});

app.listen(5000, () => {
    console.log("Server listening on Port 5000");
    console.log("http://localhost:5000");
});

app.get("/", (req, res) => {
    res.send("Bienvenidos a mi API");
});

// CRUD para empleados
app.get("/empleados", (req, res) => {
    const query = "SELECT * FROM empleado";
    db.query(query, (error, results) => {
        if (error) {
            res.status(500).send('Error al recibir datos');
            return;
        }
        res.status(200).json(results);
    });
});

app.post("/empleados", (req, res) => {
    const { nombre, correo, telefono } = req.body;
    console.log(req.body);
    const query = "INSERT INTO empleado(nombre, correo, telefono) VALUES(?,?,?)";
    db.query(query, [nombre, correo, telefono], (error, results) => {
        if (error) {
            res.status(500).json('Error al registrar el empleado' + error);
            return;
        }
        res.status(200).json(`Empleado registrado con el ID: ${results.insertId}`);
    });
});

app.put("/empleados/:id", (req, res) => {
    const { id } = req.params;
    const { nombre, correo, telefono } = req.body;
    const query = "UPDATE empleado SET nombre = ?, correo = ?, telefono = ? WHERE id = ?";

    db.query(query, [nombre, correo, telefono, id], (error, results) => {
        if (error) {
            res.status(500).json('Error al actualizar el empleado');
            return;
        }
        if (results.affectedRows === 0) {
            res.status(404).json('Empleado no encontrado');
            return;
        }
        res.status(200).json(`Empleado con ID: ${id} actualizado correctamente`);
    });
});

app.delete("/empleados/:id", (req, res) => {
    const { id } = req.params;
    const query = "DELETE FROM empleado WHERE id = ?";

    db.query(query, [id], (error, results) => {
        if (error) {
            res.status(500).json('Error al eliminar el empleado');
            return;
        }
        if (results.affectedRows === 0) {
            res.status(404).json('Empleado no encontrado');
            return;
        }
        res.status(200).json(`Empleado con ID: ${id} eliminado correctamente`);
    });
});

// CRUD para proyectos
app.get("/proyectos", (req, res) => {
    const query = "SELECT * FROM proyecto";
    db.query(query, (error, results) => {
        if (error) {
            res.status(500).send('Error al recibir datos');
            return;
        }
        res.status(200).json(results);
    });
});

app.post("/proyectos", (req, res) => {
    const { nombre, descripcion, fecha_inicio, fecha_fin } = req.body;
    const query = "INSERT INTO proyecto(nombre, descripcion, fecha_inicio, fecha_fin) VALUES(?,?,?,?)";
    db.query(query, [nombre, descripcion, fecha_inicio, fecha_fin], (error, results) => {
        if (error) {
            res.status(500).json('Error al registrar el proyecto');
            return;
        }
        res.status(200).json(`Proyecto registrado con el ID: ${results.insertId}`);
    });
});

app.put("/proyectos/:id", (req, res) => {
    const { id } = req.params;
    const { nombre, descripcion, fecha_inicio, fecha_fin } = req.body;
    const query = "UPDATE proyecto SET nombre = ?, descripcion = ?, fecha_inicio = ?, fecha_fin = ? WHERE id = ?";

    db.query(query, [nombre, descripcion, fecha_inicio, fecha_fin, id], (error, results) => {
        if (error) {
            res.status(500).json('Error al actualizar el proyecto');
            return;
        }
        if (results.affectedRows === 0) {
            res.status(404).json('Proyecto no encontrado');
            return;
        }
        res.status(200).json(`Proyecto con ID: ${id} actualizado correctamente`);
    });
});

app.delete("/proyectos/:id", (req, res) => {
    const { id } = req.params;
    const query = "DELETE FROM proyecto WHERE id = ?";

    db.query(query, [id], (error, results) => {
        if (error) {
            res.status(500).json('Error al eliminar el proyecto');
            return;
        }
        if (results.affectedRows === 0) {
            res.status(404).json('Proyecto no encontrado');
            return;
        }
        res.status(200).json(`Proyecto con ID: ${id} eliminado correctamente`);
    });
});

// CRUD para tareas
app.get("/tareas", (req, res) => {
    const query = "SELECT * FROM tarea";
    db.query(query, (error, results) => {
        if (error) {
            res.status(500).send('Error al recibir datos');
            return;
        }
        res.status(200).json(results);
    });
});

app.post("/tareas", (req, res) => {
    const { nombre, descripcion, fecha_inicio, fecha_fin, id_proyecto } = req.body;
    const query = "INSERT INTO tarea(nombre, descripcion, fecha_inicio, fecha_fin, id_proyecto) VALUES(?,?,?,?,?)";
    db.query(query, [nombre, descripcion, fecha_inicio, fecha_fin, id_proyecto], (error, results) => {
        if (error) {
            res.status(500).json('Error al registrar la tarea');
            return;
        }
        res.status(200).json(`Tarea registrada con el ID: ${results.insertId}`);
    });
});

app.put("/tareas/:id", (req, res) => {
    const { id } = req.params;
    const { nombre, descripcion, fecha_inicio, fecha_fin, id_proyecto } = req.body;
    const query = "UPDATE tarea SET nombre = ?, descripcion = ?, fecha_inicio = ?, fecha_fin = ?, id_proyecto = ? WHERE id = ?";

    db.query(query, [nombre, descripcion, fecha_inicio, fecha_fin, id_proyecto, id], (error, results) => {
        if (error) {
            res.status(500).json('Error al actualizar la tarea');
            return;
        }
        if (results.affectedRows === 0) {
            res.status(404).json('Tarea no encontrada');
            return;
        }
        res.status(200).json(`Tarea con ID: ${id} actualizada correctamente`);
    });
});

app.delete("/tareas/:id", (req, res) => {
    const { id } = req.params;
    const query = "DELETE FROM tarea WHERE id = ?";

    db.query(query, [id], (error, results) => {
        if (error) {
            res.status(500).json('Error al eliminar la tarea');
            return;
        }
        if (results.affectedRows === 0) {
            res.status(404).json('Tarea no encontrada');
            return;
        }
        res.status(200).json(`Tarea con ID: ${id} eliminada correctamente`);
    });
});

// CRUD para tarea_empleado
app.get("/tarea_empleados", (req, res) => {
    const query = "SELECT * FROM tarea_empleado";
    db.query(query, (error, results) => {
        if (error) {
            res.status(500).send('Error al recibir datos');
            return;
        }
        res.status(200).json(results);
    });
});

app.post("/tarea_empleados", (req, res) => {
    const { id_tarea, id_empleado, fecha_asignacion } = req.body;
    const query = "INSERT INTO tarea_empleado(id_tarea, id_empleado, fecha_asignacion) VALUES(?,?,?)";
    db.query(query, [id_tarea, id_empleado, fecha_asignacion], (error, results) => {
        if (error) {
            res.status(500).json('Error al registrar la tarea_empleado');
            return;
        }
        res.status(200).json(`Tarea_empleado registrada con el ID: ${results.insertId}`);
    });
});

app.put("/tarea_empleados/:id", (req, res) => {
    const { id } = req.params;
    const { id_tarea, id_empleado, fecha_asignacion } = req.body;
    const query = "UPDATE tarea_empleado SET id_tarea = ?, id_empleado = ?, fecha_asignacion = ? WHERE id = ?";

    db.query(query, [id_tarea, id_empleado, fecha_asignacion, id], (error, results) => {
        if (error) {
            res.status(500).json('Error al actualizar la tarea_empleado');
            return;
        }
        if (results.affectedRows === 0) {
            res.status(404).json('Tarea_empleado no encontrada');
            return;
        }
        res.status(200).json(`Tarea_empleado con ID: ${id} actualizada correctamente`);
    });
});

app.delete("/tarea_empleados/:id", (req, res) => {
    const { id } = req.params;
    const query = "DELETE FROM tarea_empleado WHERE id = ?";

    db.query(query, [id], (error, results) => {
        if (error) {
            res.status(500).json('Error al eliminar la tarea_empleado');
            return;
        }
        if (results.affectedRows === 0) {
            res.status(404).json('Tarea_empleado no encontrada');
            return;
        }
        res.status(200).json(`Tarea_empleado con ID: ${id} eliminada correctamente`);
    });
});