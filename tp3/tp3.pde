//https://youtu.be/OGPxu16ynA4
//Tomas Jones/tp3 rec/Com3/IPMI/leg: 124986/9


PImage img1;
color[][] colores;
int cantA = 8;
int cantB = 8;
boolean usarCirculos = false;

void setup() {
  size(800, 400);
  img1 = loadImage("F_16.jpg");
  colores = new color[cantA][cantB];  // inicializo el array aquí
  reiniciar();
}

void draw() {
  background(255);
  image(img1, 0, 0, 400, 400);
  dibujarGrilla();
}

void dibujarGrilla() {
  float anchoCasilla = 400.0 / cantA;
  float altoCasilla = 400.0 / cantB;

  for (int a = 0; a < cantA; a++) {
    for (int b = 0; b < cantB; b++) {
      float x = 400 + a * anchoCasilla;

      // Zigzag fijo: desplazamiento mitad ancho en filas impares
      if (b % 2 == 1) {
        x += anchoCasilla / 2;
      }

      float y = b * altoCasilla;

      if (mousePressed) {  // mantenersolo si el mouse está presionado
        // Centro de la forma
        float centroX = x + anchoCasilla / 2;
        float centroY = y + altoCasilla / 2;

        // Distancia al mouse
        float d = dist(mouseX, mouseY, centroX, centroY);

        // Radio de influencia para apartarse
        float radio = 80;

        if (d < radio) {
          // Vector desde mouse a centro de forma
          float dx = centroX - mouseX;
          float dy = centroY - mouseY;

          // ordeno/normalizo  vector
          float distNorm = sqrt(dx*dx + dy*dy);
          if (distNorm > 0) {
            dx /= distNorm;
            dy /= distNorm;
          }

          //  desplazamiento proporcional a la cercanía
          float fuerza = map(d, 0, radio, 20, 0);

          // Sumo el desplazamiento para "apartar" la forma
          x += dx * fuerza;
          y += dy * fuerza;
        }
      }

      fill(colores[a][b]);
      strokeWeight(2);

      if (usarCirculos) {
        ellipseMode(CORNER);
        ellipse(x, y, anchoCasilla, altoCasilla);
      } else {
        rect(x, y, anchoCasilla, altoCasilla);
      }
    }
  }

  // Líneas horizontales
  stroke(100);
  strokeWeight(2);
  for (int b = 1; b < cantB; b++) {
    float y = b * (400.0 / cantB);
    line(400, y, 800, y);
  }
}

// Función que RETORNA un color según la posición (con parámetros)
color obtenerColor(int a, int b) {
  if ((a + b) % 2 == 0) {
    return color(0);
  } else {
    return color(255);
  }
}

// Función que NO retorna valor y asigna colores blanco y negro usando obtenerColor()
void asignarColoresBlancoNegro(int columnas, int filas) {
  for (int a = 0; a < columnas; a++) {
    for (int b = 0; b < filas; b++) {
      colores[a][b] = obtenerColor(a, b);
    }
  }
}

void asignarColoresAleatorios(int columnas, int filas) {
  for (int a = 0; a < columnas; a++) {
    for (int b = 0; b < filas; b++) {
      colores[a][b] = color(random(255), random(255), random(255));
    }
  }
}



// Función profesional para reiniciar variables a estado original
void reiniciar() {
  asignarColoresBlancoNegro(cantA, cantB);
  usarCirculos = false;
}

void keyPressed() {
  if (key == 'c') {
    asignarColoresAleatorios(cantA, cantB);
  }
  if (key == 'f') {
    usarCirculos = !usarCirculos;
  }
  if (key == 'r' || key == 'R') {
    reiniciar();
  }
}

void mousePressed() {
  reiniciar();
}
