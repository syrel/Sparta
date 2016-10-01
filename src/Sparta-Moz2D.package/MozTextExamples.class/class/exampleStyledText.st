examples - text
exampleStyledText
	| canvas text |
	canvas := MozCanvas extent: 600@400.
	canvas fill
		paint: Color white;
		path: canvas bounds;
		draw.
	
	canvas transform
		translateBy: 20@50;
		apply.

	text := SpText fromString: 'Hello world!'.
	text attributes: { SpFontSizeAttribute new size: 15 } from: 1 to: 5.
	text attributes: { SpFontGenericFamilyAttribute new monospace } from: 1 to: 5.
	text attributes: { SpFontSizeAttribute new size: 20 } from: 7 to: 12.
	text attributes: { SpFontStyleAttribute new italic } from: 7 to: 12.
	text attributes: { SpTextColorAttribute new color: Color red } from: 3 to: 9.

	text drawOn: canvas.

	canvas asForm asMorph openInWindowLabeled: 'Sparta text'