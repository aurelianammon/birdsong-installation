class Tree {

	PVector pos;
	int radius = 10;

	Tree(int x, int y) {
		this.pos = new PVector(x, y);
	}

	void draw() {
		rect(pos.x, pos.y, radius, radius);
	}
}
