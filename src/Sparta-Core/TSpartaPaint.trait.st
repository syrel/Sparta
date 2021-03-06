"
! TSpartaPaint

I define an API of a Paint. Backend specific paints  should use me and provide concrete implemenations of all my methods.

!! Overview
A paint is transformable and can be used with one of extend modes, for example repeat, reflect or clamp.

I am instantiated by canvas and does not supposed to be created by refering paint class directly.
Sparta canvas provides a paint builder that should be used to build concerete paints.

!! Public API and Key Messages
''I define an api of an abstract paint.''

- ==transformation== - to get current transformation matrix, can not be mil
- ==transformation:== set new paint transformation. If not set, supposed to be identity.
- ==clamp== - do not repeat me
- ==reflect== - mirror the image
- ==repeat== - repeat in both X and Y axis
- ==repeatX== - repeat only X axis
- ==repeatY== - repeat only Y axis
- ==rotateByDegrees:== rotate me by amount of degrees clockwise
- ==rotateByRadians:== rotate me by amount of radians clockwise
- ==scaleBy:== scale me by a factor, a Point or a number.
- ==translateBy:== translate me by a Point or a number
 
!! Internal Representation and Key Implementation Points.

Generally, a Paint is not meant to be an external object, however for additional flexibility I am implemented as a Trait.

"
Trait {
	#name : #TSpartaPaint,
	#category : #'Sparta-Core-Paints'
}

{ #category : #converting }
TSpartaPaint >> asSpartaPaintOn: aSpartaCanvas [
	^ self
]

{ #category : #'extend modes' }
TSpartaPaint >> clamp [
	"Do not repeat"
	^ self explicitRequirement
]

{ #category : #'extend modes' }
TSpartaPaint >> reflect [
	"Mirror the image"
	^ self explicitRequirement
]

{ #category : #'extend modes' }
TSpartaPaint >> repeat [
	"Repeat in both axis"
	^ self explicitRequirement
]

{ #category : #'extend modes' }
TSpartaPaint >> repeatX [
	"Only X axis"
	^ self explicitRequirement
]

{ #category : #'extend modes' }
TSpartaPaint >> repeatY [
	"Only Y axis"
	^ self explicitRequirement
]

{ #category : #dispatch }
TSpartaPaint >> spartaFillString: aString with: aTextPainter [
	aTextPainter fillString: aString withPaint: self
]

{ #category : #dispatch }
TSpartaPaint >> spartaFillTextRun: aTextRun with: aTextPainter [
	aTextPainter fillTextRun: aTextRun withPaint: self
]

{ #category : #dispatch }
TSpartaPaint >> spartaMaskOn: aSpartaCanvas with: aMaskPainter [
	aMaskPainter maskPaint: self
]

{ #category : #dispatch }
TSpartaPaint >> spartaStrokeString: aString fillColor: aFillColor with: aTextPainter [
	aTextPainter fillString: aString withColor: aFillColor strokePaint: self
]

{ #category : #dispatch }
TSpartaPaint >> spartaStrokeString: aString fillPaint: aFillPaint with: aTextPainter [
	aTextPainter fillString: aString withPaint: aFillPaint strokePaint: self
]

{ #category : #dispatch }
TSpartaPaint >> spartaStrokeTextRun: aTextRun fillColor: aFillColor with: aTextPainter [
	aTextPainter fillTextRun: aTextRun withColor: aFillColor strokePaint: self
]

{ #category : #dispatch }
TSpartaPaint >> spartaStrokeTextRun: aTextRun fillPaint: aFillPaint with: aTextPainter [
	aTextPainter fillTextRun: aTextRun withPaint: aFillPaint strokePaint: self
]

{ #category : #accessing }
TSpartaPaint >> transformation: aMatrix [
	^ self explicitRequirement
]
