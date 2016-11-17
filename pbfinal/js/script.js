var x, y;
var velX, velY;

function setup() {
    createCanvas(windowWidth, windowHeight);
    
    x = width / 2;
    y = height / 2;
    velX = round(random()*3);
    velY = round(random()*3);
}

function draw() {
    background(191);
    ellipse(x, y, 10, 10);
    if (x > width || x < 0) {
        velX = -velX;
    }
    x += velX;
    if (y > height || y < 0) {
        velY = -velY;
    }
    y+= velY;
}

