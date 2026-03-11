#include <iostream>
#include <vector>
#include <string>

using namespace std;

// Estructuras para representar Libro, Usuario y Prestamo
struct Libro {
    int id_libro;
    string titulo;
    string autor;
    int anio_publicacion;
    int ejemplares_disponibles;
};

struct Usuario {
    int id_usuario;
    string nombre;
    string apellido;
    string email;
};

struct Prestamo {
    int id_prestamo;
    int id_usuario;
    int id_libro;
    string fecha_prestamo;
    string fecha_devolucion;
};

// Vectores para almacenar los registros
vector<Libro> libros;
vector<Usuario> usuarios;
vector<Prestamo> prestamos;

int contador_libros = 1;
int contador_usuarios = 1;
int contador_prestamos = 1;

// FUNCIONALIDAD 1: Registrar Libro
void registrarLibro() {
    cout << "\n=== REGISTRAR LIBRO ===" << endl;
    
    Libro nuevoLibro;
    nuevoLibro.id_libro = contador_libros++;
    
    cout << "Titulo: ";
    cin.ignore();
    getline(cin, nuevoLibro.titulo);
    
    cout << "Autor: ";
    getline(cin, nuevoLibro.autor);
    
    cout << "Año de publicacion: ";
    cin >> nuevoLibro.anio_publicacion;
    
    cout << "Ejemplares disponibles: ";
    cin >> nuevoLibro.ejemplares_disponibles;
    
    libros.push_back(nuevoLibro);
    cout << "Libro registrado con ID: " << nuevoLibro.id_libro << endl;
}

// FUNCIONALIDAD 2: Registrar Usuario
void registrarUsuario() {
    cout << "\n=== REGISTRAR USUARIO ===" << endl;
    
    Usuario nuevoUsuario;
    nuevoUsuario.id_usuario = contador_usuarios++;
    
    cout << "Nombre: ";
    cin.ignore();
    getline(cin, nuevoUsuario.nombre);
    
    cout << "Apellido: ";
    getline(cin, nuevoUsuario.apellido);
    
    cout << "Email: ";
    getline(cin, nuevoUsuario.email);
    
    usuarios.push_back(nuevoUsuario);
    cout << "Usuario registrado con ID: " << nuevoUsuario.id_usuario << endl;
}

// FUNCIONALIDAD 3: Consultar Libros
void consultarLibros() {
    cout << "\n=== CONSULTAR LIBROS ===" << endl;
    
    if (libros.empty()) {
        cout << "No hay libros registrados." << endl;
        return;
    }
    
    for (int i = 0; i < libros.size(); i++) {
        cout << "\nLibro " << (i + 1) << ":" << endl;
        cout << "  ID: " << libros[i].id_libro << endl;
        cout << "  Titulo: " << libros[i].titulo << endl;
        cout << "  Autor: " << libros[i].autor << endl;
        cout << "  Año: " << libros[i].anio_publicacion << endl;
        cout << "  Ejemplares disponibles: " << libros[i].ejemplares_disponibles << endl;
    }
}

// FUNCIONALIDAD 4: Realizar Préstamo
void realizarPrestamo() {
    cout << "\n=== REALIZAR PRESTAMO ===" << endl;
    
    if (libros.empty() || usuarios.empty()) {
        cout << "Debe haber libros y usuarios registrados." << endl;
        return;
    }
    
    int id_usuario, id_libro;
    
    cout << "ID del usuario: ";
    cin >> id_usuario;
    
    cout << "ID del libro: ";
    cin >> id_libro;
    
    // Verificar usuario
    bool usuarioExiste = false;
    for (int i = 0; i < usuarios.size(); i++) {
        if (usuarios[i].id_usuario == id_usuario) {
            usuarioExiste = true;
            break;
        }
    }
    
    if (!usuarioExiste) {
        cout << "Usuario no encontrado." << endl;
        return;
    }
    
    // Verificar libro y disponibilidad
    bool libroEncontrado = false;
    for (int i = 0; i < libros.size(); i++) {
        if (libros[i].id_libro == id_libro) {
            libroEncontrado = true;
            
            if (libros[i].ejemplares_disponibles > 0) {
                Prestamo nuevoPrestamo;
                nuevoPrestamo.id_prestamo = contador_prestamos++;
                nuevoPrestamo.id_usuario = id_usuario;
                nuevoPrestamo.id_libro = id_libro;
                nuevoPrestamo.fecha_prestamo = "01/01/2026";
                nuevoPrestamo.fecha_devolucion = "---";
                
                prestamos.push_back(nuevoPrestamo);
                libros[i].ejemplares_disponibles--;
                
                cout << "Prestamo realizado con ID: " << nuevoPrestamo.id_prestamo << endl;
            } else {
                cout << "No hay ejemplares disponibles." << endl;
            }
            break;
        }
    }
    
    if (!libroEncontrado) {
        cout << "Libro no encontrado." << endl;
    }
}

// FUNCIONALIDAD 5: Registrar Devolución
void registrarDevolucion() {
    cout << "\n=== REGISTRAR DEVOLUCION ===" << endl;
    
    if (prestamos.empty()) {
        cout << "No hay prestamos registrados." << endl;
        return;
    }
    
    int id_prestamo;
    cout << "ID del prestamo a devolver: ";
    cin >> id_prestamo;
    
    bool prestamoEncontrado = false;
    for (int i = 0; i < prestamos.size(); i++) {
        if (prestamos[i].id_prestamo == id_prestamo && prestamos[i].fecha_devolucion == "---") {
            prestamoEncontrado = true;
            prestamos[i].fecha_devolucion = "01/02/2026";
            
            // Incrementar ejemplares
            for (int j = 0; j < libros.size(); j++) {
                if (libros[j].id_libro == prestamos[i].id_libro) {
                    libros[j].ejemplares_disponibles++;
                    break;
                }
            }
            
            cout << "Devolucion registrada correctamente." << endl;
            break;
        }
    }
    
    if (!prestamoEncontrado) {
        cout << "Prestamo no encontrado o ya ha sido devuelto." << endl;
    }
}

// FUNCIONALIDAD 6: Historial de Usuario
void historialUsuario() {
    cout << "\n=== HISTORIAL DE USUARIO ===" << endl;
    
    int id_usuario;
    cout << "ID del usuario: ";
    cin >> id_usuario;
    
    // Buscar usuario
    bool usuarioExiste = false;
    string nombre_usuario;
    
    for (int i = 0; i < usuarios.size(); i++) {
        if (usuarios[i].id_usuario == id_usuario) {
            usuarioExiste = true;
            nombre_usuario = usuarios[i].nombre + " " + usuarios[i].apellido;
            break;
        }
    }
    
    if (!usuarioExiste) {
        cout << "Usuario no encontrado." << endl;
        return;
    }
    
    cout << "Usuario: " << nombre_usuario << endl;
    cout << "\nPrestamos realizados:" << endl;
    
    bool tieneHistorial = false;
    for (int i = 0; i < prestamos.size(); i++) {
        if (prestamos[i].id_usuario == id_usuario) {
            tieneHistorial = true;
            cout << "  ID Prestamo: " << prestamos[i].id_prestamo << endl;
            cout << "  ID Libro: " << prestamos[i].id_libro << endl;
            cout << "  Fecha Prestamo: " << prestamos[i].fecha_prestamo << endl;
            cout << "  Fecha Devolucion: " << prestamos[i].fecha_devolucion << endl;
            cout << endl;
        }
    }
    
    if (!tieneHistorial) {
        cout << "Este usuario no tiene historial de prestamos." << endl;
    }
}

// Menú principal con switch-if-else
int main() {
    int opcion;
    
    do {
        cout << "\n===== SISTEMA DE GESTION DE BIBLIOTECA =====" << endl;
        cout << "1. Registrar Libro" << endl;
        cout << "2. Registrar Usuario" << endl;
        cout << "3. Consultar Libros" << endl;
        cout << "4. Realizar Prestamo" << endl;
        cout << "5. Registrar Devolucion" << endl;
        cout << "6. Historial de Usuario" << endl;
        cout << "7. Salir" << endl;
        cout << "============================================" << endl;
        cout << "Seleccione una opcion: ";
        cin >> opcion;
        
        switch (opcion) {
            case 1:
                registrarLibro();
                break;
            case 2:
                registrarUsuario();
                break;
            case 3:
                consultarLibros();
                break;
            case 4:
                realizarPrestamo();
                break;
            case 5:
                registrarDevolucion();
                break;
            case 6:
                historialUsuario();
                break;
            case 7:
                cout << "Hasta luego!" << endl;
                break;
            default:
                cout << "Opcion no valida." << endl;
        }
    } while (opcion != 7);
    
    return 0;
}
