#include <iostream>
#include <string>
#include <vector>

using namespace std;

struct Libro {
    int id_libro, anio_publicacion, ejemplares_disponibles;
    string titulo, autor;
};

struct Usuario {
    int id_usuario;
    string nombre;
    string apellido,email;
};

struct Prestamo {
    int id_prestamo, id_usuario, id_libro;
    string fecha_prestamo, fecha_devolucion;
};


void registrarLibros(vector<Libro>& libros) {
    if (libros.size() < 50) {
        Libro libro;

        cout << "Ingrese ID del libro: ";
        cin >> libro.id_libro;

        cout << "Ingrese titulo: ";
        cin >> libro.titulo;

        cout << "Ingrese autor: ";
        cin >> libro.autor;

        cout << "Ingrese anio de publicacion: ";
        cin >> libro.anio_publicacion;

        cout << "Ingrese ejemplares disponibles: ";
        cin >> libro.ejemplares_disponibles;

        libros.push_back(libro);

        cout << "Libro registrado exitosamente." << endl;
    } else {
        cout << "Limite de libros alcanzado." << endl;
    }
}

void registrarUsuarios(vector<Usuario>& usuarios) {
    if (usuarios.size() < 30) {
        Usuario usuario;

        cout << "Ingrese ID del usuario: ";
        cin >> usuario.id_usuario;

        cout << "Ingrese el nombre: ";
        cin >> usuario.nombre;

        cout << "Ingrese el apellido: ";
        cin >> usuario.apellido;

        cout << "Ingrese el gmail: ";
        cin >> usuario.email;

        usuarios.push_back(usuario);

        cout << "Usuario registrado." << endl;
    } else {
        cout << "Limite de usuarios alcanzado." << endl;
    }
}

void consultarLibros(vector<Libro>& libros) {
    if (libros.empty()) {
        cout << "No hay libros registrados." << endl;
    } else {
        cout << "Libros disponibles:" << endl;
        for (int i = 0; i < libros.size(); i++) {
            cout << "ID: " << libros[i].id_libro
                 << " | Titulo: " << libros[i].titulo
                 << " | Autor: " << libros[i].autor
                 << " | Anio: " << libros[i].anio_publicacion
                 << " | Ejemplares: " << libros[i].ejemplares_disponibles
                 << endl;
        }
    }
}

void realizarPrestamo(vector<Prestamo>& prestamos, vector<Libro>& libros) {
    if (prestamos.size() < 30) {

        Prestamo prestamo;

        cout << "Ingrese ID del prestamo: ";
        cin >> prestamo.id_prestamo;

        cout << "Ingrese ID del usuario: ";
        cin >> prestamo.id_usuario;

        cout << "Ingrese ID del libro: ";
        cin >> prestamo.id_libro;

        bool encontrado = false;

        for (int i = 0; i < libros.size(); i++) {

            if (libros[i].id_libro == prestamo.id_libro) {

                encontrado = true;

                if (libros[i].ejemplares_disponibles > 0) {

                    cout << "Ingrese fecha de prestamo: ";
                    cin >> prestamo.fecha_prestamo;

                    prestamos.push_back(prestamo);
                    libros[i].ejemplares_disponibles--;

                    cout << "Prestamo realizado correctamente." << endl;

                } else {
                    cout << "No hay ejemplares disponibles." << endl;
                }

                break;
            }
        }

        if (!encontrado) {
            cout << "Libro no encontrado." << endl;
        }

    } else {
        cout << "Limite de prestamos alcanzado." << endl;
    }
}

void registrarDevolucion(vector<Prestamo>& prestamos, vector<Libro>& libros) {
    int id;
    cout << "Ingrese ID del prestamo: ";
    cin >> id;

    bool encontrado = false;

    for (int i = 0; i < prestamos.size(); i++) {

        if (prestamos[i].id_prestamo == id) {

            encontrado = true;

            for (int j = 0; j < libros.size(); j++) {

                if (libros[j].id_libro == prestamos[i].id_libro) {

                    libros[j].ejemplares_disponibles++;
                    cout << "Devolucion registrada." << endl;

                    break;
                }
            }

            break;
        }
    }

    if (!encontrado) {
        cout << "Prestamo no encontrado." << endl;
    }
}



int main() {
    int opcion;
    bool salir = false;

    vector<Libro> libros;
    vector<Usuario> usuarios;
    vector<Prestamo> prestamos;

    while (!salir) {
        cout << "--- MENU DE OPCIONES ---" << endl;
        cout << "1. Registrar libros" << endl;
        cout << "2. Registrar usuarios" << endl;
        cout << "3. Consultar libros disponibles" << endl;
        cout << "4. Realizar prestamo" << endl;
        cout << "5. Registrar devolucion" << endl;
        cout << "6. Salir" << endl;
        cout << "Ingrese una opcion: ";
        cin >> opcion;

        switch (opcion) {
            case 1:
                registrarLibros(libros);
                break;
            case 2:
                registrarUsuarios(usuarios);
                break;
            case 3:
                consultarLibros(libros);
                break;
            case 4:
                realizarPrestamo(prestamos, libros);
                break;
            case 5:
                registrarDevolucion(prestamos, libros);
                break;
            case 6:
                salir = true;
                cout << "Saliendo del programa..." << endl;
                break;
            default:
                cout << "Opcion invalida." << endl;
        }

        cout << endl;
    }

    return 0;
}