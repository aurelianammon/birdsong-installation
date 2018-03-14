class Visitor {

	PVector pos;
	int radius = 100;

	Visitor() {

		this.pos = new PVector(mouseX, mouseY);
	}

	void draw() {

		fill(0, 0.5);
		ellipse(pos.x, pos.y, radius, radius);
	}

	void update() {

		this.pos = new PVector(mouseX, mouseY);
	}
}