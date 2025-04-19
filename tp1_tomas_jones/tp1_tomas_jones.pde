PImage miFoto;
// dimension de la ventana 
void setup(){
size(800,400);

// cargar la imagen de la variable
miFoto = loadImage("autoretrato.jpeg");
}

void draw() {
// color de fondo
background(200);
// muestro la imagen
image(miFoto , 0 , 0 , 400, 400); 

// rostro
fill(230,186,186);
ellipse(600,215,165,175);
// ojos
fill(255);
ellipse(561,196,33,15);
ellipse(646,193,33,15);
fill(104,175,99);
circle(561,196,10);
circle(646,194,10);
fill(0);
circle(561,196,3);
circle(646,194,3);
//cejas
fill(0);
rect(550,180,28,5,4);
rect(635,178,28,5,4);
// Nariz
textSize(30);
text("db",586,230);
// aro nariz
fill(212,234,211);
circle(587,225,6);
fill(0);
rect(595,203,15,25);
fill(0);
circle(587,225,1);
//boca
fill(247,135,135);
ellipse(600,257,46,7);
fill(247,135,135);
ellipse(600,252,46,5);
noFill();
ellipse(600,255,50,10);
//orejas
fill(0);
textSize(40);
text("d",504,230);
text("b",674,230);
// aro oreja
stroke(0);
noFill();
circle(687,233,10);
fill(255);
circle(687,233,4);
// cuello
fill(230,186,186);
textSize(90);
text("(   )",549,320);
fill(230,186,186);
circle(600,340,80);
ellipse(600,320,360,37);
fill(230,186,186);
textSize(87);
text("O",725,364);
text("O",419,364);
fill(230,186,186);
ellipse(600,350,300,70);
fill(230,186,186);
pushStyle();
noStroke();
rect(415,315,375,60,40);
rect(428,375,350,30,45);
popStyle();
pushStyle();
fill(230,186,186);
noStroke();
circle(604,330,113);
popStyle();
fill(0);
textSize(20);
text("|",648,300);
text("|",553,300);
// cadena
pushStyle();
stroke(215,200,190);
strokeWeight(5);
noFill();
arc(603,303,95,115,0,PI);
popStyle();








  
    






// ubicacion de pixels X Y 
textSize(30);
text((400 + mouseX) + " - " + mouseY, mouseX, mouseY);
}
