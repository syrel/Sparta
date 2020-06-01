Class {
	#name : #SkiaPicture,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-External'
}

{ #category : #'private - ffi' }
SkiaPicture class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_picture_drop(void* aHandle))
]

{ #category : #'gt-extension' }
SkiaPicture >> asForm [
	| aCanvas |
	
	aCanvas := SkiaCanvas extent: self bounds extent ceiling asIntegerPoint.
	self playbackOn: aCanvas surfaceCanvas.
	
	^ aCanvas asForm
]

{ #category : #accessing }
SkiaPicture >> bounds [
	<return: #Rectangle>

	^ (SkiaRectangleF32 fromNativeHandle: self primCullRect) asRectangle
]

{ #category : #'gt-extension' }
SkiaPicture >> gtInfoFor: aView [
	<gtView>

	^ ({
		#uniqueId -> self uniqueId.
		#bounds -> self bounds.
	 } asOrderedDictionary gtItemsFor: aView)
			title: 'Info';
			priority: 2
]

{ #category : #accessing }
SkiaPicture >> isEmpty [
	<return: #Boolean>
	
	^ self primIsEmpty
]

{ #category : #accessing }
SkiaPicture >> playbackOn: aCanvas [
	self primPlaybackOn: aCanvas
]

{ #category : #'private - ffi' }
SkiaPicture >> primCullRect [
	^ self ffiCall: #(void* skia_picture_cull_rect(self))
]

{ #category : #'private - ffi' }
SkiaPicture >> primIsEmpty [
	^ self ffiCall: #(bool skia_picture_is_empty(self))
]

{ #category : #'private - ffi' }
SkiaPicture >> primPlaybackOn: aCanvas [
	^ self ffiCall: #(void skia_picture_playback(self, SkiaSurfaceCanvas aCanvas))
]

{ #category : #'private - ffi' }
SkiaPicture >> primUniqueId [
	^ self ffiCall: #(uint32 skia_picture_unique_id(self))
]

{ #category : #accessing }
SkiaPicture >> uniqueId [
	<return: #Number>

	^ self primUniqueId
]