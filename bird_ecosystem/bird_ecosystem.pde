//bird ecosystem

ArrayList<Tree> treeList = new ArrayList<Tree>();
Visitor visitor = new Visitor();

void setup() {
	size(600, 300);
	treeList.add(new Tree(100, 200));
	treeList.add(new Tree(200, 100));
}

void draw() {

	background(255);

	drawTrees();
	visitor.update();
	visitor.draw();
}

void drawTrees() {

	for (int i = 0; i < treeList.size(); i++) {
		treeList.get(i).draw();
	}
}