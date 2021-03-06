"
I am a paint provider.

I am responsible for creation of backen specific  paints, for example linear or radial gradients, surface paint or a color paint out of Color.

Concrete backend specific implementations must override and implement all my methods to return a new paint objects.

Public API and Key Messages

- color: create a color paint from Color. It is recommended to make Color be polymorphic with Paint
- linearGradient - return a new linear gradient object that implements TSpartaLinearGradientPaint
- radialGradient - return a new radial gradient object that implements TSpartaRadialGradientPaint

   canvas paint linearGradient
	stops: { 0 -> Color red. 1 -> Color blue};
	begin: 0@0;
	end: 100@100
 
Internal Representation and Key Implementation Points.


    My subclasses must provide backend specific paints

"
Class {
	#name : #SpartaPaintProvider,
	#superclass : #SpartaAbstractBuilder,
	#category : #'Sparta-Core-Builders'
}

{ #category : #paints }
SpartaPaintProvider >> boxShadow [
	true ifFalse: [ self subclassResponsibility ].

	^ SpartaUnimplementedBoxShadowPaint new
]

{ #category : #paints }
SpartaPaintProvider >> color: aColor [
	"A Color is already a paint in Sparta"

	^ aColor
]

{ #category : #paints }
SpartaPaintProvider >> form: aForm [
	"A form is already a paint in Sparta"

	^ aForm
]

{ #category : #paints }
SpartaPaintProvider >> linearGradient [
	true ifFalse: [ self subclassResponsibility ].

	^ SpartaUnimplementedLinearGradientPaint new
]

{ #category : #paints }
SpartaPaintProvider >> radialGradient [
	true ifFalse: [ self subclassResponsibility ].

	^ SpartaUnimplementedRadialGradientPaint new
]

{ #category : #paints }
SpartaPaintProvider >> surface [
	true ifFalse: [ self subclassResponsibility ].

	^ SpartaUnimplementedSurfacePaint new
]
