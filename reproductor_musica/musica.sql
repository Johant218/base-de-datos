-- Tabla de Usuarios
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(50) NOT NULL
);

-- Tabla de Lista de Reproducción
CREATE TABLE lista_reproduccion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cancion VARCHAR(255) NOT NULL,
    usuario_id INT,
    tiempo_agregado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

<?php
$host = "localhost";
$username = "tu_usuario";
$password = "tu_contraseña";
$database = "reproductor_musica";

// Crear una conexión a la base de datos
$conn = new mysqli($host, $username, $password, $database);

// Verificar la conexión
if ($conn->connect_error) {
    die("Error de conexión a la base de datos: " . $conn->connect_error);
}
?>

<?php
// Obtener el nombre de usuario desde el formulario
$nombre_usuario = $_POST['nombre_usuario'];

// Insertar el nuevo usuario en la tabla de usuarios
$sql = "INSERT INTO usuarios (nombre_usuario) VALUES ('$nombre_usuario')";

if ($conn->query($sql) === TRUE) {
    echo "Usuario registrado con éxito.";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

// Cerrar la conexión a la base de datos
$conn->close();
?>

<?php
// Obtener el ID de usuario y la canción desde el formulario
$usuario_id = $_POST['usuario_id'];
$cancion = $_POST['cancion'];

// Insertar la nueva canción en la lista de reproducción
$sql = "INSERT INTO lista_reproduccion (cancion, usuario_id) VALUES ('$cancion', $usuario_id)";

if ($conn->query($sql) === TRUE) {
    echo "Canción agregada a la lista de reproducción con éxito.";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

// Cerrar la conexión a la base de datos
$conn->close();
?>